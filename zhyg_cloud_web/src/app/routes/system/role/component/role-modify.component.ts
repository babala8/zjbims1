import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {RoleService} from '../role.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {_HttpClient} from '@zjft/theme';
import {SysMenuService} from '../../menu/menu.service';

@Component({
    templateUrl: './role-modify.html'
})

export class RoleModifyComponent implements OnInit {
    validateForm: FormGroup;
    formModel = {};
    role;
    grades;
    loading = false;
    before;

    constructor(
        private fb: FormBuilder,
        private roleService: RoleService,
        private service: SysMenuService,
        private httpClient: _HttpClient,
        private nzModal: NzModalSubject,
        private session: SessionService,
        private message: NzMessageService) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            roleName: [this.role.name, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5-\]+$'),
                Validators.minLength(2), Validators.maxLength(20)]],
            orgType: [ this.role.orgType, [Validators.required]],
            note: [this.role.note]
        });
        this.before = this.role;
    }

    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return false;
        }
        const params = {
            no: this.role.no,
            name: this.validateForm.controls.roleName.value,
            orgType: this.validateForm.controls.orgType.value,
            note: this.validateForm.controls.note.value || '',
        };
        // 参数验证
        // const reg = /^[^ \s\u4e00-\u9fa5a-z0-9_-]{0,}$/; // 非法字符正则
        // if ( !reg.exec(params.name)) {
        //     console.log( '非法字符' );
        //     this.message.warning(`用户名含有非法字符！`);
        //     return ;
        // }
        this.loading = true;
        this.roleService.modRole(this.before, params).subscribe(data => {
            this.loading = false;
            this.nzModal.destroy('onOk');
            this.message.success(`修改角色成功！`);
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
