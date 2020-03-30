import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {BaseReportService} from '../base-report.service';
import {HttpResponse} from '@angular/common/http';

@Component({
    selector: 'devVersion-factor',
    templateUrl: 'dev-version.html'
})
export class DevVersionComponent implements OnInit, OnChanges {


    validateForm: FormGroup;

    awayFlagList = [];
    devCatalogList = [];
    devVendorList = [];
    devTypeList = [];

    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: BaseReportService,
        private message: NzMessageService,

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
            devNo: [null, Validators.maxLength(20)],
            ip: [null, Validators.maxLength(20)],
            org: [{no: '', name: ''}],
            devCatalog: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            devType: [null, Validators.maxLength(5)],
            awayFlag: [null, Validators.maxLength(5)],
        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }

    getDevExcel() {
        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            devNo: this.validateForm.controls.devNo.value || '',
            ip: this.validateForm.controls.ip.value || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            awayFlag: this.validateForm.controls.awayFlag.value || '',
        };
        this.message.info('报表生成中请稍后...');
        this.workReport.getDevExcel(params);
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
        console.log(evt);
        if (evt) {
            const params = {
                devVendor: evt || '',
                devCatalog: '',
            }
            console.log(params);
            this.workReport.getDevTypeByVendor(params).subscribe(
                data => {
                    this.devTypeList = data.data;
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
