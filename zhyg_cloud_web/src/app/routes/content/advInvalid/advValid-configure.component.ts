import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';
import {AdvValidService} from './advValid.service';
import {HttpResponse} from '@angular/common/http';

@Component({
    selector: 'advValidConfigure',
    templateUrl: './advValid-configure.html',
})
export class AdvValidConfigureComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    adsId;
    methodList = [];
    showTime = false;
    limitCatalog;
    limitOrg;

    constructor(private fb: FormBuilder,
                private nzModal: NzModalSubject,
                private message: NzMessageService,
                private session: SessionService,
                private service: AdvValidService) {
    }

    _submitForm() {
        const validTime = this.validateForm.controls.validTime.value;
        const param = {
            adsId: this.adsId,
            remoteRange: '2',
            method: this.validateForm.controls.method.value,
            validTime: this.service.formatDate(validTime, 'yyyy-MM-dd HH:mm:ss'),
            userNo: this.session.getUserSession().account
        };
        this.service.valid(param).subscribe(
            () => {
                this.message.success('投放成功');
                this.nzModal.destroy('onOk');
            }, (error) => {
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
            method: ['1'],
            validTime: [new Date()]
        });
        this.methodList = this.service.wayInfo;
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    /**
     * 选择定时投放时显示时间选择
     * @param event
     */
    methodChange(event) {
        this.showTime = event == '2';
    }

}
