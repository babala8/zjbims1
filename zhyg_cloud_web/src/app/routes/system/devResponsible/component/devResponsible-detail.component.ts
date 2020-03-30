import {Component, OnInit} from '@angular/core';
import {DevResponsibleService} from '../devResponsible.service';
import {Dev} from '../../../../models/dev';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {ActivatedRoute, Router} from '@angular/router';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {DevService} from '../../dev/dev.service';
import {DevServiceManagerService} from '../../devServiceManager/devServiceManager.service';

@Component({
    templateUrl: './devResponsible-detail.html',
})
export class DevResponsibleDetailComponent implements OnInit {

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
    dev;
    devs;
    loading = false;

    constructor(private devResponsibleService: DevResponsibleService,
                private devService: DevService,
                private fb: FormBuilder,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private devServiceManagerService: DevServiceManagerService ) {
    }

    ngOnInit(): void {
        // 初始化表单
        const no = this.devs.devNo;
        console.log('devNo:' + no);
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
            workType: [null],
            devService: [null],
            sp: [null],
            virtualTellerNo: [null],
            setupType: [null],
            x: [null],
            y: [null],
            serial: [null],
            cashboxLimit: [null],
            netType: [null],
            commPacket: [null],
            startDate: [null],
            stopDate: [null],
            expireDate: [null],
            patrolPeriod: [null ],
        });

        // 获取设备详细信息
        this.loading = true;
        this.devResponsibleService.getDev(no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.dev = data.data;
                this.validateForm.controls.devNo.setValue(this.dev.no);
                this.validateForm.controls.ip.setValue(this.dev.ip);
                this.validateForm.controls.devCatalog.setValue(this.dev.catalogNo);
                this.validateForm.controls.devVendor.setValue(this.dev.vendorNo);
                this.validateForm.controls.orgName.setValue(this.dev.orgName);
                this.validateForm.controls.devType.setValue(this.dev.typeNo);
                this.validateForm.controls.address.setValue(this.dev.address || '');
                this.validateForm.controls.x.setValue(this.dev.x || '');
                this.validateForm.controls.y.setValue(this.dev.y || '');
                this.validateForm.controls.awayFlag.setValue(this.dev.awayFlag || '');
                this.validateForm.controls.workType.setValue(this.dev.workType || '');
                this.validateForm.controls.devService.setValue(this.dev.devService || '');
                this.validateForm.controls.sp.setValue(this.dev.sp || '');
                this.validateForm.controls.virtualTellerNo.setValue(this.dev.virtualTellerNo);
                this.validateForm.controls.serial.setValue(this.dev.serial);
                this.validateForm.controls.startDate.setValue(this.dev.startDate);
                this.validateForm.controls.stopDate.setValue(this.dev.stopDate || '');
                this.validateForm.controls.expireDate.setValue(this.dev.expireDate || '');
                this.validateForm.controls.patrolPeriod.setValue(this.dev.patrolPeriod || '');
                this.validateForm.controls.cashboxLimit.setValue(this.dev.cashboxLimit || '');
                this.validateForm.controls.netType.setValue(this.dev.netType || '');
                this.validateForm.controls.commPacket.setValue(this.dev.commPacket || '');
                this.validateForm.controls.setupType.setValue(this.dev.setupType || '');
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}
