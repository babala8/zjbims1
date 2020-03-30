import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {TargetManagementService} from '../targetManagement.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {Org} from '../../../../models/org';

@Component({
    templateUrl: './targetManagement-add.html',
})
export class TargetManagementAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    regions = REGIONS;
    cities = [];
    i = 0;
    org: Org;
    showFlag = 0;

    constructor(private fb: FormBuilder,
                private targetManagementService: TargetManagementService,
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
            userOrgNo: this.session.getUserSession().orgNo,
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo,
            targetYear: this.validateForm.controls.year.value,
            quarter: this.validateForm.controls.quarter.value,
            openAccountCount: this.validateForm.controls.openAccountCount.value,
            depositCount: this.validateForm.controls.depositCount.value,
            depositeAmount: this.validateForm.controls.depositAmount.value,
            financingCount: this.validateForm.controls.financingCount.value,
            financingAmount: this.validateForm.controls.financingAmount.value,

        };

        this.loading = true;
        this.targetManagementService.addTarget(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加成功`);
                this.nzModal.destroy('onOk');
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
            org: [
                {no: '', name: ''}],
            year: [null, [Validators.required, Validators.maxLength(20)]],
            quarter: [null, [Validators.required, Validators.maxLength(20)]],
            openAccountCount: [null],
            depositCount: [null],
            depositAmount: [null],
            financingCount: [null],
            financingAmount: [null],
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

