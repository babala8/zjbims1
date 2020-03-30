import {Component,Input, OnDestroy, OnInit} from '@angular/core';
import {NzMessageService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevControlService} from '../devControl.service';
@Component({
    templateUrl: './softwareInfo.html',
})

export class SoftwareInfoComponent implements OnInit, OnDestroy {
    deviceInfo: {
        localFile: '',
        token: '',
    };
    softwareInfo = {

    };
    constructor(
        private session: SessionService,
        private message: NzMessageService,
        private devControlService: DevControlService
    ) {}
    ngOnInit() {
        console.log(this.deviceInfo);
        this.devControlService.getSoftwareInfo({
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
                this.softwareInfo = data.data;
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
