import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {BaseReportService} from '../../baseReport/base-report.service';
import { format } from 'date-fns';
import {start} from 'repl';

@Component({
    selector: 'devVersionInfo-factor',
    templateUrl: 'devVersion-info.html'
})
export class DevVersionInfoComponent implements OnInit, OnChanges {


    validateForm: FormGroup;
    devVendorList = [];
    orgNo = '';
    startTime= '';
    endTime= '';
    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: BaseReportService,
        private message: NzMessageService,

    ) {
    }


    ngOnChanges(): void {
    }

    ngOnInit(): void {

        this.workReport.getDevVendorInfo({}).subscribe(
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
            devNo: [null, Validators.maxLength(20)],
            ip: [null, Validators.maxLength(20)],
            org: [{no: '', name: ''}],
            devVendor: [null, Validators.maxLength(50)],
            reportDate: [null, Validators.maxLength(20)],
            startTime: [new Date()],
            endTime: [new Date()],
        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }



    getDevExcel() {


        if (  this.validateForm.controls.org.value.no == '' || this.validateForm.controls.org.value.no == null ) {
            this.orgNo = this.session.getUserSession().orgNo;
        }else {
            this.orgNo = this.validateForm.controls.org.value.no;
        }
        // if (  this.validateForm.controls.reportDate.value == '' || this.validateForm.controls.reportDate.value == null ) {
        //     this.message.error('请输入时间');
        //     return;
        // }else {
        //     this.startTime = this.date2String( new Date(this.validateForm.controls.reportDate.value.toString().split(',')[0]));
        //     this.endTime = this.date2String( new Date(this.validateForm.controls.reportDate.value.toString().split(',')[1]));
        // }
        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            devNo: this.validateForm.controls.devNo.value || '',
            ip: this.validateForm.controls.ip.value || '',
            orgNo: this.orgNo,
            orgName: this.validateForm.controls.org.value.name || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD')  || '',
            endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',
        };
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        console.log('1111111111');
        console.log(params);
        this.workReport.versionsInfo(params);

        this.orgNo = '';
        this.startTime = '';
            this.endTime = '';
    }

    date2String(date: Date): string {
        if (!date) {
            date = new Date();
        }
        date.setHours(date.getHours() + 8);
        const _date = date.toISOString().substring(0, 10);
        return _date;
    }
    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.ip.setValue('');
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
        this.validateForm.controls.startTime.setValue(new Date());
        this.validateForm.controls.endTime.setValue(new Date());
        // this.devTypeList = [];
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    /**
     * 限制开始时间
     * @param startValue
     * @private
     */
    _disabledStartDate = (startValue) => {
        const endValue = this.validateForm.controls.endTime.value;
        if (!startValue || !endValue) {
            return false;
        }
        return startValue.getTime() > endValue.getTime();
    }
    /**
     * 限制结束时间
     * @param endValue
     * @private
     */
    _disabledEndDate = (endValue) => {
        const startValue = this.validateForm.controls.startTime.value;
        const endtime = new Date();
        if (!endValue || !startValue ) {
            return false;
        }
        if (endValue.getTime() > endtime.getTime()) {
           return  true;
        }
        return endValue.getTime() < startValue.getTime();
    }

}
