import {Component, OnInit} from '@angular/core';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {Page} from '../../../../models/page';
import {FaultQueryService} from '../../../maintain/faultQuery/faultQuery.service';
import {FaultQueryDetailComponent} from '../../../maintain/faultQuery/component/faultQuery-detail.component';
import {FaultQueryFollowComponent} from '../../../maintain/faultQuery/component/faultQuery-follow.component';
import {FaultQueryNoticeComponent} from '../../../maintain/faultQuery/component/faultQuery-notice.component';

@Component({
    templateUrl: './caseQuery.html',
})
export class CaseQueryComponent implements OnInit {

    devNo;
    loading = true;
    dataSet = [];
    devVendorList = [];
    devTypeList = [];
    page = new Page();

    constructor(
        private message: NzMessageService,
        private modal: NzModalService,
        private faultQueryService: FaultQueryService,
        private nzModal: NzModalSubject
    ) {
    }

    ngOnInit() {
        this.refreshData();
    }

    refreshData(reset = false) {
        const params = {
            devNo: this.devNo,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        this.faultQueryService.getCase(params)
            .subscribe(_data => {
                if (_data.data) {
                    _data.data.forEach(data1 => {
                        if (data1.currentstatus == 1) {
                            data1.currentstatus = '已创建';
                        }else if (data1.currentstatus == 2) {
                            data1.currentstatus = '已通知';
                        }else if (data1.currentstatus == 3) {
                            data1.currentstatus = '通知升级';
                        }else if (data1.currentstatus == 4) {
                            data1.currentstatus = '已确认';
                        }else if (data1.currentstatus == 5) {
                            data1.currentstatus = '响应升级';
                        }else if (data1.currentstatus == 6) {
                            data1.currentstatus = '已响应';
                        }else if (data1.currentstatus == 7) {
                            data1.currentstatus = '故障升级';
                        }else if (data1.currentstatus == 8) {
                            data1.currentstatus = '已挂起';
                        }else if (data1.currentstatus == 9) {
                            data1.currentstatus = '已关闭';
                        }
                    });
                    this.dataSet = _data.data;
                    this.page.totalRow = _data.page.totalRow;
                }else {
                    this.dataSet = [];
                    this.page.totalRow = 0;
                }
                this.loading = false;
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    showDetail(cases) {
        const modal = this.modal.open({
            title: 'CASE详情',
            content: FaultQueryDetailComponent,
            width: '80%',
            componentParams: {
                cases: cases
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 2
        });
    }

    showFollow(cases) {
        const modal = this.modal.open({
            title: 'CASE跟踪',
            content: FaultQueryFollowComponent,
            width: '80%',
            componentParams: {
                cases: cases
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 2
        });
    }

    showNotice(cases) {
        const modal = this.modal.open({
            title: 'CASE通知',
            content: FaultQueryNoticeComponent,
            width: '80%',
            componentParams: {
                cases: cases
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 2
        });
    }

    backModel() {
        this.nzModal.destroy('onCancel');
    }
}
