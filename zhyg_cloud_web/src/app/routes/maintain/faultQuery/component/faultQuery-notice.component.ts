import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {FaultQueryService} from '../faultQuery.service';
import {HttpResponse} from '@angular/common/http';

@Component({
    selector: 'faultQuery-notice',
    templateUrl: './faultQuery-notice.html',
})
export class FaultQueryNoticeComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    cases;
    caseNoticeList;

    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private faultQueryService: FaultQueryService,
        private message: NzMessageService,
    ) {
    }

    ngOnInit(): void {

        // 获取设备详细信息
        this.loading = true;
        console.log('tongzhi122345');
        const params = {
            caseNo: this.cases.caseNo
        };
        console.log(params);
        this.faultQueryService.getCaseNotice(params).subscribe(
            _data => {
                this.loading = false;
                console.log('111111111');
                console.log(_data.data);
                if (_data.data === null || _data.data.length === 0) {
                    this.message.success('没有相关通知信息');
                   return;
                }
                this.caseNoticeList = _data.data;
                this.caseNoticeList.forEach((caseNotice, index) => {
                    if (caseNotice.notifyType === 1) {
                        caseNotice.notifyType = '创建';
                    }else if (caseNotice.notifyType === 2) {
                        caseNotice.notifyType = '升级';
                    }else if (caseNotice.datanotifyType === 3) {
                        caseNotice.datanotifyType = '关闭';
                    }else if (_data.data.notifyType === 4) {
                        caseNotice.data.notifyType = '挂起';
                    }

                    if (caseNotice.notifyWay === 1) {
                        caseNotice.notifyWay = '短信';
                    }else if (_data.data.notifyWay === 2) {
                        caseNotice.notifyWay = '邮件';
                    }
                });
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
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
}
