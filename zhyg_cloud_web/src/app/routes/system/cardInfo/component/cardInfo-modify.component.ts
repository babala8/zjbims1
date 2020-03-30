import {Component, OnInit} from '@angular/core';
import {CardInfoService} from '../cardInfo.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './cardInfo-modify.html'
})
export class CardInfoModifyComponent implements OnInit {


    validateForm: FormGroup;
    cardInfo;
    loading = false;
    cardTypeList = [{name: '本行借记卡', value: '001'} , {name: '本行信用卡', value: '002'} , {name: '本行一账通卡', value: '003'},
                    {name: '单位结算卡', value: '004'} , {name: '存折', value: '005'} , {name: '村镇借记卡', value: '011'},
                    {name: '村镇贷记卡', value: '012'} , {name: '他行卡', value: '998'} , {name: '帐号', value: 'AAA'}];
    localFlagList = [{name: '本行卡', value: '1'} , {name: '村镇银行卡', value: '2'} , {name: '银联卡', value: '3'},
                    {name: 'VISA', value: '4'} , {name: 'JETCO', value: '5'}];

    constructor(private fb: FormBuilder,
                private cardInfoService: CardInfoService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单
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
        console.log('卡表信息');
        console.log(this.cardInfo);
        this.validateForm.controls.cardBin.setValue(this.cardInfo.idString1.substring(4));
        this.validateForm.controls.cardNoLength.setValue(this.cardInfo.cardNoLength);
        this.validateForm.controls.pcPwdLength.setValue(this.cardInfo.pcPwdLength);
        this.validateForm.controls.cardType.setValue(this.cardInfo.cardType);
        this.validateForm.controls.localFlag.setValue(this.cardInfo.localFlag);
        this.validateForm.controls.cardBank.setValue(this.cardInfo.cardBank);
        this.validateForm.controls.cardName.setValue(this.cardInfo.cardName);
        this.validateForm.controls.note.setValue(this.cardInfo.note);
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
            localFlag: this.validateForm.controls.localFlag.value,
            userId: this.session.getUserSession().account,
            serNo: this.cardInfo.serNo,
            cardBank: this.validateForm.controls.cardBank.value,
            cardName: this.validateForm.controls.cardName.value,
            note: this.validateForm.controls.note.value
        };
        this.loading = true;
        this.cardInfoService.modCardInfo(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改卡表成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/cardInfo']);
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
