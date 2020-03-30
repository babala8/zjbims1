import {Component, OnInit} from '@angular/core';
import {BankService} from '../bank.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './bank-modify.html'
})
export class BankModifyComponent implements OnInit {


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
    before;


    constructor(private fb: FormBuilder,
                private bankService: BankService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.pattern('^[-a-zA-Z0-9\u4e00-\u9fa5]+$'), Validators.minLength(2), Validators.maxLength(20)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5]+$'), Validators.minLength(2), Validators.maxLength(20)]],
            org: [null, [Validators.required]],
            phone: [null, [Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
            mobile: [null, [Validators.required,
                Validators.pattern('^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$')]],
            email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            isLeader: [null],
            isLobbyManager: [null],
            isDevManager: [null],
            isDeskManager: [null]
        });


        // 获取网点人员详细信息
        this.loading = true;
        this.bankService.getBank(this.banks.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.banks = data.data;
                this.before = data.data;
                this.validateForm.controls.no.setValue(this.banks.no);
                this.validateForm.controls.name.setValue(this.banks.name);
                this.validateForm.controls.org.setValue({
                    no: this.banks.orgNo,
                    name: this.banks.orgName
                } || {});
                this.validateForm.controls.phone.setValue(this.banks.phone || '');
                this.validateForm.controls.mobile.setValue(this.banks.mobile || '');
                this.validateForm.controls.email.setValue(this.banks.email || '');
                this.isLeader = this.banks.isLeader == null ? '0' : this.banks.isLeader;
                this.isLobbyManager = this.banks.isLobbyManager == null ? '0' : this.banks.isLobbyManager;
                this.isDevManager = this.banks.isDevManager == null ? '0' : this.banks.isDevManager;
                this.isDeskManager = this.banks.isDeskManager == null ? '0' : this.banks.isDeskManager;
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }

        if (this.validateForm.invalid) {
            return;
        }
        const params = {
            no: this.validateForm.controls.no.value,
            name: this.validateForm.controls.name.value,
            orgNo: this.validateForm.controls.org.value.no,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            email: this.validateForm.controls.email.value,
            isLeader: this.isLeader,
            isLobbyManager: this.isLobbyManager,
            isDevManager: this.isDevManager,
            isDeskManager: this.isDeskManager
        };
        this.loading = true;
        this.bankService.modBank(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改网点人员成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/bank']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
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
