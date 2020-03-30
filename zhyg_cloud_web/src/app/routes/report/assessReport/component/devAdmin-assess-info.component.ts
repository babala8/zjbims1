import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../../statisticReport/statistic-report.service';
import {NzDatePickerModule} from 'ng-zorro-antd';
import { format } from 'date-fns';
import {AssessReportService} from '../assess-report.service';

@Component({
    selector: 'devAdminAssessInfo-factor',
    templateUrl: 'devAdmin-assess-info.html'
})
export class DevAdminAssessInfoComponent implements OnInit, OnChanges {

    _checked = true;

    validateForm: FormGroup;
    rowsdata= '';
    seasonList = [{no: '03,04,05' , name : '春季' }, {no: '06,07,08' , name : '夏季' }
        , {no: '09,10,11' , name : '秋季' }  , {no: '12,01,02' , name : '冬季' }];
    // devVendorList = [];
    devTypeList = [];
    yearList = [];
    orgNo = '';
    orgNames = '';
    // reportDate = null;
    reportType = 'month';
    reportTypeList = [
        {no: '1', name: '月报'},
        {no: '3', name: '季报'},
        // {no: '2', name: '周报'},
        {no: '4', name: '年报'}
    ];
    devVendorNo = '';
    devVendorName = '';

    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: StatisticReportService,
        private message: NzMessageService,
        private assessReport: AssessReportService,
        // private transReport: TransReportService,

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
            // 需要显示的行
        };
        if (params.reportType == '3' && params.season == '' ) {
            params.season = '03,04,05';
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
        this.assessReport.adminAssess(params);
        // this.workReport.openRateStatistic(params);
        // this.transReport.branchTrans(params);
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
        if (evt == 3) {
            this.reportType = 'day';
        } else if (evt == 1) {
            this.reportType = 'month';
        }else if (evt == 4) {
            this.reportType = 'year';
        }
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

}
