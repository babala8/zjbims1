import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../../statisticReport/statistic-report.service';
import {TransReportService} from '../trans-report.service';
import {NzDatePickerModule} from 'ng-zorro-antd';
import { format } from 'date-fns';

@Component({
    selector: 'branchTransInfo-factor',
    templateUrl: 'branchTrans-info.html'
})
export class BranchTransInfoComponent implements OnInit, OnChanges {

    _checked = true;

    validateForm: FormGroup;
    rowsdata= '';
    seasonList = [{no: '03,04,05' , name : '春季' }, {no: '06,07,08' , name : '夏季' }
                , {no: '09,10,11' , name : '秋季' }  , {no: '12,01,02' , name : '冬季' }];
    rows = [
        {key: '序号    ', value: 'no', checked: true, disable: false},
        {key: '设备号  ', value: 'devNo', checked: true, disable: false},
        {key: '样式    ', value: 'awayFlay', checked: false, disable: false},
        {key: '机构编号   ', value: 'orgNo', checked: false, disable: false},
        {key: '机构名称   ', value: 'orgName', checked: false, disable: false},
        {key: '终端类型   ', value: 'devCatalogName', checked: false, disable: false},
        {key: '安装方式   ', value: 'setupType', checked: false, disable: false},
        {key: '装机地址    ', value: 'address', checked: false, disable: false},

        {key: '维护停机（分钟）  ', value: 'maintenanceTime', checked: false, disable: false},
        {key: '工作停机（分钟）    ', value: 'hardFaultTime', checked: false, disable: false},
        {key: '离线停机（分钟）   ', value: 'comnFailureTime', checked: false, disable: false},
        {key: '设备报停（分钟）   ', value: 'stopTime', checked: false, disable: false},
        {key: '合计（分钟）  ', value: 'sumTime', checked: false, disable: false},
        {key: '计算值（分钟）   ', value: 'calculatTime', checked: false, disable: false},
        {key: '规定营业时长   ', value: 'workTime', checked: false, disable: false},
        {key: '开机率  ', value: 'openRate', checked: false, disable: false},
        {key: '维护停机占比  ', value: 'maintenanceRate', checked: false, disable: false},
        {key: '离线停机占比   ', value: 'commFailureRate', checked: false, disable: false},
        {key: '故障停机占比   ', value: 'Friday', checked: false, disable: false},
        {key: '计算值（分钟）   ', value: 'faultRate', checked: false, disable: false},
    ];
    halfYearList = [
        {no: '01,06' , name : '上半年' }, {no: '07,12' , name : '下半年' }
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
        // {no: '2', name: '周报'},
        {no: '4', name: '年报'},

    ];
    devVendorNo = '';
    devVendorName = '';

    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: StatisticReportService,
        private message: NzMessageService,
        private transReport: TransReportService,

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
            ip: [null, Validators.maxLength(20)],
            org: [{no: '', name: ''}],
            // devCatalog: [null, Validators.maxLength(5)],
            reportType: [null, Validators.maxLength(5)],
            season: [null, Validators.maxLength(10)],
            reportMonth: [new Date()],
            reportYear: [{no: fullYear , name: fullYear + '年'}],
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
            season : this.validateForm.controls.season.value || '',
            reportMonth : format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            reportYear : this.validateForm.controls.reportYear.value.no || '',
            halfYear: this.validateForm.controls.halfYear.value || '',
            // startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD') || '',
            // endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',

            // 需要显示的行
        };
        if (params.reportType == '1' && params.season == '' ) {
            params.season = '03,04,05';
        }
        if (params.reportType == '2' && params.halfYear == '' ) {
            params.halfYear = '01,06';
        }
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        if ( params.reportType == null || params.reportType == '' ) {
            params.reportType =  '1';
        }
        if (params.reportType == '1' &&  params.reportMonth == null ) {
            this.message.error('请选择时间');
            return;
        }

        this.message.info('报表生成中请稍后...');
        console.log('1111111111111111111111111111');
        console.log(params);

        this.transReport.branchTrans(params);
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
            this.reportType = 'half';
        }else if (evt == 5) {
            this.reportType = 'startend';
        }
    }

}
