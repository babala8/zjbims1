import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {SelfHelpBankService} from '../selfHelpBank.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {OrgService} from '../../org/org.service';
import {OrgType} from '../../../../models/orgType';
import {Page} from '../../../../models/page';
import {REGIONS} from '@core/constant';
import {environment} from '@env/environment';


@Component({
    templateUrl: './selfHelpBank-modify.html'
})
export class SelfHelpBankModifyComponent implements OnInit {
    @ViewChild('selfHelpBankmodifyIframe') selfHelpBankmodifyIframe: ElementRef;
    formModel = {};
    e= {
        x: '',
        y: '',
        address: '',
    };
    dataSet = [];
    page = new Page();
    vuelink: any;
    linkKey: any;
    userSession: any;
    regions = REGIONS;
    cities = [];
    i = 0;
    _options =  null;
    private link = `${environment.VUE_EXTEND_LINK}`;
    _value: any[] = null;
    default = [];
    AreaText = '';
    validateForm: FormGroup;
    selfHelpBank;
    org: Org;
    loading = false;
    showFlag = 0;
    orgGrade;
    orgTypeList: OrgType[] = [];
    before;
    flag = false;

    constructor(private fb: FormBuilder,
                private selfHelpBankService: SelfHelpBankService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private orgService: OrgService,
                private router: Router) {

    }

    tovue() {
        this.flag = true;
        // window.open('http://localhost:8080/#/login');
    }
    back() {
        this.flag = false;
    }
    ngOnInit(): void {
        // 初始化表单
        this.validateForm = this.fb.group({
           /* logicId: [null, [Validators.required, Validators.maxLength(40)]],*/
            bankName: [null, [Validators.required, Validators.maxLength(50)]],
            bankArea: [null, [Validators.maxLength(80)]],
            fhOrgNo: [null, [Validators.maxLength( 20)]],
            areaNoProvince: [null, [Validators.maxLength(10)]],
            areaNoCity: [null, [Validators.maxLength(10)]],
            areaNoCounty: [null, [Validators.maxLength(10)]],
            upper: [null, [Validators.required]],
            _value: [null],
        });
        // this.vuelink = 'http://localhost:8080/#/jin';
        this.vuelink = this.link + '/#/jin';
        this.userSession = {token: 'asdfdsfeewhiuffaikjf' };
        this.linkKey = 'orgadd-link';
        this.selfHelpBankService.getAreaData().subscribe(
            data => {
                // this.init_options = data.data;
                this._options = data.data;
            }
        );
        this.loading = true;
        this.selfHelpBankService.getSelfHelpBank(this.selfHelpBank.logicId).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.selfHelpBank = data.data;
                this.before = data.data;
                /*this.validateForm.controls.logicId.setValue(this.selfHelpBank.logicId);*/
                this.validateForm.controls.bankName.setValue(this.selfHelpBank.bankName);
                this.validateForm.controls.bankArea.setValue(this.selfHelpBank.bankArea);
                this.validateForm.controls.upper.setValue({no: this.selfHelpBank.fhOrgNo, name: this.selfHelpBank.orgName});
                /*this.validateForm.controls._value.setValue({
                    value: this.selfHelpBank.areaNoProvince,
                    label: this.selfHelpBank.provinceName,
                    children: [{
                        value: this.selfHelpBank.areaNoCity,
                        label: this.selfHelpBank.cityName,
                        childrend: [{
                            value: this.selfHelpBank.areaNoCounty,
                            label: this.selfHelpBank.countyName,
                            isLeaf: true
                        }]
                    }],
                  });*/
                this.AreaText = this.selfHelpBank.areaName;
                this.validateForm.controls._value.setValue([
                    {value: this.selfHelpBank.areaNoProvince, label: this.selfHelpBank.provinceName},
                    {value: this.selfHelpBank.areaNoCity, label: this.selfHelpBank.cityName},
                    {value: this.selfHelpBank.areaNoCounty, label: this.selfHelpBank.countyName},
                ]);
                },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    getSonData(e) {
        this.e = e;
        console.log(e.address);
        console.log(e.x);
        console.log(e.y);
        if ( e.code === 'ok' ) {
        }
    }


    _console(value) {
        console.log(value);
        this._value = value;
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
            logicId: this.selfHelpBank.logicId,
            bankName: this.validateForm.controls.bankName.value,
            bankArea: this.validateForm.controls.bankArea.value,
            fhOrgNo: this.validateForm.controls.upper.value.no || '',
            x: this.e.x,
            y: this.e.y,
            // areaNoProvince: this.validateForm.controls.areaNoProvince.value,
            // areaNoCity: this.validateForm.controls.areaNoCity.value,
            areaNoCounty: this.validateForm.controls._value.value[2].value
        };
        if (this._value.length != 0) {
            params.areaNoCounty = this._value[2];
        }
        console.log(params, 996);
        this.loading = true;
        this.selfHelpBankService.modSelfHelpBank(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改自助银行信息成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/selfHelpBank']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    getFormControl(bankName) {
        return this.validateForm.controls[bankName];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['bankName'].updateValueAndValidity();
        });
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
