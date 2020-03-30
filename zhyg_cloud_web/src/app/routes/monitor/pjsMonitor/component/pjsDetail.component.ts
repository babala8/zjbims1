import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {PjsMonitorService} from '../pjsMonitor.service';

@Component({
    templateUrl: './pjsDetail.html',
})
export class PjsDetailComponent implements OnInit {

    validateForm: FormGroup;
    devAttrAndStatus;
    devNo;
    flag = false;
    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private session: SessionService,
        private message: NzMessageService,
        private pjsMonitorService: PjsMonitorService,
    ) {
    }

    ngOnInit(): void {
        console.log(this.devNo);
        this.getDetail();
        console.log(this.devAttrAndStatus);
    }


    getDetail() {
        const params = {
            devNo: this.devNo,
        };
        this.pjsMonitorService.getDevAttrAndStatus(params).subscribe(
            data => {
                this.devAttrAndStatus = data.data;
                this.flag = true;
            },
            error => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }
    /**
     * 将20190723152151格式的字符串转为标准时间字符串
     * @param str
     */
    string2DateString(str) {
        if (str == null) {
            return '';
        }
        const reg = /^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/;
        const d = str.replace(reg, '$1-$2-$3 $4:$5:$6');
        return d;
    }
}
