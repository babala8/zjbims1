import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {CardInfoService} from '../cardInfo.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';

@Component({
    templateUrl: './cardInfo-add.html'
})
export class CardInfoAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    cardTypeList = [{name: '本行借记卡', value: '001'} , {name: '本行信用卡', value: '002'} , {name: '本行一账通卡', value: '003'},
                    {name: '单位结算卡', value: '004'} , {name: '存折', value: '005'}, {name: '他行卡', value: '998'} ,
                    {name: '帐号', value: 'AAA'}];
    localFlagList = [{name: '本行卡', value: '1'} , {name: '村镇银行卡', value: '2'} , {name: '银联卡', value: '3'},
                    {name: 'VISA', value: '4'} , {name: 'JETCO', value: '5'}];
    constructor(private fb: FormBuilder,
                private catalogService: CardInfoService,
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
            cardBin: this.validateForm.controls.cardBin.value,
            cardNoLength: this.validateForm.controls.cardNoLength.value,
            pcPwdLength: this.validateForm.controls.pcPwdLength.value,
            cardType: this.validateForm.controls.cardType.value,
            userId: this.session.getUserSession().account,
            localFlag: this.validateForm.controls.localFlag.value,
            cardBank: this.validateForm.controls.cardBank.value,
            cardName: this.validateForm.controls.cardName.value,
            note: this.validateForm.controls.note.value
        };

        console.log(params);
        this.loading = true;
        this.catalogService.addCardInfo(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/cardInfo']);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            cardBin: [null, [Validators.required, Validators.pattern('[0-9]{1,20}'), Validators.maxLength(20)]],
            cardNoLength: [null, [Validators.required, Validators.pattern('[0-9]{1,2}'), Validators.maxLength(2)]],
            pcPwdLength: [null , [Validators.pattern('[0-9]{1,2}')]],
            cardType: [null, [Validators.required]],
            localFlag: [null, [Validators.required]],
            cardBank: [null, [Validators.required, Validators.maxLength(20)]],
            cardName: [null, [Validators.required, Validators.maxLength(50)]],
            note: [null , [Validators.maxLength(50)]]
        });
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

