import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {BaseReportService} from '../base-report.service';
import {HttpResponse} from '@angular/common/http';

@Component({
    selector: 'devInfo-factor',
    templateUrl: 'dev-info.html'
})
export class DevInfoComponent implements OnInit, OnChanges {


    rows = 'terminalNo,parentOrgName,orgName,address,devService,subject,vendorName,awayFlag' +
        ',workType,catalogName,installDate,startDate,operateStatus,typeName,setupType,selfBank' +
        ',cooperationCount,rent,ip,note';
    validateForm: FormGroup;

    awayFlagList = [];
    devCatalogList = [];
    devVendorList = [];
    devTypeList = [];
    orgNo = '';
    orgNames = '';
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



    getDevExcel(type: any) {
        // 获得选择的所有品牌名字
        // let  vendorNames = '';
        const devVendorNo = this.validateForm.controls.devVendor.value;
        // for (let vendorNo of devVendorNo) {
        //     for (let vendor of this.devVendorList) {
        //         if (vendorNo == vendor.no) {
        //             vendorNames += vendor.name + ' ';
        //             console.log(vendorNames);
        //         }
        //     }
        // }
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
            ip: '',
            orgNo: this.orgNo,
            orgName: this.orgNames,
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            // devVendorName: vendorNames,
            devType: this.validateForm.controls.devType.value || '',
            awayFlag: this.validateForm.controls.awayFlag.value || '',
            viewTable : type,
            rows: this.rows,
        };

        this.message.info('报表生成中请稍后...');
        if (type == 1) {
            this.workReport.viewGetDevExcel(params);
        } else if (type == 2) {
            this.workReport.getDevExcel(params);
        }
        // this.workReport.getDevExcel(params);
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

}
