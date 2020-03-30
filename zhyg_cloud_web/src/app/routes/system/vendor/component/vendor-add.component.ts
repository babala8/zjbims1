import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {VendorService} from '../vendor.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';

@Component({
    templateUrl: './vendor-add.html'
})
export class VendorAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    regions = REGIONS;
    cities = [];
    i = 0;
    showFlag = 0;

    constructor(private fb: FormBuilder,
                private vendorService: VendorService,
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
        };

        console.log(params);
        this.loading = true;
        this.vendorService.addVendor(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/vendor']);

            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    regionChange(region) {
        console.log(region);
        // this.validateForm.controls.city.setValue(null);
        for (const r of this.regions) {
            if (r.name === region) {
                this.cities = CITIES[r.no];
            }
        }
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.pattern('^[^ ]+$'), Validators.maxLength(5)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*$'), Validators.maxLength(20)]],
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

