import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {GlobalCfgService} from '../globalCfg.service';


@Component({
    templateUrl: './globalCfg-modify.html'
})
export class GlobalCfgModifyComponent implements OnInit {


    validateForm: FormGroup;
    globalCfg;
    loading = false;

    constructor(private fb: FormBuilder,
                private globalCfgService: GlobalCfgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }

    ngOnInit(): void {
        // 初始化表单
        this.validateForm = this.fb.group({
            paraName: [null, [Validators.required,  Validators.maxLength(40)]],
            showName: [null, [Validators.required, Validators.maxLength(80)]],
            paraValue: [null, [Validators.required,  Validators.maxLength(400)]],
            defValue: [null, [Validators.required,  Validators.maxLength(400)]],
            catalog: [null, [Validators.required,  Validators.maxLength(20)]],
            descript: [null, [Validators.maxLength(200)]],
        });
        console.log(this.globalCfg);
        this.validateForm.controls.paraName.setValue(this.globalCfg.paraName);
        this.validateForm.controls.showName.setValue(this.globalCfg.showName);
        this.validateForm.controls.paraValue.setValue(this.globalCfg.paraValue);
        this.validateForm.controls.defValue.setValue(this.globalCfg.defValue);
        this.validateForm.controls.catalog.setValue(this.globalCfg.catalog);
        this.validateForm.controls.descript.setValue(this.globalCfg.descript);
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
            paraName: this.validateForm.controls.paraName.value,
            showName: this.validateForm.controls.showName.value,
            paraValue: this.validateForm.controls.paraValue.value,
            defValue: this.validateForm.controls.defValue.value,
            catalog: this.validateForm.controls.catalog.value,
            descript: this.validateForm.controls.descript.value,
        };
        this.loading = true;
        this.globalCfgService.modGlobalCfg(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改参数配置成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/globalCfg']);
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
