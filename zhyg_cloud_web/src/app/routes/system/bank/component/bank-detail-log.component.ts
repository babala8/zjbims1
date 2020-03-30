import {Component, OnInit} from '@angular/core';
import {FormControl} from '@angular/forms';
import {BankService} from '../bank.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {OrgService} from '../../org/org.service';


@Component({
    templateUrl: './bank-detail-log.html'
})
export class BankDetailLogComponent implements OnInit {


    validateForm: FormGroup;
    banks;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;
    isLeader;
    isLobbyManager;
    isDevManager;
    isDeskManager;
    param;

    constructor(private fb: FormBuilder,
                private bankService: BankService,
                private nzModal: NzModalSubject,
                private orgService: OrgService) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null],
            name: [null],
            org: [null],
            phone: [null],
            mobile: [null],
            email: [null],
            isLeader: [null],
            isLobbyManager: [null],
            isDevManager: [null],
            isDeskManager: [null]
        });


        // 获取网点人员详细信息
        this.loading = true;
        if (this.param !== null) {
            this.banks = this.param;
        }
        this.orgService.getOrg(this.banks.orgNo).subscribe(data => {
            this.org = data.data;
            this.validateForm.controls.no.setValue(this.banks.no || '');
            this.validateForm.controls.name.setValue(this.banks.name || '');
            this.validateForm.controls.org.setValue(this.org.name || '');
            this.validateForm.controls.phone.setValue(this.banks.phone || '');
            this.validateForm.controls.mobile.setValue(this.banks.mobile || '');
            this.validateForm.controls.email.setValue(this.banks.email || '');
            this.isLeader = this.banks.isLeader;
            this.isLobbyManager = this.banks.isLobbyManager;
            this.isDevManager = this.banks.isDevManager;
            this.isDeskManager = this.banks.isDeskManager;
        });


    }


    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
