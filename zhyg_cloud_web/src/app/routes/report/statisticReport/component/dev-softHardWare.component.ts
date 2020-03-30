import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {BaseReportService} from '../../baseReport/base-report.service';
import {HttpResponse} from '@angular/common/http';
import {StatisticReportService} from '../statistic-report.service';

@Component({
    selector: 'softHardWare-factor',
    templateUrl: 'dev-softHardWare-info.html'
})
export class DevSoftHardWareComponent implements OnInit, OnChanges {



    validateForm: FormGroup;

    awayFlagList = [];
    devCatalogList = [];
    devVendorList = [];
    devTypeList = [];
    orgNo = '';
    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: BaseReportService,
        private message: NzMessageService,
        private devCountReport: StatisticReportService

    ) {
    }


    ngOnChanges(): void {
    }

    ngOnInit(): void {

        this.awayFlagList = this.workReport.getAwayFlagInfo();
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

            org: [{no: '', name: ''}],
            devVendor: [null, Validators.maxLength(5)],
        });
    }



    getDevExcel() {
        if (  this.validateForm.controls.org.value.no == '' || this.validateForm.controls.org.value.no == null ) {
            this.orgNo = this.session.getUserSession().orgNo;
        }else {
            this.orgNo = this.validateForm.controls.org.value.no;
        }

        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            orgNo: this.orgNo,
            orgName: this.validateForm.controls.org.value.name || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
        };
        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        this.message.info('报表生成中请稍后...');
        // this.devCountReport.devCountStatistic(params);
    }
    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.devVendor.setValue('');

    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }



}
