import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevControlService} from '../devControl.service';
@Component({
    templateUrl: './processInfo.html',
})

export class ProcessInfoComponent implements OnInit, OnDestroy {
    deviceInfo: {
        localFile: '',
        token: ''
    };
    processInfo = [];
    constructor(
        private session: SessionService,
        private message: NzMessageService,
        private devControlService: DevControlService
    ) {}
    ngOnInit() {
        const params = {
            fileName: this.deviceInfo.localFile,
            token: this.deviceInfo.token,
            type: 'result',
        };
        this.devControlService.getProcessInfo(params).subscribe(
            data => {
                console.log(data);
               if (data.retCode == 'fail') {
                   this.message.error(data.retMsg);
                   return;
               }else {
                   this.message.success(data.retMsg);
               }
                this.processInfo = data.data;
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
