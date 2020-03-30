import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {SelfHelpBankService} from '../selfHelpBank.service';
import {NzMessageService, NzModalSubject,  NzNotificationService} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {OrgType} from '../../../../models/orgType';
import {Org} from '../../../../models/org';
import {OrgService} from '../../org/org.service';
import {Page} from '../../../../models/page';
import {environment} from '@env/environment';

@Component({
    selector: 'nz-demo-cascader-basic',
    templateUrl: './selfHelpBank-add.html'
})
export class SelfHelpBankAddComponent implements OnInit {
    @ViewChild('selfHelpBankaddIframe') selfHelpBankaddIframe: ElementRef;
    formModel = {};
    e= {
        x: '',
        y: '',
        address: '',
    };

    private link = `${environment.VUE_EXTEND_LINK}`;
    validateForm: FormGroup;
    dataSet = [];
    page = new Page();
    vuelink: any;
    linkKey: any;
    userSession: any;
    _options =  null;
    _value: any[] = null;
    loading = false;
    regions = REGIONS;
    cities = [];
    i = 0;
    flag= false;
    showFlag = 0;
    orgGrade;
    orgTypeList: OrgType[] = [];
    init_options = [];
    AreaText = '请选择省市县';
    org = new Org();
    upper = {no: '', name: ''};
    constructor(private fb: FormBuilder,
                private selfHelpBankService: SelfHelpBankService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private orgService: OrgService,
                private router: Router) {
    }

    /**
     * 选择上级机构后，查询用户可选的机构类型列表
     * @param evt
     */
    selectOrg(evt: any) {
        this.validateForm.controls.orgType.setValue(null); // 选择上级机构，先清空机构类型
        const orgNo = evt.no;
        if (orgNo) {
            this.orgService.getOrg(orgNo)
                .subscribe(_data => {
                        this.org = _data.data;
                        console.log('grade1: ' + this.org.orgType.grade);
                        if (this.org.orgType.grade === '5') {
                            this.validateForm.controls.upper.setValue({no: '', name: ''});
                            this.orgTypeList = [];
                            this.message.error('所选机构不允许作为上级机构!', {nzDuration: 2000});
                        } else {
                            this.orgService.getOrgTypesByGrade(this.org.orgType.grade).subscribe(
                                _data1 => {
                                    const data = _data1.data;
                                    const data1 = [];
                                    this.loading = false;
                                    for (this.i = 0; this.i < data.length; (this.i)++) {
                                        if ((Number(data[this.i].grade)) === (Number(this.org.orgType.grade) + 1)) {
                                            data1.push(data[this.i]);
                                        }
                                    }
                                    console.log(data);
                                    this.orgTypeList = data1;
                                },
                                error => {
                                    this.loading = false;
                                    this.message.error(error.body.retMsg);
                                }
                            );
                        }
                    }
                );
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
           /* logicId: this.validateForm.controls.logicId.value,*/
            bankName: this.validateForm.controls.bankName.value,
            bankArea: this.validateForm.controls.bankArea.value,
            fhOrgNo:  this.validateForm.controls.upper.value.no || '',
            x: this.e.x,
            y: this.e.y,
            // areaNoProvince: this.validateForm.controls._value.value,
            areaNoCounty: this._value[2],
            // areaNoCity: this.validateForm.controls.areaNoCity.value,
            // areaNoCounty: this.validateForm.controls.areaNoCounty.value,
        };

        console.log(params);
        this.loading = true;
        this.selfHelpBankService.addSelfHelpBank(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/selfHelpBank']);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

    }


    tovue() {
        this.flag = true;
        // window.open('http://localhost:8080/#/login');
    }
    back() {
        this.flag = false;
    }
    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
           /* logicId: [null, [Validators.required, Validators.maxLength(40)]],*/
            bankName: [null, [Validators.required, Validators.maxLength( 50)]],
            bankArea: [null, [Validators.maxLength(80)]],
            areaNoProvince: [null, [Validators.maxLength(10)]],
            areaNoCity: [null, [Validators.maxLength(10)]],
            areaNoCounty: [null, [Validators.maxLength(10)]],
            upper: [null, [Validators.required]],
            _value: [null]
        });
        // this.vuelink = 'http://localhost:8080/#/jin';
        this.vuelink = this.link + '/#/latlon';
        this.linkKey = 'orgadd-link';
         this.selfHelpBankService.getAreaData().subscribe(
            data => {
             // this.init_options = data.data;
              this._options = data.data;
            }
        );

    }
    getSonData(e) {
        this.e = e;
        console.log(e.address);
        console.log(e.x);
        console.log(e.y);
        if ( e.code === 'ok' ) {
        }
    }


    /**
     * 根据字段名获取表单字段值
     * @param publisher
     */
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

