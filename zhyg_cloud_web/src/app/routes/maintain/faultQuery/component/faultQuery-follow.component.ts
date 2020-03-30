import {Component, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FaultQueryService} from '../faultQuery.service';
import {stat} from 'fs';

@Component({
    selector: 'faultQuery-follow',
    templateUrl: './faultQuery-follow.html',
})
export class FaultQueryFollowComponent implements OnInit {

    loading = false;
    dataSet = [];
    cases;

    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private faultQueryService: FaultQueryService,
        private message: NzMessageService ) {
    }

    ngOnInit(): void {
        // 获取CASE跟踪详细信息
        this.loading = true;
        const params = {
            caseNo: this.cases.caseNo
        }
        console.log(params);
        this.faultQueryService.getCaseFollow(params)
            .subscribe(_data => {
                this.dataSet = _data.data;
                console.log('777777');
                console.log(_data.data);
                this.loading = false;
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    showStatusName(status) {
       switch (status) {
           case '1':
               return '已创建';
           case '2':
                return '已通知';
           case '3':
                return '通知升级';
           case '4':
               return '通知升级';
           case '5':
               return '响应升级';
           case '6':
               return '已响应';
           case '7':
               return '故障升级';
           case '8':
               return '已挂起';
           case '9':
               return '已关闭';
           default:
               return status;
       }
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}
