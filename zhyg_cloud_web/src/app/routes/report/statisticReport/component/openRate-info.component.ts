import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../statistic-report.service';
import {NzDatePickerModule} from 'ng-zorro-antd';
import { format } from 'date-fns';

@Component({
    selector: 'openRateInfo-factor',
    templateUrl: 'openRate-info.html'
})
export class OPenRateInfoComponent implements OnInit, OnChanges {


    validateForm: FormGroup;
    rowsdata = 'no,devNo,awayFlay,orgNo,orgName,devCatalogName,setupType,address,maintenanceTime' +
        ',hardFaultTime,comnFailureTime,calculatTimestopTime,sumTime,calculatTime,workTime,openRate,maintenanceRate' +
        ',commFailureRate,faultRate';
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
            // devType: [null, Validators.maxLength(5)],
            reportType: [null, Validators.maxLength(5)],
            reportDate: [new Date()],
            reportMonth: [new Date()],
            reportYear: [{no: fullYear , name: fullYear + '年'}],
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
            awayFlay  : this.validateForm.controls.awayFlay.value || '',
            devVendor  : this.validateForm.controls.devVendor.value || '',
            // devVendorName  : this.validateForm.controls.devVendor.value.name || '',

            // reportType报表类型年、月、日报
            reportType : this.validateForm.controls.reportType.value || '',
            reportDate : format(this.validateForm.controls.reportDate.value, 'YYYY-MM-DD') || '',
            reportMonth : format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            // reportYear : format(this.validateForm.controls.reportYear.value, 'YYYY') || '',
            reportYear : this.validateForm.controls.reportYear.value.no || '',
            rows: this.rowsdata,
        };
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        this.message.info('报表生成中请稍后...');
        console.log('1111111111111');
        console.log(params);
        this.workReport.openRateStatistic(params);
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
