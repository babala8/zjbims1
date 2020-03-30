import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {OrgService} from '../org.service';
import {Org} from '../../../../models/org';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {OrgType} from '../../../../models/orgType';

@Component({
    templateUrl: './org-modify.html'
})
export class OrgModifyComponent implements OnInit {


    validateForm: FormGroup;
    orgs;
    org: Org;
    loading = false;
    showFlag = 0;
    tmp;
    upper = '';
    i = 0;
    orgTypeList: OrgType[] = [];
    // 临时存放机构类型
    temp_orgType;
    // 临时存放父机构
    temp_parentOrg;
    before;
    cupAreaList = [];
    provinceArea = [];
    cityArea = [];
    countyArea = [];

    constructor(private fb: FormBuilder,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单
        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.pattern('^[A-Za-z0-9]+$'), Validators.minLength(4), Validators.maxLength(20)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5]+$'), Validators.maxLength(80)]],
            upper: [null, [Validators.required]],
            orgType: [null, [Validators.required]],
            isSelfhelp: [null, [Validators.required]],
            address: [null, [Validators.required, Validators.pattern('^([.]+[s\u4e00-\u9fa5a-z0-9_-]{0,})|' +
                '([s\u4e00-\u9fa5a-z0-9_-][.]{0,})$'), Validators.maxLength(200)]],            x: [null, Validators.maxLength(20)],
            y: [null, Validators.maxLength(20)],
            linkman: [null, Validators.maxLength(20)],
            telephone: [null, Validators.maxLength(20)],
            cupAreaCode: [null],
            areaNoProvince: [null],
            areaNoCity: [null],
            areaNoCounty: [null],
        });
        this.tmp = [{no: '', name: ''}];

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

        // 获取机构详细信息
        this.loading = true;
        this.orgService.getOrg(this.orgs.no).subscribe(
            _data => {
                const data = _data.data;
                this.loading = false;
                this.org = data;
                console.log(this.org);
                this.before = _data.data;
                this.validateForm.controls.no.setValue(this.org.no);
                this.validateForm.controls.name.setValue(this.org.name);
                if (this.org.parentOrgNo) {
                    // 机构树的value是{no: orgNo, name: orgName}格式
                    this.validateForm.controls.upper.setValue({
                        no: this.org.parentOrgNo,
                        name: data.parentOrgName
                    } || {});
                } else {
                    // 总行没有上级机构，因此上级机构为自己
                    this.validateForm.controls.upper.setValue({
                        no: '',
                        name: ''
                    });
                }
                // 为机构树赋值后会触发监听方法，查询机构类型后刷新机构类型字段
                // this.validateForm.controls.orgType.setValue({
                //     no: this.org.orgType,
                //     name: this.org.orgTypeName
                // } || {});
                this.validateForm.controls.orgType.setValue(this.org.orgType.no || '');
                this.validateForm.controls.isSelfhelp.setValue(String(this.org.isSelfhelp)  || '');
                this.validateForm.controls.address.setValue(this.org.address || '');
                this.validateForm.controls.x.setValue(this.org.x || '');
                this.validateForm.controls.y.setValue(this.org.y || '');
                this.validateForm.controls.linkman.setValue(this.org.linkman || '');
                this.validateForm.controls.telephone.setValue(this.org.telephone || '');
                this.validateForm.controls.cupAreaCode.setValue(this.org.cupAreaCode || '');
                this.validateForm.controls.areaNoProvince.setValue(this.org.areaNoProvince || '');
                this.validateForm.controls.areaNoCity.setValue(this.org.areaNoCity || '');
                this.validateForm.controls.areaNoCounty.setValue(this.org.areaNoCounty || '');

            },
            error => {
                console.log(error);
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    qryCityAreaList(provinceCode) {
        this.validateForm.controls.areaNoCity.reset();
        this.validateForm.controls.areaNoCounty.reset();
        this.orgService.getProvinceAreaList({
            grade: '2',
            provinceCode: provinceCode || ''
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
            cityCode: cityCode || ''
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
            address: this.validateForm.controls.address.value,
            name: this.validateForm.controls.name.value,
            no: this.validateForm.controls.no.value,
            orgTypeNo: this.validateForm.controls.orgType.value,
            isSelfhelp: this.validateForm.controls.isSelfhelp.value,
            parentOrgNo: this.validateForm.controls.upper.value.no,
            x: this.validateForm.controls.x.value,
            y: this.validateForm.controls.y.value,
            linkman: this.validateForm.controls.linkman.value,
            telephone: this.validateForm.controls.telephone.value,
            cupAreaCode: this.validateForm.controls.cupAreaCode.value,
            areaNoProvince: this.validateForm.controls.areaNoProvince.value,
            areaNoCity: this.validateForm.controls.areaNoCity.value,
            areaNoCounty: this.validateForm.controls.areaNoCounty.value,
        };
        console.log(params);
        this.loading = true;
        this.orgService.modOrg(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改机构成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/org']);
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
            this.validateForm.controls.name.updateValueAndValidity();
        });
    }

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
                                    console.log(this.orgTypeList);
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

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
