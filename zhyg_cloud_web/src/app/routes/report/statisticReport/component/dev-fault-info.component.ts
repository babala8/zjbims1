import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../statistic-report.service';
import {NzDatePickerModule} from 'ng-zorro-antd';
import { format } from 'date-fns';

@Component({
    selector: 'devFaultInfo-factor',
    templateUrl: 'dev-fault-info.html'
})
export class DevFaultInfoComponent implements OnInit, OnChanges {


    validateForm: FormGroup;

    devCatalogList = [];
    devVendorList = [];
    devTypeList = [];
    yearList = [];
    orgNo = '';
    orgNames = '';
    // reportDate = null;
    reportType = 'day';
    reportTypeList = [];
    

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
        this.workReport.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
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
            devCatalog: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            devType: [null, Validators.maxLength(5)],
            reportType: [null, Validators.maxLength(5)],
            reportDate: [new Date()],
            reportMonth: [new Date()],
            reportYear: [{no: fullYear , name: fullYear + '年'}],
        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }



    getDevExcel() {
        // 获得选择的所有品牌名字
        let  vendorNames = '';
        const devVendorNo = this.validateForm.controls.devVendor.value;
        if (devVendorNo != null) {
            for (let vendorNo of devVendorNo) {
                for (let vendor of this.devVendorList) {
                    if (vendorNo == vendor.no) {
                        vendorNames += vendor.name + ' ';
                        console.log(vendorNames);
                    }
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
            devNo: this.validateForm.controls.devNo.value || '',
            ip: this.validateForm.controls.ip.value || '',
            orgNo : this.orgNo,
            orgName : this.orgNames,
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devVendorName: vendorNames,
            devType: this.validateForm.controls.devType.value || '',
            reportType: this.validateForm.controls.reportType.value || '',
            reportDate: format(this.validateForm.controls.reportDate.value, 'YYYY-MM-DD') || '',
            reportMonth: format(this.validateForm.controls.reportMonth.value, 'YYYY-MM') || '',
            reportYear: this.validateForm.controls.reportYear.value.no || '',
        };

        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        console.log('1111111111111');
        console.log(params);
        this.workReport.getDevExcel(params);
        this.orgNo = '';
        this.orgNames = '';
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
        this.validateForm.controls.devCatalog.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.devTypeList = [];
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


}
