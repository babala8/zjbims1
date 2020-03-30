import {Component, OnInit} from '@angular/core';
import {DevService} from '../dev.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {DevServiceManagerService} from '../../devServiceManager/devServiceManager.service';

@Component({
    templateUrl: './dev-detail-log.html',
})
export class DevDetailLogComponent implements OnInit {

    validateForm: FormGroup;
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    orgNoList = [];
    awayFlagList = [];
    workTypeList = [];
    devServiceList = [];
    isSelfBank = [];
    investmentInfo = [];
    spList = [];
    netTypeList = [];
    setupTypeList = [];
    cupAreaList = [];
    dev;
    devs;
    param;
    org;
    catalog;
    vendor;
    type;
    loading = false;

    constructor(private devService: DevService,
                private fb: FormBuilder,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private orgService: OrgService,
                private route: ActivatedRoute,
                private devServiceManagerService: DevServiceManagerService ) {
    }

    ngOnInit(): void {
        this.devService.getDevTypeByVendor({}).subscribe(
            data => {
                this.devTypeList = data.data;
                console.log(data.data);
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
                console.log(data.data);
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
                console.log(data.data);
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devServiceManagerService.getDevServiceManagers({}).subscribe(
            _data => {
                _data.data.forEach( item => {
                    this.devServiceList.push({no: item.no, name: item.name});
                });
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.orgService.getCupAreaList({}).subscribe(
            data => {
                if (data.data) {
                    this.cupAreaList = [];
                    console.log(data.data);
                    data.data.forEach(
                        item => {
                            this.cupAreaList.push({no: item.codeId, name: item.areaName});
                        }
                    );
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        this.investmentInfo = this.devService.getInvestmentInfo();
        this.isSelfBank = this.devService.getSelfBankInfo();
        this.awayFlagList = this.devService.getAwayFlagInfo();
        this.workTypeList = this.devService.getWorkTypeInfo();
        this.spList = this.devService.getSpInfo();
        this.netTypeList = this.devService.getNetTypeInfo();
        this.setupTypeList = this.devService.getSetupTypeInfo();
        this.validateForm = this.fb.group({
            devNo: [null],
            ip: [null],
            devCatalog: [null],
            devVendor: [null],
            orgName: [null],
            devType: [null],
            address: [null],
            awayFlag: [null],
            cupAreaCode: [null],
            workType: [null],
            devService: [null],
            atmpArea: [null],
            virtualTellerNo: [null],
            setupType: [null],
            serial: [null],
            cashboxLimit: [null],
            netType: [null],
            commPacket: [null],
            startDate: [null],
            stopDate: [null],
            expireDate: [null],
            patrolPeriod: [null],
            selfBank: [null],
            investment: [null],
            syn_startDate: [null],
            syn_stopDate: [null],
            syn_expireDate: [null],
            syn_patrolPeriod: [null],
            openTime: [null],
            closeTime: [null],
            accountOrgNo: [null],
            quarterLeaseAmount: [null],
        });
        if (this.param != null) {
            if (this.param.orgNo != null) {
                this.orgService.getOrg(this.param.orgNo).subscribe(data => {
                    this.org = data.data;
                    this.param.orgName = this.org.name;
                    if (this.param.catalogNo == null) {
                        this.param.catalogNo = this.param.devCatalogNo;
                    }
                    if (this.param.vendorNo == null) {
                        this.param.vendorNo = this.param.devVendorNo;
                    }
                    if (this.param.typeNo == null) {
                        this.param.typeNo = this.param.devTypeNo;
                    }
                    this.setvalue(this.param);
                    this.loading = false;
                });

            }
        }
    }
    setvalue(dev) {
        this.validateForm.controls.devNo.setValue(dev.no);
        this.validateForm.controls.ip.setValue(dev.ip);
        this.validateForm.controls.devCatalog.setValue(dev.catalogNo);
        this.validateForm.controls.devVendor.setValue(dev.vendorNo);
        this.validateForm.controls.orgName.setValue(dev.orgName);
        this.validateForm.controls.devType.setValue(dev.typeNo);
        this.validateForm.controls.address.setValue(dev.address || '');
        this.validateForm.controls.awayFlag.setValue(dev.awayFlag || '');
        this.validateForm.controls.workType.setValue(dev.workType || '');
        this.validateForm.controls.devService.setValue(dev.devService || '');
        this.validateForm.controls.atmpArea.setValue(dev.atmpArea || '');
        this.validateForm.controls.virtualTellerNo.setValue(dev.virtualTellerNo);
        this.validateForm.controls.serial.setValue(dev.serial);
        this.validateForm.controls.startDate.setValue(dev.startDate);
        this.validateForm.controls.stopDate.setValue(dev.stopDate || '');
        this.validateForm.controls.expireDate.setValue(dev.expireDate || '');
        this.validateForm.controls.patrolPeriod.setValue(dev.patrolPeriod || '');
        this.validateForm.controls.cashboxLimit.setValue(dev.cashboxLimit || '');
        this.validateForm.controls.netType.setValue(dev.netType || '');
        this.validateForm.controls.commPacket.setValue(dev.commPacket || '');
        this.validateForm.controls.setupType.setValue(dev.setupType || '');
        this.validateForm.controls.selfBank.setValue(dev.selfBank || '');
        this.validateForm.controls.investment.setValue(dev.investment || '');
        this.validateForm.controls.openTime.setValue(dev.openTime);
        this.validateForm.controls.closeTime.setValue(dev.closeTime);
        this.validateForm.controls.accountOrgNo.setValue(dev.accountOrgNo);
        this.validateForm.controls.quarterLeaseAmount.setValue(dev.quarterLeaseAmount);
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        // this.devService.back();
        this.nzModal.destroy('onCancel');
    }
}
