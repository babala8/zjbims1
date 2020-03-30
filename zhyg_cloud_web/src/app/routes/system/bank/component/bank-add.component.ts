import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {BankService} from '../bank.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {Org} from '../../../../models/org';

@Component({
    templateUrl: './bank-add.html'
})
export class BankAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    regions = REGIONS;
    cities = [];
    i = 0;
    org = new Org();
    showFlag = 0;
    isLeader;
    isLobbyManager;
    isDevManager;
    isDeskManager;

    constructor(private fb: FormBuilder,
                private bankService: BankService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private router: Router) {
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
            orgNo: this.validateForm.controls.orgNo.value.no,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            email: this.validateForm.controls.email.value,
            isLeader: this.isLeader,
            isLobbyManager: this.isLobbyManager,
            isDevManager: this.isDevManager,
            isDeskManager: this.isDeskManager
        };
        // 参数验证
        const reg = /^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$/; // 非法字符正则
        if ( !reg.exec(params.name)) {
            this.message.warning(`用户名含有非法字符！`);
            return ;
        }

        console.log(params);
        this.loading = true;
        this.bankService.addBank(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加银行网点人员成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/bank']);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    regionChange(region) {
        console.log(region);
        // this.validateForm.controls.city.setValue(null);
        for (const r of this.regions) {
            if (r.name === region) {
                this.cities = CITIES[r.no];
            }
        }
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5]+$'), Validators.maxLength(10)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5]+$'), Validators.minLength(2), Validators.maxLength(20)]],
            orgNo: [null, [Validators.required]],
            phone: [null, [Validators.required, Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
            mobile: [null, [Validators.required,
                Validators.pattern('^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$')]],
            email: [null, [Validators.required,
                Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            isLeader: [null],
            isLobbyManager: [null],
            isDevManager: [1],
            isDeskManager: [null]
        });
        this.isLeader = 0;
        this.isLobbyManager =  0;
        this.isDevManager =  1;
        this.isDeskManager = 0;
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
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

