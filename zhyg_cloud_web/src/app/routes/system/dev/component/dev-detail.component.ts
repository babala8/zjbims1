import {Component, OnInit} from '@angular/core';
import {DevService} from '../dev.service';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {OrgService} from '../../org/org.service';
import {CatalogService} from '../../catalog/catalog.service';
import {VendorService} from '../../vendor/vendor.service';
import {TypeService} from '../../type/type.service';
import {DevServiceManagerService} from '../../devServiceManager/devServiceManager.service';

@Component({
    templateUrl: './dev-detail.html',
})
export class DevDetailComponent implements OnInit {

    validateForm: FormGroup;
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    awayFlagList = [];
    workTypeList = [];
    devServiceList = [];
    spList = [];
    netTypeList = [];
    setupTypeList = [];
    isSelfBank = [];
    investmentInfo = [];
    cupAreaList = [];
    loading = false;
    formModel = {};

    dev;
    devs;
    // 审批查看页面传递的数据
    param;
    beforeOrcurrent;

    constructor(private devService: DevService,
                private fb: FormBuilder,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private orgService: OrgService,
                private catalogService: CatalogService,
                private vendorService: VendorService,
                private typeService: TypeService,
                private devServiceManagerService: DevServiceManagerService ) {
    }

    ngOnInit(): void {

        this.initSelectList();

        this.initPageData();
    }

    initPageData() {
            // 初始化表单
            const devNo = this.devs.no;
            this.loading = true;
            this.devService.getDev(devNo).subscribe(data => {
                this.loading = false;
                this.devs = data.data;
                this.formModel['no'] = this.devs.no;
                this.formModel['ip'] = this.devs.ip;
                this.formModel['devCatalog'] = this.devs.catalogName;
                this.formModel['devVendor'] = this.devs.vendorName;
                this.formModel['orgName'] = this.devs.orgName;
                this.formModel['devType'] = this.devs.typeName;
                this.formModel['address'] = this.devs.address;
                this.formModel['awayFlag'] = this.getNameByindex(this.awayFlagList, this.devs.awayFlag);
                this.formModel['workType'] = this.getNameByindex(this.workTypeList, this.devs.workType);
                this.formModel['devService'] = this.getNameByindex(this.devServiceList, this.devs.devService);
                this.formModel['atmpArea'] = this.getNameByindex(this.cupAreaList, this.devs.atmpArea);
                this.formModel['virtualTellerNo'] = this.devs.virtualTellerNo;
                this.formModel['serial'] = this.devs.serial;
                this.formModel['startDate'] = this.devs.startDate;
                this.formModel['stopDate'] = this.devs.stopDate;
                this.formModel['expireDate'] = this.devs.expireDate;
                this.formModel['patrolPeriod'] = this.devs.patrolPeriod;
                this.formModel['cashboxLimit'] = this.devs.cashboxLimit;
                this.formModel['netType'] = this.getNameByindex(this.netTypeList, this.devs.netType);
                this.formModel['commPacket'] = this.devs.commPacket;
                this.formModel['setupType'] = this.getNameByindex(this.setupTypeList, this.devs.setupType);
                this.formModel['selfBank'] = this.getNameByindex(this.isSelfBank, this.devs.selfBank);
                this.formModel['investment'] = this.getNameByindex(this.investmentInfo, this.devs.investment);
                this.formModel['quarterAmount'] = this.devs.quarterAmount;
                this.formModel['coreOrgNo'] = this.devs.coreOrgNo;
                this.formModel['openTime'] = this.devs.openTime;
                this.formModel['closeTime'] = this.devs.closeTime;
                this.formModel['accountOrgNo'] = this.devs.accountOrgNo;
                this.formModel['quarterLeaseAmount'] = this.devs.quarterLeaseAmount;
                console.log(this.devs.openTime);
            });
    }


    initSelectList() {
        this.devService.getDevTypeByVendor({}).subscribe(
            data => {
                this.devTypeList = data.data;
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
        // this.devServiceList = this.devService.getDevServiceInfo();
        this.spList = this.devService.getSpInfo();
        this.netTypeList = this.devService.getNetTypeInfo();
        this.setupTypeList = this.devService.getSetupTypeInfo();
    }

    getNameByindex(list, no) {
        let name = '';
        list.forEach( m => {
            if (m.no == no) {
                name = m.name;
            }
        });
        return name;
    }


    cancel() {
        // this.devService.back();
        this.nzModal.destroy('onCancel');
    }
}
