import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {AdvResultService} from './advResult.service';
import {environment} from '@env/environment';

@Component({
    selector: 'advResultDevAdv',
    templateUrl: './advResult-dev-adv.html',
})
export class AdvResultDevAdvComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    previewVisible = false;
    devNo;
    selectedRes: {type: '', url: any, text: ''};

    constructor(
        private fb: FormBuilder,
        private service: AdvResultService,
        private session: SessionService,
        private nzModal: NzModalSubject,
        private message: NzMessageService
    ) {
    }

    ngOnInit(): void {
        this.service.qryAdvResultForDev({
            devNo: this.devNo || ''
        }).subscribe(data => {
            this.dataSet = data.data;
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

    /**
     * 预览
     * @param item
     */
    preview(item, flag) {
        if (flag == '1') {
            item.type = item.tarSourceType;
            item.url = `${environment.SERVER_URL}` + '/content/resource/download?sourceId=' + item.tarSourceNo
                + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
            item.text = item.tarText;
        } else {
            item.type = item.curSourceType;
            item.url = `${environment.SERVER_URL}` + '/content/resource/download?sourceId=' + item.curSourceNo
                + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
            item.text = item.curAdsPath;
        }
        this.selectedRes = item;
        this.previewVisible = true;
    }

}

