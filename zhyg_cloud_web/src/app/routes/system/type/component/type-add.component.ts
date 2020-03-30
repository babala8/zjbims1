import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {TypeService} from '../type.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';

@Component({
    templateUrl: './type-add.html'
})
export class TypeAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    devCatalogList = [];
    devVendorList = [];
    i = 0;
    showFlag = 0;

    constructor(private fb: FormBuilder,
                private typeService: TypeService,
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
            no: this.validateForm.controls.no.value,
            name: this.validateForm.controls.name.value,
            vendorNo: this.validateForm.controls.devVendor.value,
            catalogNo: this.validateForm.controls.devCatalog.value,
            cashType: this.validateForm.controls.cashType.value,
        };

        console.log(params);
        this.loading = true;
        this.typeService.addType(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success(`添加设备型号成功!`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/type']);
            }, (error) => {
                console.log(error);
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

        this.typeService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.typeService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.maxLength(5)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*'), Validators.maxLength(20)]],
            devVendor: [null, [Validators.required, Validators.maxLength(5)]],
            devCatalog: [null, [Validators.required, Validators.maxLength(5)]],
            cashType: [null, [Validators.required, Validators.maxLength(2)]],
        });
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}

