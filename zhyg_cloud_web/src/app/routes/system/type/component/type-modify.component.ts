import {Component, OnInit} from '@angular/core';
import { FormControl } from '@angular/forms';
import {TypeService} from '../type.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './type-modify.html'
})
export class TypeModifyComponent implements OnInit {


    validateForm: FormGroup;
    type;
    devCatalogList = [];
    devVendorList = [];
    org: Org;
    loading = false;
    showFlag = 0;
    i = 0;
    before;

    constructor(private fb: FormBuilder,
                private typeService: TypeService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

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


        // 获取机构详细信息
        this.loading = true;
        this.typeService.getType(this.type.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.type = data.data;
                this.before = data.data;
                this.validateForm.controls.no.setValue(this.type.no);
                this.validateForm.controls.name.setValue(this.type.name);
                this.validateForm.controls.devVendor.setValue(this.type.vendorNo || '');
                this.validateForm.controls.devCatalog.setValue(this.type.catalogNo || '');
                this.validateForm.controls.cashType.setValue(this.type.cashType || '');
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
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
        const params = {
            no: this.validateForm.controls.no.value,
            name: this.validateForm.controls.name.value,
            vendorNo: this.validateForm.controls.devVendor.value,
            catalogNo: this.validateForm.controls.devCatalog.value,
            cashType: this.validateForm.controls.cashType.value,
        };
        this.loading = true;
        this.typeService.modType(this.before,params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改成功!');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/type']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
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


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
