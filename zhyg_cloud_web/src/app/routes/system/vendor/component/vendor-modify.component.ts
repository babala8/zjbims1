import {Component, OnInit} from '@angular/core';
import {VendorService} from '../vendor.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './vendor-modify.html'
})
export class VendorModifyComponent implements OnInit {


    validateForm: FormGroup;
    vendors;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;
    before;

    constructor(private fb: FormBuilder,
                private vendorService: VendorService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.pattern('^[^ ]+$'), Validators.maxLength(5)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*$'), Validators.maxLength(20)]],
        });


        this.loading = true;
        this.vendorService.getVendor(this.vendors.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.vendors = data.data;
                this.before = data.data;
                this.validateForm.controls.no.setValue(this.vendors.no);
                this.validateForm.controls.name.setValue(this.vendors.name);
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
        };
        this.loading = true;
        this.vendorService.modVendor(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改设备品牌成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/vendor']);
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
