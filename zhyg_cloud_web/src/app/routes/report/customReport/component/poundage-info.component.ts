import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../../statisticReport/statistic-report.service';
import {NzDatePickerModule} from 'ng-zorro-antd';
import { format } from 'date-fns';

@Component({
    selector: 'poundageInfo-factor',
    templateUrl: 'poundage-info.html'
})
export class PoundageInfoComponent implements OnInit, OnChanges {

    _checked = true;
    startTime = '';
    endTime = '';
    validateForm: FormGroup;
    rowsdata= '';
    seasonList = [{no: '03,04,05' , name : '春季' }, {no: '06,07,08' , name : '夏季' }
        , {no: '09,10,11' , name : '秋季' }  , {no: '12,01,02' , name : '冬季' }];
    rows = [
        {key: '序号    ', value: 'no', checked: true, disable: true},
        {key: '设备号  ', value: 'devNo', checked: true, disable: true},
        {key: '笔数    ', value: 'num', checked: false, disable: false},
        {key: '金额   ', value: 'Amount', checked: false, disable: false},
        {key: '超额笔数   ', value: 'moreNum', checked: false, disable: false},
        {key: '手续费   ', value: 'poundage', checked: false, disable: false},
        {key: '应减金额   ', value: 'reduceAmount', checked: false, disable: false},
        {key: '应付金额    ', value: 'payAmount', checked: false, disable: false},

        {key: '转账笔数  ', value: 'count', checked: false, disable: false},
        {key: '手续费    ', value: 'transfer', checked: false, disable: false},

    ];
    // devVendorList = [];
    devTypeList = [];
    yearList = [];
    orgNo = '';
    orgNames = '';
    // reportDate = null;
    reportType = 'month';
    reportTypeList = [
        {no: '3', name: '月报'},
        {no: '1', name: '季报'},
         {no: '2', name: '半年报'},
        {no: '4', name: '年报'},
        {no: '5', name: '时间段'},
    ];
    halfyear = [
        {no: '01,06' , name: '上半年'},
        {no: '07,12' , name: '下半年'}
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
        this.validateForm = this.fb.group({
            // devNo: [null, Validators.maxLength(20)],

            org: [{no: '', name: ''}],
            // devCatalog: [null, Validators.maxLength(5)],
            reportType: [null, Validators.maxLength(5)],
            season: [null, Validators.maxLength(20)],
            reportMonth: [new Date()],
            reportYear: [{no: fullYear , name: fullYear + '年'}],
            halfyear: [null, Validators.maxLength(20)],
            startTime: [new Date()],
            endTime: [new Date()],
        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
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

    getDevExcel() {

        for (let a = 0; a < this.rows.length; a++) {
            if (this.rows[a].checked === true) {
                // alert(this.rows[a].value);
                if (this.rowsdata  == '') {
                    this.rowsdata = this.rows[a].value;
                }else {
                    this.rowsdata = this.rowsdata + ',' + this.rows[a].value;
                }

            }
        }


        console.log(this.startTime + this.endTime);
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
            season : this.validateForm.controls.season.value || '',
            reportMonth : format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            reportYear : this.validateForm.controls.reportYear.value.no || '',
            halfYear : this.validateForm.controls.halfyear.value || '',
            startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD') || '',
            endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',
            // 需要显示的行
            rows : this.rowsdata,
        };
        if (params.reportType == '' ) {
            this.reportType = '2';
        }
        if (params.reportType == '1' && params.season == '') {
            params.season = '03,04,05';
        }else  if (params.reportType == '2' && params.halfYear == '') {
            params.halfYear = '01,06';
        }else  if (params.reportType == '5' && params.startTime == '') {
            this.message.error('请选择时间段');
            return;
        }
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        this.message.info('报表生成中请稍后...');
        console.log('1111111111111111111111111111');
        console.log(params);
        // this.workReport.openRateStatistic(params);
        this.workReport.poundage(params);
        this.orgNo = '';
        this.orgNames = '';
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
         this.validateForm.controls.reportYear.setValue({no: new Date().getFullYear() , name : new Date().getFullYear() + '年' })  ;
        this.validateForm.controls.reportMonth.setValue(new Date());
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

    /**
     * 选择设备品牌后，查询用户可选的设备类型
     * @param evt
     */
    selectDevType(evt: any) {
        if (evt) {
            this.devTypeList = [];
            let params = {};
            for (const vendor of evt) {
                params = {
                    devVendor: vendor || '',
                    devCatalog: '',
                };
                this.workReport.getDevTypeByVendor(params).subscribe(
                    data => {
                        this.devTypeList = this.devTypeList.concat(data.data);
                        console.log(this.devTypeList);
                    }, error => {
                        console.log(error);
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    }
                );
            }

        }
    }

    // 根据报表类型切换选择日期、月份、年份
    changeReportType(evt: any) {
        if (evt == 1) {
            this.reportType = 'day';
        } else if (evt == 3) {
            this.reportType = 'month';
        }else if (evt == 4) {
            this.reportType = 'year';
        }else if (evt == 2) {
            this.reportType = 'halfYear';
        }else if (evt == 5) {
            this.reportType = 'scopetime';
        }
    }

}
