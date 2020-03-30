import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {OrgService} from '../org.service';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';

import {Org} from '../../../../models/org';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {OrgType} from '../../../../models/orgType';
import {Router} from '@angular/router';
import {Page} from '../../../../models/page';
import {SysMenuService} from '../../menu/menu.service';
import {environment} from '@env/environment';

@Component({
    templateUrl: './org-add.html',
    styles: [`
    :host{
        height: 100%;
    }
    `]
})
export class OrgAddComponent implements OnInit {
    @ViewChild('orgaddIframe') orgaddIframe: ElementRef;
    e= {
        x: '',
        y: '',
        address: '',
    };
    private link = `${environment.VUE_EXTEND_LINK}`;
    validateForm: FormGroup;
    orgGrade;
    orgTypeList: OrgType[] = [];
    regions = REGIONS;
    cities = [];
    i = 0;
    org = new Org();
    showFlag = 0;
    formModel = {};
    dataSet = [];
    loading = false;
    page = new Page();
    vuelink: any;
    linkKey: any;
    userSession: any;
    flag= false;
    cupAreaList = [];
    provinceArea = [];
    cityArea = [];
    countyArea = [];

    constructor(private fb: FormBuilder,
                private modal: NzModalService,
                private menuService: SysMenuService,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
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
                        if (this.org.orgType.grade === '3') {
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
            parentOrgNo: this.validateForm.controls.upper.value.no || '',
            orgTypeNo: this.validateForm.controls.orgType.value || '',
            isSelfhelp: this.validateForm.controls.isSelfhelp.value || 1,
            address: this.validateForm.controls.address.value || '',
            x: this.validateForm.controls.x.value || '',
            y: this.validateForm.controls.y.value || '',
            linkman: this.validateForm.controls.linkman.value || '',
            telephone: this.validateForm.controls.telephone.value || '',
            cupAreaCode: this.validateForm.controls.cupAreaCode.value || '',
            areaNoProvince: this.validateForm.controls.areaNoProvince.value || '',
            areaNoCity: this.validateForm.controls.areaNoCity.value || '',
            areaNoCounty: this.validateForm.controls.areaNoCounty.value || '',
        };

        console.log(params);
        this.loading = true;
        this.orgService.addOrg(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加机构成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/org']);
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
            no: [null, [Validators.required, Validators.pattern('^[A-Za-z0-9]+$'), Validators.minLength(4), Validators.maxLength(20)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5]+$'), Validators.maxLength(80)]],
            upper: [null, [Validators.required]],
            orgType: [null, [Validators.required]],
            isSelfhelp: ['1', [Validators.required]],
            address: [null, [Validators.required, Validators.pattern('^([.]+[s\u4e00-\u9fa5a-z0-9_-]{0,})|' +
                '([s\u4e00-\u9fa5a-z0-9_-][.]{0,})$'), Validators.maxLength(200)]],
            x: [null, [Validators.maxLength(20)]],
            y: [null, [Validators.maxLength(20)]],
            linkman: [null, [Validators.maxLength(20)]],
            telephone: [null, [Validators.maxLength(20)]],
            cupAreaCode: [null],
            areaNoProvince: [null],
            areaNoCity: [null],
            areaNoCounty: [null],
        });
        // this.vuelink = 'http://localhost:8080/#/latlon';
        this.vuelink = this.link + '/#/latlon';
        this.linkKey = 'orgadd-link';
        this.orgService.getCupAreaList({}).subscribe(
            data => {
                if (data.data) {
                    this.cupAreaList = [];
                    console.log(data.data);
                    data.data.forEach(
                        item => {
                            this.cupAreaList.push({no: item.codeId, name: item.areaName});
                        }
                    );
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        this.orgService.getProvinceAreaList({
            grade: '1'
        }).subscribe(
            data => {
                if (data.data) {
                    this.provinceArea = [];
                    data.data.forEach(
                        item => {
                            this.provinceArea.push({no: item.code, name: item.codeName});
                        }
                    );
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    getSonData(e) {
        this.e = e;
        console.log(e);
        if ( e.code === 'ok' ) {
        }
    }
    qryCityAreaList(provinceCode) {
        this.validateForm.controls.areaNoCity.reset();
        this.validateForm.controls.areaNoCounty.reset();
        this.orgService.getProvinceAreaList({
            grade: '2',
            provinceCode: provinceCode
        }).subscribe(
            data => {
                if (data.data) {
                    this.cityArea = [];
                    data.data.forEach(
                        item => {
                            this.cityArea.push({no: item.code, name: item.codeName});
                        }
                    );
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    qryCountyAreaList(cityCode) {
        this.validateForm.controls.areaNoCounty.reset();
        this.orgService.getProvinceAreaList({
            grade: '3',
            cityCode: cityCode
        }).subscribe(
            data => {
                if (data.data) {
                    this.countyArea = [];
                    data.data.forEach(
                        item => {
                            this.countyArea.push({no: item.code, name: item.codeName});
                        }
                    );
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
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

