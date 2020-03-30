import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevControlService} from '../devControl.service';
@Component({
    templateUrl: './hardwareInfo.html',
    styleUrls: ['./model-style.less']
})

export class HardwareInfoComponent implements OnInit, OnDestroy {
    deviceInfo: {
        localFile: '',
        token: ''
        no: '',
        ip: ''
    };

    hardwareInfo = {
        no: '',
        ip: '',
        HardwareCpu: '',
        HardwareMemory: '',
        HardwareHardisk: {
            TotalDiskSize: '',
            DiskList: []
        }
    };
    constructor(
        private session: SessionService,
        private message: NzMessageService,
        private devControlService: DevControlService
    ) {}
    ngOnInit() {
        console.log(this.deviceInfo);
        this.devControlService.getHardtwareInfo({
            fileName: this.deviceInfo.localFile,
            token: this.deviceInfo.token,
            type: 'result',
        }).subscribe(
            data => {
                console.log(data);
                if (data.retCode == 'fail') {
                    this.message.error(data.retMsg);
                    return;
                }else {
                    this.message.success(data.retMsg);
                }
                this.hardwareInfo = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );

    }
    ngOnDestroy() {}
}
