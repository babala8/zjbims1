import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {Org} from '../../../models/org';
import {AdvMakeService} from './advMake.service';
import {DevService} from '../../system/dev/dev.service';
import {AppstoreService} from '../../version/appstore/appstore.service';
import {OrgService} from '../../system/org/org.service';
import {SessionService} from '@core/session.service';
import {ResourceManageService} from '../resourceManage/resourceManage.service';

@Component({
    selector: 'advAdd',
    templateUrl: './advAdd.html',
})
export class AdvAddComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    resourceList = [];
    org: Org;
    tmpOrgs: {
        no: any,
        name: any
    }[] = [];
    orgGrade;
    devCatalogList = [];
    spaceList = [];
    playTimeLock = false;
    showTime = true;

    constructor(private fb: FormBuilder,
                private service: AdvMakeService,
                private nzModal: NzModalSubject,
                private message: NzMessageService,
                private devService: DevService,
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
        const value = this.validateForm.controls.devCatalog.value;
        if (value) {
            for (let j = 0; j < value.length; j++) {
                tmpDevCatalog += '|' + value[j];
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
            name: this.validateForm.controls.name.value,
            resource: this.validateForm.controls.resource.value,
            limitOrg: tmpOrgNo,
            limitCatalog: tmpDevCatalog,
            description: '',
            addUser: this.session.getUserSession().account,
            accurate: '',
            startTime: this.service.formatDate(this.validateForm.controls.startTime.value, 'yyyy-MM-dd HH:mm:ss'),
            endTime: this.service.formatDate(this.validateForm.controls.endTime.value, 'yyyy-MM-dd HH:mm:ss'),
            space: this.validateForm.controls.space.value,
            timeFlag: this.validateForm.controls.timeFlag.value,
            playTime: this.validateForm.controls.playTime.value,
        };
        console.log(params);
        this.loading = true;
        this.service.addAdv(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加广告成功！`);
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
        this.validateForm = this.fb.group({
            name: [null, [Validators.required, Validators.maxLength(25)]],
            resource: [null, [Validators.required]],
            orgNo: [null, [Validators.required]],
            devCatalog: [null, [Validators.required]],
            startTime: [new Date(), [Validators.required]],
            endTime: [new Date('9999/12/31 23:59:59'), [Validators.required]],
            space: [null, [Validators.required]],
            playTime: ['10', [Validators.required, Validators.maxLength(2)]],
            timeFlag: this.showTime
        });
        this.tmpOrgs = [];
        this.service.qryDevCatalog()
            .subscribe(_data => {
                    if (_data && _data.data) {
                        this.devCatalogList = _data.data;
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
    }

    getResourceBySpace(spaceNo) {
        this.resourceList = [];
        this.resourceService.qryResources({
            resourceType: this.getResourceTypeBySpaceNo(spaceNo)
        }).subscribe(
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
    }

    getResourceTypeBySpaceNo(spaceNo) {
        for (const space of this.spaceList) {
            if (space.id == spaceNo) {
                if (space.type == '3') {
                    return '3';
                } else {
                    return '1';
                }
            }
        }
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
    }

    /**
     * 广告类型为视频的话就自动设置播放时间
     * @param event
     */
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

    showTimeSelecter() {
        this.showTime = this.validateForm.controls.timeFlag.value;
        if (this.showTime) {
            this.validateForm.controls.startTime.setValue(new Date());
            this.validateForm.controls.endTime.setValue(new Date('9999/12/31 23:59:59'));
        } else {
            this.validateForm.controls.startTime.setValue(new Date());
            this.validateForm.controls.endTime.setValue(new Date());
        }
    }
}
