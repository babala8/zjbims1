import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../../statisticReport/statistic-report.service';
import {NzDatePickerModule} from 'ng-zorro-antd';
import { format } from 'date-fns';

@Component({
    selector: 'customOpenRateInfo-factor',
    templateUrl: 'custom-openRate-info.html'
})
export class CustomOPenRateInfoComponent implements OnInit, OnChanges {

    _checked = true;

    validateForm: FormGroup;
    rowsdata= '';
    rows = [
        {key: '序号    ', value: 'no', checked: true, disable: true},
        {key: '设备号  ', value: 'devNo', checked: true, disable: true},
        {key: '样式    ', value: 'awayFlay', checked: false, disable: false},
        {key: '机构编号   ', value: 'orgNo', checked: false, disable: false},
        {key: '机构名称   ', value: 'orgName', checked: false, disable: false},
        {key: '终端类型   ', value: 'devCatalogName', checked: false, disable: false},
        {key: '安装方式   ', value: 'setupType', checked: false, disable: false},
        {key: '装机地址    ', value: 'address', checked: false, disable: false},

        {key: '维护停机（分钟）  ', value: 'maintenanceTime', checked: false, disable: false},
        {key: '故障停机（分钟）    ', value: 'hardFaultTime', checked: false, disable: false},
        {key: '离线停机（分钟）   ', value: 'comnFailureTime', checked: false, disable: false},
        {key: '设备报停（分钟）   ', value: 'stopTime', checked: false, disable: false},
        {key: '合计（分钟）  ', value: 'sumTime', checked: false, disable: false},
        {key: '计算值（分钟）   ', value: 'calculatTime', checked: false, disable: false},
        {key: '规定营业时长   ', value: 'workTime', checked: false, disable: false},
        {key: '开机率  ', value: 'openRate', checked: false, disable: false},
        {key: '维护停机占比  ', value: 'maintenanceRate', checked: false, disable: false},
        {key: '离线停机占比   ', value: 'commFailureRate', checked: false, disable: false},
        {key: '故障停机占比   ', value: 'faultRate', checked: false, disable: false},

    ];

    awayFlayList = [{awayFlayNo : '1', awayFlayName : '在行'} , {awayFlayNo : '2', awayFlayName : '离行'} ];
    devVendorList = [];
    devTypeList = [];
    yearList = [];
    orgNo = '';
    orgNames = '';
    // reportDate = null;
    reportType = 'day';
    reportTypeList = [];
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
        this.reportTypeList = this.workReport.getReportDateType();

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
            // devNo: [null, Validators.maxLength(20)],
            ip: [null, Validators.maxLength(20)],
            org: [{no: '', name: ''}],
            // devCatalog: [null, Validators.maxLength(5)],
            awayFlay: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            rows: [null, Validators.maxLength(5)],
            // devType: [null, Validators.maxLength(5)],
            reportType: [null, Validators.maxLength(5)],
            reportDate: [new Date()],
            reportMonth: [new Date()],
            reportYear: [{no: fullYear , name: fullYear + '年'}],
        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }


    /**
     * 限制结束时间
     * @param endValue
     * @private
     */
    _disabledEndDate = (endValue) => {
        const startValue = new Date();
        if (!endValue || !startValue) {
            return false;
        }
        return endValue.getTime() >= startValue.getTime();
    }


    getDevExcel() {

        for (let a = 0; a < this.rows.length; a++) {
            if (this.rows[a].checked === true) {
             //   alert(this.rows[a].value);
                if (this.rowsdata  == '') {
                    this.rowsdata = this.rows[a].value;
                }else {
                    this.rowsdata = this.rowsdata + ',' + this.rows[a].value;
                }

            }
        }
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
            awayFlay  : this.validateForm.controls.awayFlay.value || '',
             devVendor  : this.validateForm.controls.devVendor.value || '',
            // devVendorName  : this.validateForm.controls.devVendor.value.name || '',

            // reportType报表类型年、月、日报
            reportType : this.validateForm.controls.reportType.value || '',
            reportDate : format(this.validateForm.controls.reportDate.value, 'YYYY-MM-DD') || '',
            reportMonth : format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            reportYear : this.validateForm.controls.reportYear.value.no || '',
            // 需要显示的行
            rows: this.rowsdata
        };
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        console.log('1111111111111');
        console.log(params);
        this.message.info('报表生成中请稍后...');
           this.workReport.openRateStatistic(params);
        this.rowsdata = '';
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
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.awayFlay.setValue('');
         this.validateForm.controls.reportYear.setValue({no: new Date().getFullYear() , name : new Date().getFullYear() + '年' })  ;
        this.validateForm.controls.reportMonth.setValue(new Date());
        this.validateForm.controls.reportDate.setValue(new Date());
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
        }
    }

}
