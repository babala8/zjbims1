import {Component, OnInit} from '@angular/core';
import {VendorService} from '../vendor.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './vendor-detail-log.html'
})
export class VendorDetailLogComponent implements OnInit {


    validateForm: FormGroup;
    vendors;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;
    param;

    constructor(private fb: FormBuilder,
                private vendorService: VendorService,
                private nzModal: NzModalSubject,
    ) {
    }
    ngOnInit(): void {
        // 初始化表单
        this.validateForm = this.fb.group({
            no: [null],
            name: [null],
        });
        if (this.param !== null) {
            this.vendors = this.param;
        }
        this.validateForm.controls.no.setValue(this.vendors.no);
        this.validateForm.controls.name.setValue(this.vendors.name);
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
