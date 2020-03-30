import {Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {SysMenuService} from '../../system/menu/menu.service';
import {HttpResponse} from '@angular/common/http';
import {ParameterService} from './parameter.service';
import {Params} from '../../../models/params';

@Component({
    templateUrl: './parameter.html',
    styles  : [
        `
      .editable-cell {
        position: relative;
      }

      .editable-cell-input-wrapper,
      .editable-cell-text-wrapper {
        padding-right: 24px;
      }

      .editable-cell-text-wrapper {
        padding: 5px 24px 5px 5px;
      }

      .editable-cell-icon,
      .editable-cell-icon-check {
        position: absolute;
        right: 0;
        width: 20px;
        cursor: pointer;
      }

      .editable-cell-icon {
        line-height: 18px;
        display: none;
      }

      .editable-cell-icon-check {
        line-height: 28px;
      }

      .editable-cell:hover .editable-cell-icon {
        display: inline-block;
      }

      .editable-cell-icon:hover,
      .editable-cell-icon-check:hover {
        color: #108ee9;
      }

      .editable-add-btn {
        margin-bottom: 8px;
      }
    `
    ]
})
export class ParameterComponent implements OnInit {
    i = 1;
    editCache = {};
    validateForm: FormGroup;
    appList = [];
    versionNoList = [];
    cfgFlag = '';
    cfgValue = '';
    loading = true;
    params: Params;
    dataSet = [];

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private parameterService: ParameterService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }


    refreshData(reset = false) {
        this.loading = true;
        const params = {
            devNo: this.validateForm.controls.devNo.value || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            versionNo: this.validateForm.controls.versionAppNo.value || '',
            appId: this.validateForm.controls.appName.value || '',
            paramKey: this.validateForm.controls.parameterName.value || '',
        };
        console.log(params);
        // 获取当前页
        this.parameterService.getParam(params)
            .subscribe(data => {
                this.loading = false;
                console.log('00000000');
                console.log(data);
                this.dataSet = [];
                for (let i = 0; i < data.paramList.length; i++) {
                    this.dataSet.push({
                        id         : i.toString(),
                        versionNo  : data.paramList[i].versionNo,
                        paramId    : data.paramList[i].paramId,
                        dev        : data.paramList[i].dev,
                        org        : data.paramList[i].org,
                        appId      : data.paramList[i].appId,
                        appName    : data.paramList[i].appName,
                        remark     : data.paramList[i].remark,
                        key        : data.paramList[i].key,
                        value      : data.paramList[i].paramValue,
                    });
                }
                console.log('11111111');
                console.log(this.dataSet);
                this.dataSet.forEach(item => {
                    if (!this.editCache[ item.id ]) {
                        this.editCache[ item.id ] = {
                            edit: false,
                            value: item.value
                        };
                    }
                });
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            org: [
                {no: '10001', name: '总行'}],
            appName: [null, Validators.maxLength(50)],
            versionAppNo: [null, Validators.maxLength(100)],
            parameterName: [null, Validators.maxLength(30)],
        });
        this.parameterService.getApp({}).subscribe(
            data => {
                this.appList = data.data;
                this.validateForm.controls.appName.setValue(this.appList[0].appName);
                this.parameterService.getVersionByAppId(this.appList[0].appId).subscribe(
                    data1 => {
                        this.versionNoList = data1.data;
                        this.validateForm.controls.versionAppNo.setValue(this.versionNoList[0].versionAppNo);
                        const params = {
                            devNo: this.validateForm.controls.devNo.value || '',
                            orgNo: this.validateForm.controls.org.value.no || '',
                            versionNo: this.validateForm.controls.versionAppNo.value || '',
                            appId: this.validateForm.controls.appName.value || '',
                            paramKey: this.validateForm.controls.parameterName.value || '',
                        };
                        console.log(params);
                        // 获取当前页
                        this.parameterService.getParam(params)
                            .subscribe(data2 => {
                                this.loading = false;
                                console.log(data);
                                this.dataSet = [];
                                for (let i = 0; i < data2.paramList.length; i++) {
                                    this.dataSet.push({
                                        id         : i.toString(),
                                        versionNo  : data2.paramList[i].versionNo,
                                        paramId    : data2.paramList[i].paramId,
                                        dev        : data2.paramList[i].dev,
                                        org        : data2.paramList[i].org,
                                        appId      : data2.paramList[i].appId,
                                        appName    : data2.paramList[i].appName,
                                        remark     : data2.paramList[i].remark,
                                        key        : data2.paramList[i].key,
                                        value      : data2.paramList[i].paramValue,
                                    });
                                }
                                this.dataSet.forEach(item => {
                                    if (!this.editCache[ item.id ]) {
                                        this.editCache[ item.id ] = {
                                            edit: false,
                                            value: item.value
                                        };
                                    }
                                });
                            }, (error) => {
                                console.log(error);
                                if (error instanceof HttpResponse) {
                                    this.message.error(error.body.retMsg);
                                }
                            });
                    }, error => {
                        console.log(error);
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    }
                );
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    startEdit(id: string): void {
        this.editCache[ id ].edit = true;
    }

    saveEdit(datas): void {
        this.editCache[ datas.id ].edit = false;
        if (datas.dev === '') {
            this.cfgFlag = 'org';
            this.cfgValue = datas.org;
        }else {
            this.cfgFlag = 'dev';
            this.cfgValue = datas.dev;
        }
        const params = {
            paramId: datas.paramId,
            appId: datas.appId,
            versionNo: datas.versionNo,
            cfgFlag: this.cfgFlag,
            cfgValue: this.cfgValue,
            paramKey: datas.key,
            paramValue: this.dataSet.find(item => item.id === datas.id).value = this.editCache[ datas.id ].value,

        };
        console.log('22222222222');
        console.log(params);
        this.parameterService.modParam(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('保存参数成功！');
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancelEdit(id: string): void {
        this.editCache[ id ].edit = false;
    }

    sync() {
        const params = {
            orgNo: this.validateForm.controls.org.value.no,
            userNo: this.session.getUserSession().account,
            devNo: this.validateForm.controls.devNo.value || '',

        };
        console.log(params);
        this.parameterService.synParam(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('同步参数成功！');
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 选择APP应用后，查询用户可选的应用版本号
     * @param evt
     */
    selectVersionNo(evt: any) {
        console.log(evt);
        if (evt) {
            this.parameterService.getVersionByAppId(evt).subscribe(
                data => {
                    this.versionNoList = data.data;
                }, error => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
        }
    }
}
