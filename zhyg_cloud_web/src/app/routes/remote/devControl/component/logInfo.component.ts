import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevControlService} from '../devControl.service';
@Component({
    templateUrl: './logInfo.html',
    styleUrls: ['./model-style.less']
})

export class LogInfoComponent implements OnInit, OnDestroy {

    logInfo = {
        localFile: '',
        downloadPath: ''
    };

    logContent = '';
    constructor(
        private session: SessionService,
        private message: NzMessageService,
        private nzModal: NzModalSubject,
        private devControlService: DevControlService
    ) {}
    ngOnInit() {
        this.devControlService.getLogInfo({
            fileName: this.logInfo.localFile,
            type: 'result',
            userNo: this.session.getUserSession().account,
            token: this.session.token
        }).subscribe(
            data => {
                if (data.retCode == 'fail') {
                    this.message.error(data.retMsg);
                    return;
                }else {
                    this.message.success(data.retMsg);
                }
                this.logContent = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 将日志.J后缀改为txt
        this.logInfo.downloadPath = this.logInfo.downloadPath.substring(0, this.logInfo.downloadPath.lastIndexOf('.') + 1) + 'txt';
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    ngOnDestroy() {}
}
