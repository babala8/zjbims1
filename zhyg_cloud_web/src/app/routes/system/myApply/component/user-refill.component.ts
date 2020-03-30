import {Component, OnInit} from '@angular/core';
import {UserService} from '../../user/user.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {OrgService} from '../../org/org.service';
import {RoleService} from '../../role/role.service';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './user-refill.html'
})
export class UserRefillComponent implements OnInit {
    validateForm: FormGroup;
    user;
    org;
    catalogLength;
    devCataloglist = [];
    roles = [];
    loading = false;
    // 检测是否需要审批，由父控件传参
    checkAudit: true;
    // 选择提交机构后，能供选择的角色列表
    commitRoles;
    // 选择提交角色后，能供选择的人员列表
    commitUsers;
    // 提供给直接传业务实体对象的参数
    param;
    isMod: boolean;

    constructor(private fb: FormBuilder,
                private userService: UserService,
                private roleService: RoleService,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private message: NzMessageService) {
    }

    ngOnInit() {
        this.userService.getdevCatalogInfolist().subscribe((data) => {
            this.catalogLength = data.data.length;
            data.data.unshift({no: 'all', name: '全部设备'});
            this.devCataloglist = data.data;
        });
        // 初始化控件验证规则
        this.initValidateForm();
        // 判断使用哪个数据源
        this.setParamData();
    }

    initValidateForm() {
        if (this.checkAudit) {
            this.validateForm = this.fb.group({
                no: [null, [Validators.required, Validators.minLength(4), Validators.maxLength(20)]],
                name: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(10)]],
                org: [null, [Validators.required]],
                roleNo: [null, [Validators.required]],
                devCatalog: [null, [Validators.required]],
                phone: [null, Validators.maxLength(20)],
                mobile: [null, Validators.maxLength(20)],
                email: [null, Validators.maxLength(40)],
                commitOrg: [null, [Validators.required]],
                commitRole: [null, [Validators.required]],
                commitUser: [null],
                commitNote: [null],
            });
        }

    }


    // 根据传入的实体设置页面的数据
    setParamData() {
        if (this.param.orgNo !== null) {
            this.orgService.getOrg(this.param.orgNo).subscribe(data => {
                this.org = data.data;
                const param = {
                    orgNo: this.param.orgNo
                };
                this.validateForm.controls.org.setValue({
                    no: this.org.no,
                    name: this.org.name
                } || {});
                this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data1 => {
                    this.roles = data1.data;
                    if ( this.param.devCatalog != null) {
                        this.param.devCatalog = this.param.devCatalog.split('|');
                    }
                    const roleNos = this.param.roleNo.split('|');
                    this.validateForm.controls.no.setValue(this.param.no);
                    this.validateForm.controls.name.setValue(this.param.name);
                    this.validateForm.controls.devCatalog.setValue(this.param.devCatalog);
                    this.validateForm.controls.phone.setValue(this.param.phone);
                    this.validateForm.controls.mobile.setValue(this.param.mobile);
                    this.validateForm.controls.email.setValue(this.param.email);
                    this.validateForm.controls.org.setValue({
                        no: this.org.no,
                        name: this.org.name
                    } || {});
                    this.validateForm.controls.roleNo.setValue(roleNos);

                });
            });
            if (this.isMod) {
                this.userService.getUser(this.param.no).subscribe(data2 => {
                    this.user = data2.data;
                });
            }
        }


    }


    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
    }

    selectCommitRole($event) {
        this.validateForm.controls.commitRole.setValue(null);
        const param = {
            orgNo: $event.no
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            this.commitRoles = data.data;
        });
    }

    getUserByRole($event) {
        this.validateForm.controls.commitUser.setValue(null);
        const param = {
            roleNo: $event,
            orgNo: this.validateForm.controls.commitOrg.value.no,
        };
        this.userService.getUserByPage(param).subscribe(data => {
            this.commitUsers = data.data;
        });
    }

    selectRole($event) {
        console.log($event);
        const param = {
            orgNo: this.validateForm.controls.commitOrg.value.no,
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            this.roles = data.data;
        });

    }

    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }
        let tmpRoleNos = '';
        const value = this.validateForm.controls.roleNo.value;
        console.log(value);
        if (value) {
            for (let j = 0; j < value.length; j++) {
                const tmp = this.validateForm.controls.roleNo.value[j];
                tmpRoleNos += '|' + tmp;
            }
            tmpRoleNos = tmpRoleNos.substring(1);
        }
        let tmpCatalogs = '';
        let i = 0;
        const value1 = this.validateForm.controls.devCatalog.value;
        console.log(value1);
        if (value1) {
            for (let j = 0; j < value1.length; j++) {
                const tmp = this.validateForm.controls.devCatalog.value[j];
                if (tmp == 'all') {
                    i = 1;
                }
                tmpCatalogs += '|' + tmp;
            }
            tmpCatalogs = tmpCatalogs.substring(1);
        }
        if (i == 1 || value1.length >= this.catalogLength) {
            tmpCatalogs = 'all';
        }
        let params = {};
        if (this.isMod) {
            params = {
                no: this.validateForm.controls.no.value,
                name: this.validateForm.controls.name.value,
                roleNo: tmpRoleNos,
                orgNo: this.validateForm.controls.org.value.no,
                devCatalog: tmpCatalogs,
                phone: this.validateForm.controls.phone.value,
                mobile: this.validateForm.controls.mobile.value,
                email: this.validateForm.controls.email.value,
            };
        } else {
            params = {
                no: this.validateForm.controls.no.value,
                name: this.validateForm.controls.name.value,
                roleNo: tmpRoleNos,
                orgNo: this.validateForm.controls.org.value.no,
                devCatalog: tmpCatalogs,
                phone: this.validateForm.controls.phone.value,
                mobile: this.validateForm.controls.mobile.value,
                email: this.validateForm.controls.email.value,
                passwd: 'abcd1234',
                onlineFlag: '0',
                status: 1,
            };
        }

        let auditParams = {};
        if (this.checkAudit) {
            let note = this.validateForm.controls.commitNote.value || '';
            if (note != null && note != '') {
                // 请求头不能允许中文，前端要编码，后端要解码
                note = encodeURIComponent(note);
            }
            auditParams = {
                // 审批相关数据
                auditFlag: String(this.checkAudit) || '',
                commitOrg: this.validateForm.controls.commitOrg.value.no || '',
                commitRole: this.validateForm.controls.commitRole.value || '',
                commitUser: this.validateForm.controls.commitUser.value || '',
                commitNote: note || '',
                //  commitNote:'123321',
            };
        }
        console.log(params);
        this.loading = true;
        if (this.isMod) {
            this.userService.updateUser(this.user, params, auditParams)
                .subscribe(_data => {
                    this.loading = false;
                    this.nzModal.destroy('onOk');
                    this.message.success(
                        `修改申请用户成功！`
                    );
                }, (error) => {
                    this.loading = false;
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
        } else {
            this.userService.addUser(params, auditParams)
                .subscribe(data => {
                    this.loading = false;
                    this.nzModal.destroy('onOk');
                    this.message.success(
                        `添加用户申请成功！`
                    );
                }, (error) => {
                    this.loading = false;
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
        }


    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
