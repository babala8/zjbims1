import {Component, OnInit} from '@angular/core';
import {UserService} from '../user.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {OrgService} from '../../org/org.service';
import {RoleService} from '../../role/role.service';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './user-modify.html'
})
export class UserModifyComponent implements OnInit {
    validateForm: FormGroup;
    user;
    userret;
    roles;
    catalogLength;
    devCataloglist = [];
    loading = false;
    // 检测是否需要审批，由父控件传参
    checkAudit: boolean;
    // 选择提交机构后，能供选择的角色列表
    commitRoles;
    // 选择提交角色后，能供选择的人员列表
    commitUsers;
    // 提供给直接传业务实体对象的参数
    param;

    constructor(private fb: FormBuilder,
                private userService: UserService,
                private roleService: RoleService,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private message: NzMessageService) {
    }

    ngOnInit() {
        this.userService.getdevCatalogInfolist().subscribe((data) => {
            console.log(data);
            this.catalogLength = data.data.length;
            data.data.unshift({no: 'all', name: '全部设备'});
            this.devCataloglist = data.data;
        });
        // 初始化控件验证规则
        this.initValidateForm();

        // 判断使用哪个数据源
        if (this.param != null) {
            this.setParamData();
        } else {
            this.setUserData();
        }
    }

    initValidateForm() {
        if (this.checkAudit) {
            this.validateForm = this.fb.group({
                no: [null, [Validators.required, Validators.minLength(4), Validators.maxLength(20)]],
                name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5-\]+$'), Validators.minLength(2), Validators.maxLength(10)]],
                org: [null, [Validators.required]],
                roleNo: [null, [Validators.required]],
                devCatalog: [null, [Validators.required]],
                phone: [null, [Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
                mobile: [null, [Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
                email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
                commitOrg: [null, [Validators.required]],
                commitRole: [null, [Validators.required]],
                commitUser: [null],
                commitNote: [null],
            });
        } else {
            this.validateForm = this.fb.group({
                no: [null, [Validators.required, Validators.minLength(4), Validators.maxLength(20)]],
                name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5-\]+$'), Validators.minLength(2), Validators.maxLength(10)]],
                org: [null, [Validators.required]],
                roleNo: [null, [Validators.required]],
                devCatalog: [null, [Validators.required]],
                phone: [null, [Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
                mobile: [null, [Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
                email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            });
        }

    }

    // 根据传入的实体设置页面的数据
    setParamData() {
        //  获得可用的角色列表
        const param = {
            orgNo: this.param.orgNo
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            this.roles = data.data;
        });
        this.userService.getUser(this.param.no).subscribe(data => {
            this.user = data.data;
        });

        if (this.param.orgNo !== null) {
            this.orgService.getOrg(this.param.orgNo).subscribe(data => {
                const org = data.data;
                this.validateForm.controls.org.setValue({
                    no: org.no,
                    name: org.name
                } || {});
            });
        }
        if (this.param.roleNo !== null) {
            this.roleService.qryRoleByNo(this.param.roleNo).subscribe(data => {
                const role = data.data;
                this.validateForm.controls.roleNo.setValue(role.no);
                this.validateForm.controls.devCatalog.setValue(role.devCatalog);
                this.validateForm.controls.no.setValue(this.param.no);
                this.validateForm.controls.name.setValue(this.param.name);
                this.validateForm.controls.phone.setValue(this.param.phone);
                this.validateForm.controls.mobile.setValue(this.param.mobile);
                this.validateForm.controls.email.setValue(this.param.email);
            });
        }

    }

    // 初始页面数据
    setUserData() {
        // 获得可用的角色列表
        const param = {
            orgNo: this.user.orgNo
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            console.log('角色' + data);
            this.roles = data.data;
        });

        this.userService.getUser(this.user.no).subscribe(result => {
            this.userret = result.data;
            if (this.userret.devCatalog !== null) {
                this.userret.devCatalog = this.userret.devCatalog.split('|');
            }

            console.log(this.userret);
            //补全用户修改之前信息

            this.user.phone = this.userret.phone;
            this.user.mobile = this.userret.mobile;
            this.user.email = this.userret.email;
            this.validateForm.controls.no.setValue(this.userret.no);
            this.validateForm.controls.devCatalog.setValue(this.userret.devCatalog);
            this.validateForm.controls.name.setValue(this.userret.name);
            this.validateForm.controls.phone.setValue(this.userret.phone);
            this.validateForm.controls.mobile.setValue(this.userret.mobile);
            this.validateForm.controls.email.setValue(this.userret.email);
            this.validateForm.controls.org.setValue({
                no: this.user.orgNo,
                name: this.user.orgName
            } || {});
            const roleNos = this.userret.role.no.split('|');
            this.validateForm.controls.roleNo.setValue(roleNos);
            this.validateForm.controls.devCatalog.setValue(this.userret.devCatalog);
        });

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

        this.validateForm.controls.roleNo.setValue(null);
        const param = {
            orgNo: $event.no
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
        const params = {
            no: this.validateForm.controls.no.value,
            name: this.validateForm.controls.name.value,
            roleNo: tmpRoleNos,
            orgNo: this.validateForm.controls.org.value.no,
            devCatalog: tmpCatalogs,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            email: this.validateForm.controls.email.value,

        };
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
        this.loading = true;
        this.userService.updateUser(this.user, params, auditParams)
            .subscribe(_data => {
                console.log(_data);
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

    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
