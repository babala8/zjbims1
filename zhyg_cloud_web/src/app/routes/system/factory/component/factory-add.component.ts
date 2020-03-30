import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {FactoryService} from '../factory.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';

@Component({
    templateUrl: './factory-add.html'
})
export class FactoryAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    devServiceManagerList = [];
    statusList = [];
    regions = REGIONS;
    cities = [];
    i = 0;
    showFlag = 0;

    constructor(private fb: FormBuilder,
                private factoryService: FactoryService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private router: Router) {
    }



    _submitForm() {
        console.log('为什么进来');
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }

        if (this.validateForm.invalid) {
            return;
        }
        const params = {
            name: this.validateForm.controls.name.value,
            belongToNo: this.validateForm.controls.devServiceManager.value,
            status: this.validateForm.controls.status.value,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            email: this.validateForm.controls.email.value,
            leader: this.validateForm.controls.leader.value,
        };

        console.log(params);
        this.loading = true;
        this.factoryService.addFactory(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加厂商维护人员成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/factory']);
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
        this.factoryService.getDevServiceManagers({}).subscribe(
            data => {
                this.devServiceManagerList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.statusList = this.factoryService.getStatus();
        this.validateForm = this.fb.group({
            name: [null, [Validators.required, Validators.maxLength(20), Validators.minLength(2),
                Validators.pattern('^[\s\u4e00-\u9fa5a-zA-Z0-9_-]+$')]],
            devServiceManager: [null, [Validators.required]],
            status: [null, [Validators.required]],
            phone: [null, [Validators.required, Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
            mobile: [null, [Validators.required, Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
            email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            leader: [null, [Validators.maxLength(20), Validators.minLength(2),
                Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$')]]
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

