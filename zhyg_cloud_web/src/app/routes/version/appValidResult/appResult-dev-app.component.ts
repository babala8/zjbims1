import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {AppResultService} from './appResult.service';

@Component({
    selector: 'appResultDevApp',
    templateUrl: './appResult-dev-app.html',
})
export class AppResultDevAppComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    updateMode = this.service.getUpdateModes();
    devNo;

    constructor(
        private fb: FormBuilder,
        private service: AppResultService,
        private session: SessionService,
        private nzModal: NzModalSubject,
        private message: NzMessageService
    ) {
    }

    ngOnInit(): void {
        console.log(this.devNo);
        this.service.qryAppResultByDev({
            devNo: this.devNo
        }).subscribe(data => {
            this.dataSet = data.data;
            this.dataSet.forEach( item => {
                this.updateMode.forEach(mode => {
                    if (mode.no == item.updateMode) {
                        item.updateMode = mode.name;
                    }
                });
            });
            this.loading = false;
        }, (error) => {
            this.loading = false;
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}

