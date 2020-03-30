import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {Org} from '../../../models/org';
import {OrgType} from '../../../models/orgType';
import {AdvMakeService} from './advMake.service';
import {AppstoreService} from '../../version/appstore/appstore.service';
import {OrgService} from '../../system/org/org.service';
import {SessionService} from '@core/session.service';
import {ResourceManageService} from '../resourceManage/resourceManage.service';
import {Ads} from '../../../models/ads';

@Component({
    selector: 'advModify',
    templateUrl: './advModify.html',
})
export class AdvModifyComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    resourceList = [];
    org: Org;
    tmpOrgs: {
        no: any,
        name: any
    }[] = [];
    orgGrade;
    orgTypeList: OrgType[] = [];
    devCatalogList = [];
    spaceList = [];
    data: Ads;
    adsId: string;
    playTimeLock = false;

    constructor(private fb: FormBuilder,
                private service: AdvMakeService,
                private nzModal: NzModalSubject,
                private message: NzMessageService,
                private appService: AppstoreService,
                private orgService: OrgService,
                private session: SessionService,
                private resourceService: ResourceManageService) {
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

        let tmpDevCatalog = '';
        const limitCatalog = this.validateForm.controls.devCatalog.value;
        if (limitCatalog.length > 0) {
            for (let j = 0; j < limitCatalog.length; j++) {
                tmpDevCatalog += '|' + limitCatalog[j];
            }
            tmpDevCatalog = tmpDevCatalog.substring(1);
        }
        let tmpOrgNo = '';
        if (this.tmpOrgs.length > 0) {
            for (let j = 0; j < this.tmpOrgs.length; j++) {
                tmpOrgNo += '|' + this.tmpOrgs[j].no;
            }
            tmpOrgNo = tmpOrgNo.substring(1);
        }

        const params = {
            adsId: this.data.adsId,
            adsName: this.validateForm.controls.name.value,
            limitOrg: tmpOrgNo,
            limitCatalog: tmpDevCatalog,
            userNo: this.session.getUserSession().account
        };
        this.loading = true;
        this.service.modAdv(params).subscribe(
            () => {
                this.loading = false;
                this.message.success(`修改广告成功！`);
                this.nzModal.destroy('onOk');
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
        this.resourceService.qryResources({}).subscribe(
            _data => {
                if (_data && _data.data) {
                    this.resourceList = _data.data;
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.service.qryAdvSpace().subscribe(
            _data => {
                if (_data && _data.data) {
                    this.spaceList = _data.data;
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.service.qryDevCatalog().subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );

        this.service.qryAdvs({adsId: this.adsId}).subscribe(
            data => {
                this.data = data.data[0];

                let temp1: any[];
                let temp2: any[];
                if (this.data.limitOrg) {
                    temp1 = (<string>this.data.limitOrg).split(',');
                    temp2 = (<string>this.data.limitOrgName).split(',');
                    if (temp1.length > 0 && temp2.length > 0 && temp1.length === temp2.length) {
                        for (const i in temp1) {
                            this.tmpOrgs.push({no: temp1[i], name: temp2[i]});
                        }
                    }
                }
                let limitCatalog;
                if (this.data.limitCatalog) {
                    limitCatalog = (<string>this.data.limitCatalog).split(',');
                }
                this.validateForm = this.fb.group({
                    name: [this.data.advName],
                    resource: [this.data.resource],
                    orgNo: [null],
                    devCatalog: [limitCatalog, Validators.required],
                    startTime: [this.data.playStartTime],
                    endTime: [this.data.playEndTime],
                    space: [this.data.space],
                    playTime: [this.data.playTime]
                });
                const tmp = this.resourceList.filter(x => x.no == this.data.resource);
                if (tmp && tmp[0].type == '2') {
                    this.playTimeLock = true;
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    /**
     * 选择上级机构后，查询用户可选的机构类型列表
     * @param evt
     */
    selectOrg(evt: any) {
        const orgNo = evt.no;
        if (orgNo) {
            for (let i = 0; i < this.tmpOrgs.length; i++) {
                if (this.tmpOrgs[i].no == orgNo) {
                    return;
                }
            }
            this.tmpOrgs.push({no: evt.no, name: evt.name});
        }
    }

    /**
     * 机构多选框移除机构
     * @param i
     */
    onClose(i) {
        this.tmpOrgs.splice(i, 1);
        console.log(this.tmpOrgs);
    }

    setPlayTime(event) {
        const tmp = this.resourceList.filter(x => x.no == event);
        console.log(tmp[0]);
        if (tmp[0].type == '2') {
            this.validateForm.controls.playTime.setValue(tmp[0].duration);
            this.playTimeLock = true;
        } else {
            this.playTimeLock = false;
        }
    }
}
