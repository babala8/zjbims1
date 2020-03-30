import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {BaseReportService} from '../../baseReport/base-report.service';
import {StatisticReportService} from '../statistic-report.service';
import { format } from 'date-fns';

@Component({
    selector: 'devAddCashInfo-factor',
    templateUrl: 'devAddCash-info.html'
})
export class DevAddCashInfoComponent implements OnInit, OnChanges {


    validateForm: FormGroup;
    devVendorList = [];
    orgNo = '';
    orgNames = '';
    startTime= '';
    endTime= '';
    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: BaseReportService,
        private message: NzMessageService,
        private statisticReport: StatisticReportService,

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
            org: [{no: '', name: ''}],
            devVendor: [null, Validators.maxLength(50)],
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
        if (  this.validateForm.controls.org.value.name == '' || this.validateForm.controls.org.value.name == null ) {
            this.orgNames = this.session.getUserSession().orgName;
        }else {
            this.orgNames = this.validateForm.controls.org.value.name;
        }
        // if (  this.validateForm.controls.devNo.value == null || this.validateForm.controls.devNo.value == '' ) {
        //     this.message.error('请选择设备号');
        //     return;
        // }
        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            devNo: this.validateForm.controls.devNo.value || '',
            orgNo: this.orgNo,
            orgName : this.orgNames,
            devVendor: this.validateForm.controls.devVendor.value || '',
            startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD') || '',
            endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',

        };
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        this.message.info('报表生成中请稍后...');
        console.log('11111111111111111111111');
        console.log(params);
        this.statisticReport.devAddCashInfo(params);
        this.orgNo = '';
        this.orgNames = '';

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
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.startTime.setValue(new Date());
        this.validateForm.controls.endTime.setValue(new Date());
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }



}
