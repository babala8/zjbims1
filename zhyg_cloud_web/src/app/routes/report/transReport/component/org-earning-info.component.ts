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
    selector: 'orgEarningInfo-factor',
    templateUrl: 'org-earning-info.html'
})
export class OrgEarningInfoComponent implements OnInit, OnChanges {

    _checked = true;

    validateForm: FormGroup;
    rowsdata= '';
    seasonList = [{no: '03,04,05' , name : '春季' }, {no: '06,07,08' , name : '夏季' }
                , {no: '09,10,11' , name : '秋季' }  , {no: '12,01,02' , name : '冬季' }];
    halfYearList = [
        {no: '01,06' , name : '上半年' }, {no: '07,12' , name : '下半年' }
    ];
    // devVendorList = [];
    devTypeList = [];
    yearList = [];
    orgType = [];
    orgNos = '';
    orgNames = '';
    orgsList = [{no: '1' , name: '总行'} , {no: '2' , name: '分行'}, {no: '3' , name: '支行'}, {no: 'all' , name: '全部'}];
    // reportDate = null;
    reportType = 'month';
    reportTypeList = [
        {no: '1', name: '月报'},
        {no: '2', name: '季报'},
         {no: '3', name: '半年报'},
        {no: '4', name: '年报'},
        {no: '5', name: '时间段'}
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

        // this.transReport.getorgTypeInfo({}).subscribe(
        //     data => {
        //         this.orgType = data.data;
        //         console.log(data.data);
        //     }, error => {
        //         console.log(error);
        //         if (error instanceof HttpResponse) {
        //             this.message.error(error.body.retMsg);
        //         }
        //     }
        // );
        // console.log('投入主体');
        // console.log(this.orgType);
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
            orgs: [null, Validators.maxLength(20)],
        });

    }




    getDevExcel() {


        console.log(format(this.validateForm.controls.reportMonth.value, 'YYYY-MM'));
        // const devVendor = (this.validateForm.controls.devVendor.value.no).split(',');

        if (this.validateForm.controls.reportType.value == null) {
            this.message.error('请选择报表类型');
            return ;
        }
        if ( this.validateForm.controls.orgs.value == '' || this.validateForm.controls.orgs.value == null ) {
            this.orgNos = 'all';
            this.orgNames = '全部';
        }else {
            this.orgNos = this.validateForm.controls.orgs.value.no ;
            this.orgNames = this.validateForm.controls.orgs.value.name ;
        }
        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            orgsNo : this.orgNos,
            orgsName : this.orgNames,
            // reportType报表类型年、月、日报
            reportType : this.validateForm.controls.reportType.value || '',
            season : this.validateForm.controls.season.value || '',
            reportMonth : format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            reportYear :  this.validateForm.controls.reportYear.value.no || '',
            halfYear: this.validateForm.controls.halfYear.value || '',
            startTime: format(this.validateForm.controls.startTime.value, 'YYYY-MM-DD') || '',
            endTime: format(this.validateForm.controls.endTime.value, 'YYYY-MM-DD') || '',
            // 需要显示的行
        };
        if (params.reportType == '2' &&   params.season == '' ) {
            params.season = '03,04,05';
        }if (params.reportType == '3' &&   params.halfYear == '' ) {
            params.halfYear = '01,06';
        }
        this.message.info('报表生成中请稍后...');

        // if (  params.orgNo == '' || params.orgNo == null ) {
        //     this.message.error('请选择机构后再操作');
        //     return;
        // }
        console.log('1111111111111111111111111111');
        console.log(params);
          this.transReport.earning(params);
        this.orgNos =  '';
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
        if (evt == 2) {
            this.reportType = 'season';
        } else if (evt == 1) {
            this.reportType = 'month';
        }else if (evt == 4) {
            this.reportType = 'year';
        }else if (evt == 3) {
            this.reportType = 'half';
        }else if (evt == 5) {
            this.reportType = 'startend';
        }
    }

}
