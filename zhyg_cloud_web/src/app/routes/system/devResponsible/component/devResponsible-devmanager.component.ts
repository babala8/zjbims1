import {Component, OnInit} from '@angular/core';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {BankService} from '../../bank/bank.service';


@Component({
    templateUrl: './devResponsible-devmanager.html'
})
export class DevManagerComponent implements OnInit {


    validateForm: FormGroup;
    manager;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;

    constructor(private fb: FormBuilder,
                private bankService: BankService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService) {

    }


    ngOnInit(): void {

        this.validateForm = this.fb.group({
            no: [null],
            name: [null],
            org: [null],
            phone: [null],
            mobile: [null],
            email: [null],
        });

        // 获取管机员详细信息
        this.loading = true;
        this.bankService.getBank(this.manager.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.manager = data.data;
                this.validateForm.controls.no.setValue(this.manager.no);
                this.validateForm.controls.name.setValue(this.manager.name);
                this.validateForm.controls.org.setValue(this.manager.orgName);
                this.validateForm.controls.phone.setValue(this.manager.phone || '');
                this.validateForm.controls.mobile.setValue(this.manager.mobile || '');
                this.validateForm.controls.email.setValue(this.manager.email || '');
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
