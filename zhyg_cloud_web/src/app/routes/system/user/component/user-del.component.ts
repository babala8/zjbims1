import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {UserService} from '../user.service';
import {RoleService} from '../../role/role.service';
import {Org} from '../../../../models/org';
import {OrgGrade} from '../../../../models/org-grade';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';
import * as _ from 'lodash';
import {OrgService} from '../../org/org.service';
import {User} from '../../../../models/user';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './user-del.html'
})
export class UserDelComponent implements OnInit {
    validateForm: FormGroup;
    org = new Org();
    orgGrade = new OrgGrade();
    options = {};
    user = new User();
    loading = false;
    userNo;
    curOrg = this.session.getUserSession().org;
    //检测是否需要审批，由父控件传参
    checkAudit: boolean;
    //选择提交机构后，能供选择的角色列表
    commitRoles;
    //选择提交角色后，能供选择的人员列表
    commitUsers;

    constructor(private fb: FormBuilder,
                private userService: UserService,
                private orgService: OrgService,
                private roleService: RoleService,
                private session: SessionService,
                private nzModal: NzModalSubject,
                private message: NzMessageService) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.minLength(4), Validators.maxLength(20)]],
            commitOrg: [null, [Validators.required]],
            commitRole: [null, [Validators.required]],
            commitUser: [null],
            commitNote: [null],

        });
        this.validateForm.controls.no.setValue(this.userNo);
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
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

        const userNo= this.validateForm.controls.no.value || '';
        let note = this.validateForm.controls.commitNote.value || '';
        if (note != null && note != '') {
            //请求头不能允许中文，前端要编码，后端要解码
            note = encodeURIComponent(note);
        }
        const auditParams = {
            //审批相关数据
            auditFlag: String(this.checkAudit) || '',
            commitOrg: this.validateForm.controls.commitOrg.value.no || '',
            commitRole: this.validateForm.controls.commitRole.value || '',
            commitUser: this.validateForm.controls.commitUser.value || '',
            commitNote: note || '',
            // commitNote:'123321',
        };
        this.loading = true;
        this.userService.deleteUserAudit(userNo, auditParams)
            .subscribe(data => {
                this.loading = false;
                this.nzModal.destroy('onOk');
                this.message.success(
                    `删除用户成功！`
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

