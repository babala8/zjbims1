import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {RoleService} from '../role.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {SysMenuService} from '../../menu/menu.service';
@Component({
    templateUrl: './role-add.html',
})
export class RoleAddComponent implements OnInit {
    validateForm: FormGroup;
    formModel = {};
    grades ;
    loading = false;
    constructor(
        private fb: FormBuilder,
        private roleService: RoleService,
        private service: SysMenuService,
        private nzModal: NzModalSubject,
        private session: SessionService,
        private message: NzMessageService) {
    }
    ngOnInit() {
        this.validateForm = this.fb.group({
            roleName: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5-\]+$'),
                Validators.minLength(2), Validators.maxLength(20)]],
            orgType: [null, [Validators.required]],
            note: [null]
        });
    }
    _submitForm() {
        if (this.validateForm.invalid) {
            return false;
        }
        const params = {
            roleName: this.validateForm.controls.roleName.value || '',
            orgType: this.validateForm.controls.orgType.value || '',
            note: this.validateForm.controls.note.value || '',
        };
        // 参数验证
        // const reg = /^[^ a-zA-Z0-9\u4e00-\u9fa5]+$/; // 非法字符正则
        // if ( !reg.exec(params.roleName)) {
        //     console.log( "非法字符" );
        //     this.message.warning(`输入的用户名含有非法字符！`);
        //     return;
        // }
        this.loading = true;
        this.roleService.addRole(params)
            .subscribe(_data => {
                this.loading = false;
                this.nzModal.destroy('onOk');
                this.message.success(`增加角色成功！`);
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
