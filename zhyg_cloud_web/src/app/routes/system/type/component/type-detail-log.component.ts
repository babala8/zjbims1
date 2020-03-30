import {Component, OnInit} from '@angular/core';
import {FormControl} from '@angular/forms';
import {TypeService} from '../type.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './type-detail-log.html'
})
export class TypeDetailLogComponent implements OnInit {


    validateForm: FormGroup;
    type;
    devCatalogList = [];
    devVendorList = [];
    org: Org;
    loading = false;
    showFlag = 0;
    i = 0;
    cashTypeList = [
        {no: '1', name: '现金'},
        {no: '2', name: '非现金'},
    ];
    param;

    constructor(private fb: FormBuilder,
                private typeService: TypeService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.typeService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.typeService.getDevVendorInfo({}).subscribe(
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
            no: [null],
            name: [null],
            devVendor: [null],
            devCatalog: [null],
            cashType: [null],
        });


        // 获取机构详细信息
        if (this.param != null) {
            this.type = this.param;
        }
        this.validateForm.controls.no.setValue(this.type.no);
        this.validateForm.controls.name.setValue(this.type.name);
        this.validateForm.controls.devVendor.setValue(this.type.vendorNo || '');
        this.validateForm.controls.devCatalog.setValue(this.type.catalogNo || '');
        this.validateForm.controls.cashType.setValue(this.type.cashType || '');
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
