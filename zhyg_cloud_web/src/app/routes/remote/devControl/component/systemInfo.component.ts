import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevControlService} from '../devControl.service';
@Component({
    templateUrl: './systemInfo.html',
    styleUrls: ['./model-style.less']
})

export class SystemInfoComponent implements OnInit, OnDestroy {

    deviceInfo: {
        localFile: '',
        token: '',
        no: '',
        ip: ''
    };

    systemInfo = {
        OperatingSys: '',
        OperatingVersion: '',
        OperatingPatchVersion: ''
    };
    constructor(
        private session: SessionService,
        private message: NzMessageService,
        private devControlService: DevControlService
    ) {}
    ngOnInit() {
        console.log(this.deviceInfo);
        this.devControlService.getSystemInfo({
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
                this.systemInfo = data.data;
                console.log(data);
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    asfdasfd() {

    }

    ngOnDestroy() {}
}
