import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {UserService} from '../user.service';
import {RoleService} from '../../role/role.service';
import {Org} from '../../../../models/org';
import {OrgGrade} from '../../../../models/org-grade';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';
import {OrgService} from '../../org/org.service';
import {User} from '../../../../models/user';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './user-add.html'
})
export class UserAddComponent implements OnInit {
    validateForm: FormGroup;
    nodes;
    roles;
    catalogLength;
    org = new Org();
    orgGrade = new OrgGrade();
    options = {};
    devCataloglist = [];
    user = new User();
    loading = false;
    curOrg = this.session.getUserSession().org;
    // 检测是否需要审批，由父控件传参
    checkAudit: boolean;
    // 选择提交机构后，能供选择的角色列表
    commitRoles;
    // 选择提交角色后，能供选择的人员列表
    commitUsers;

    constructor(private fb: FormBuilder,
                private userService: UserService,
                private orgService: OrgService,
                private roleService: RoleService,
                private session: SessionService,
                private nzModal: NzModalSubject,
                private confirmServ: NzModalService,
                private message: NzMessageService) {
    }

    ngOnInit() {
        this.userService.getdevCatalogInfolist().subscribe((data) => {
            console.log(data);
            this.catalogLength = data.data.length;
            data.data.unshift({no: 'all', name: '全部设备'});
            this.devCataloglist = data.data;
        });
        if (this.checkAudit) {
            this.validateForm = this.fb.group({
                no: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9]{4,20}$')]],
                name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5-\]+$'),
                    Validators.minLength(2), Validators.maxLength(10)]],
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
                no: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9]{4,20}$')]],
                name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5-\]+$'),
                    Validators.minLength(2), Validators.maxLength(10)]],
                org: [null, [Validators.required]],
                roleNo: [null, [Validators.required]],
                devCatalog: [null, [Validators.required]],
                phone: [null, [Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
                mobile: [null, [Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
                email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            });
        }
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls.name.updateValueAndValidity();
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

    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }
        console.log(this.validateForm.controls.org);

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
            roleNo: tmpRoleNos,
            name: this.validateForm.controls.name.value,
            status: 1,
            orgNo: this.validateForm.controls.org.value.no,
            devCatalog: tmpCatalogs,
            passwd: 'abcd1234',
            onlineFlag: '0',
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            email: this.validateForm.controls.email.value
        };
        let auditParams = {};
        if (this.checkAudit) {
            let note = this.validateForm.controls.commitNote.value || '';
            if (note != null && note != '') {
                //请求头不能允许中文，前端要编码，后端要解码
                note = encodeURIComponent(note);
            }
            auditParams = {
                //审批相关数据
                auditFlag: String(this.checkAudit) || '',
                commitOrg: this.validateForm.controls.commitOrg.value.no || '',
                commitRole: this.validateForm.controls.commitRole.value || '',
                commitUser: this.validateForm.controls.commitUser.value || '',
                commitNote: note || '',
                // commitNote:'123321',
            };
        }
        this.loading = true;
        console.log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        console.log(params);
        this.userService.addUser(params, auditParams)
            .subscribe(data => {
                this.loading = false;
                this.nzModal.destroy('onOk');
                this.message.success(
                    `增加用户成功！`
                );
                this.success();
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

    success = () => {
        const modal = this.confirmServ.success({
            title: '用户初始密码：',
            content: 'abcd1234'
        });

        setTimeout(() => modal.destroy(), 3000);
    };

}

