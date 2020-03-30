import {Component, OnInit} from '@angular/core';
import {TargetManagementService} from '../targetManagement.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';


@Component({
    templateUrl: './targetManagement-modify.html'
})
export class TargetManagementModifyComponent implements OnInit {


    validateForm: FormGroup;
    target;
    org: Org;
    loading = false;
    showFlag = 0;
    tmp;
    upper = '';
    i = 0;

    constructor(private fb: FormBuilder,
                private targetManagementService: TargetManagementService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService) {
    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            org: [
                {no: '10002', name: 'xx分行'}],
            year: [null, [Validators.required, Validators.maxLength(20)]],
            quarter: [null, [Validators.required, Validators.maxLength(20)]],
            openAccountCount: [null],
            depositCount: [null],
            depositAmount: [null],
            financingCount: [null],
            financingAmount: [null],
        });

        this.tmp = [
            {
                no: '',
                name: '',
                orgNo: ''
            }
        ];

        // 获取机构详细信息
        this.loading = true;
        this.targetManagementService.getTargetById(this.target).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                if (data.data) {
                    this.target = data.data;
                    this.validateForm.controls.org.setValue({no: this.target.orgNo, name: this.target.orgName});
                    this.validateForm.controls.year.setValue(this.target.targetYear);
                    this.validateForm.controls.quarter.setValue(this.target.quarter);
                    this.validateForm.controls.openAccountCount.setValue(this.target.openAccountCount || '');
                    this.validateForm.controls.depositCount.setValue(this.target.depositCount || '');
                    this.validateForm.controls.depositAmount.setValue(this.target.depositeAmount || '');
                    this.validateForm.controls.financingCount.setValue(this.target.financingCount || '');
                    this.validateForm.controls.financingAmount.setValue(this.target.financingAmount || '');
                }

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
        console.log('aaa', params);
        this.targetManagementService.modTarget(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改成功');
                this.nzModal.destroy('onOk');

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




    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
