import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../statistic-report.service';
import { format } from 'date-fns';

@Component({
    selector: 'shorten-factor',
    templateUrl: 'shorten-info.html'
})
export class ShortenInfoComponent implements OnInit, OnChanges {

    seasonList = [{no: '03,04,05' , name : '春季' }, {no: '06,07,08' , name : '夏季' }
        , {no: '09,10,11' , name : '秋季' }  , {no: '12,01,02' , name : '冬季' }];
    halfYearList = [ {no: '01,06' , name : '上半年' }, {no: '07,12' , name : '下半年' } ];
    validateForm: FormGroup;
     rowsdata = 'rank,statDimensionsName,theBankCardWithdrawals,theBankCardDeposit,theBankCardTransfer,otherBankCardWithdrawals' +
         ',otherBankCardTransfer,qryNo,totalNo,totalMoney,averDayNo,averDayMoney';


    devTypeList = [];
    yearList = [];
    orgNo = '';
    orgNames = '';
    reportType = 'day';
    reportTypeList = [
        {no: '1', name: '日报'},
        {no: '2', name: '月报'},
        {no: '3', name: '季报'},
        {no: '4', name: '半年报'},
        {no: '5', name: '年报'},
        {no: '6', name: '时间段'}
    ];
    devVendorNo = '';
    devVendorName = '';

    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: StatisticReportService,
        private message: NzMessageService,

    ) {
    }


    ngOnChanges(): void {
    }

    ngOnInit(): void {
        // 初始化当前往前5年年份
        const fullYear = new Date().getFullYear();
        for (let i = 0; i < 5; i++) {
            const year = {no: fullYear - i, name: fullYear - i + '年'};
            this.yearList = this.yearList.concat(year);
        }
        console.log(this.yearList);
        // this.reportTypeList = this.workReport.getReportDateType();


        this.validateForm = this.fb.group({
            // devNo: [null, Validators.maxLength(20)],
            ip: [null, Validators.maxLength(20)],
            org: [{no: '', name: ''}],
            // devCatalog: [null, Validators.maxLength(5)],
            awayFlay: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            // devType: [null, Validators.maxLength(5)],
            reportType: [null, Validators.maxLength(5)],
            reportDate: [new Date()],
            reportMonth: [new Date()],
            reportYear: [{no: fullYear , name: fullYear + '年'}],
            season: [null, Validators.maxLength(10)],
            halfYear: [null, Validators.maxLength(20)],
            startTime: [new Date()],
            endTime: [new Date()],

        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }



    getDevExcel() {

        console.log(format(this.validateForm.controls.reportMonth.value, 'YYYY-MM'));
        // const devVendor = (this.validateForm.controls.devVendor.value.no).split(',');

        if (this.validateForm.controls.reportType.value == null) {
            this.message.error('请选择报表类型');
            return ;
        }

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
            // reportType报表类型年、月、日报
            reportType : this.validateForm.controls.reportType.value || '',
            reportDate : format(this.validateForm.controls.reportDate.value, 'YYYY-MM-DD') || '',
            reportMonth : format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            reportYear : this.validateForm.controls.reportYear.value.no || '',
            season : this.validateForm.controls.season.value || '',
            halfYear: this.validateForm.controls.halfYear.value || '',
            startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD') || '',
            endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',
            rows: this.rowsdata,
        };
        if (params.reportType == '3' &&   params.season == '' ) {
            params.season = '03,04,05';
        }if (params.reportType == '4' &&   params.halfYear == '' ) {
            params.halfYear = '01,06';
        }
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        } if (  params.reportType == '' || params.reportType == null ) {
            this.message.error('请选择报表类型后再操作');
            return;
        }
        this.message.info('报表生成中请稍后...');
        console.log('111111111');
        console.log(params);
        this.workReport.shortenInfo(params);
        // this.workReport.transInfo(params);
        this.orgNo = '';
        this.orgNames = '';
    }
    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({});
         this.validateForm.controls.reportYear.setValue({no: new Date().getFullYear() , name : new Date().getFullYear() + '年' })  ;
        this.validateForm.controls.reportMonth.setValue(new Date());
        this.validateForm.controls.reportDate.setValue(new Date());
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



    // 根据报表类型切换选择日期、月份、年份
    changeReportType(evt: any) {
        if (evt == 1) {
            this.reportType = 'day';
        } else if (evt == 2) {
            this.reportType = 'month';
        }else if (evt == 3) {
            this.reportType = 'season';
        }else if (evt == 4) {
            this.reportType = 'half';
        }else if (evt == 5) {
            this.reportType = 'year';
        }else if (evt == 6) {
            this.reportType = 'startend';
        }
    }
    /**
     * 限制时间
     * @param endValue
     * @private
     */
    _disabledDate = (endValue) => {
        const startValue = new Date();
        if (!endValue || !startValue) {
            return false;
        }
        return endValue.getTime() >= startValue.getTime();
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
