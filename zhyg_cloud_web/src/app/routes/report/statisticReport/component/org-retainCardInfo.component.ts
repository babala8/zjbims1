import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';

import {StatisticReportService} from '../statistic-report.service';
import {SessionService} from '@core/session.service';
import { format } from 'date-fns';
import {NzMessageService} from 'ng-zorro-antd';



@Component({
    selector: 'orgRetainCardInfo-factor',
    templateUrl: 'org-retainCardInfo.html'
})
export class OrgRetainCardInfoComponent implements OnInit, OnChanges {

    orgNo = '';
    orgNames = '';
    validateForm: FormGroup;
    constructor(
        private fb: FormBuilder,
        private statisticService: StatisticReportService,
        private session: SessionService,
        private message: NzMessageService,
    ) {
    }


    ngOnChanges(): void {

    }

    ngOnInit(): void {



        this.validateForm = this.fb.group({

            org: [{no: '', name: ''}],
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
        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            orgNo : this.orgNo,
            orgName : this.orgNames,
            startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD') || '',
            endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',
        };
        // alert(params.orgNo + '|' + params.reportDate.split(',')[0]);
        // this.devCountReport.devCountStatistic(params);
        this.message.info('报表生成中请稍后...');
        console.log('1111111111111111111111111111');
        console.log(params);
        this.statisticService.retainCardInfo(params);
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
    /**
     * 日期和字符串相互转换
     * @param date
     */
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
        this.validateForm.controls.org.setValue({});
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
