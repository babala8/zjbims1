import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {ElockInfoService} from '../elockInfo.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';

import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';


@Component({
    templateUrl: './elock-add.html'
})
export class ElockAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    i = 0;
    showFlag = 0;

    constructor(private fb: FormBuilder,
                private elockInfoService: ElockInfoService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private router: Router) {
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
        const params = {
            elockId: this.validateForm.controls.elockId.value,
            devNo: this.validateForm.controls.devNo.value,
            elockVendor: this.validateForm.controls.elockVendor.value || '',
            elockType: this.validateForm.controls.elockType.value || '',
            addUser: this.session.account,
        };

        console.log(params);
        this.loading = true;
        this.elockInfoService.addElock(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加锁具成功！`);
                this.nzModal.destroy('onOk');

                /*页面跳转*/
                this.router.navigate(['/elock/elockInfoManager']);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }



    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            elockId: [null, [Validators.required, Validators.minLength(1), Validators.maxLength(40)]],
            devNo: [null, [Validators.required, Validators.maxLength(20)]],
            elockVendor: [null, [Validators.required, Validators.minLength(1)]],
            elockType: [null, [Validators.required]],
        });
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }
}
