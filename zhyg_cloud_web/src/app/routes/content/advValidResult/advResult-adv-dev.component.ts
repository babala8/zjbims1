import {Component, OnInit} from '@angular/core';
import {Page} from '../../../models/page';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {DevService} from '../../system/dev/dev.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {AdvResultService} from './advResult.service';
import {AdvResultDevAdvComponent} from './advResult-dev-adv.component';
import {DevDetailComponent} from '../../system/dev/component/dev-detail.component';
import {SessionService} from '@core/session.service';

@Component({
    selector: 'advResultAdvDev',
    templateUrl: './advResult-adv-dev.html',
})
export class AdvResultAdvDevComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page();
    devNos = [];
    adsItem;
    testDevs = [];

    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private service: AdvResultService,
        private devService: DevService,
        private modal: NzModalService,
        private message: NzMessageService,
        private session: SessionService
    ) {
    }

    refreshData(reset = false) {
        this.devNos = [];
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            adsId: this.adsItem.adsId || '',
            devNo: this.validateForm.controls.devNo.value || '',
            orgNo: this.validateForm.controls.orgNo.value.no || '',
            status: this.validateForm.controls.status.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.service.qryDevByAdv(params)
            .subscribe(data => {
                this.dataSet = data.data;
                if (this.dataSet) {
                    this.page.totalRow = data.page.totalRow;
                    data.data.forEach(data1 => {
                        if (data1.cancelStatus) {
                            data1.status = '已撤销';
                            data1.dateTime = data1.cancelTime;
                            data1.disabled = true;
                        } else if (data1.effectStatus == '1') {
                            data1.status = '已生效';
                            data1.dateTime = data1.effectTime;
                        } else if (data1.notifyStatus == '1') {
                            data1.status = '已通知';
                            data1.dateTime = data1.notifyTime;
                        } else if (this.adsItem.remoteRange == '2') {
                            data1.status = '通知中';
                        } else if (this.testDevs.includes(data1.no)) {
                            data1.status = '通知中';
                        } else {
                            data1.status = '未投放';
                            data1.disabled = true;
                        }
                    });
                } else {
                    this.dataSet = [];
                    this.page.totalRow = 0 ;
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    ngOnInit(): void {
        console.log(this.session.getUserSession());
        this.validateForm = this.fb.group({
            devNo: [null],
            orgNo: [{no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
            status: [''],
        });
        this.testDevs = [];
        this.service.getTestDevOfAds({
            adsId: this.adsItem.adsId
        }).subscribe(
            _data => {
                if (_data && _data.data) {
                    _data.data.forEach(item => {this.testDevs.push(item); });
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        console.log(this.testDevs);
        this.refreshData(true);
    }

    /**
     * 展示详情
     * @param item
     */
    showDetail(item) {
        this.modal.open({
            title: '广告详情',
            footer: false,
            zIndex: 101,
            width: '50%',
            content: AdvResultDevAdvComponent,
            componentParams: {
                devNo: item.no,
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            }
        });
    }

    search() {
        this.refreshData(true);
    }

    /**
     * 选择设备
     * @param event
     * @param devNo
     */
    selectDevNo(event, devNo) {
        if (event) {
            if (!this.devNos.includes(devNo)) {
                this.devNos.push(devNo);
            }
        } else {
            this.devNos.splice(this.devNos.indexOf(devNo), 1);
        }
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.status.setValue('');
        this.validateForm.controls.orgNo.setValue({no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName});
        this.refreshData(true);
    }

    cancel() {
    }

    /**
     * 撤销广告
     */
    cancelAds() {
        const devNos = this.devNos != null ? (<string[]>this.devNos).join('|') : '';
        if (devNos == '' || devNos.length == 0) {
            this.message.warning('请先选择设备');
            return;
        }
        const params = {
            adsId: this.adsItem.adsId,
            userNo: this.session.getUserSession().account,
            devNos: this.devNos != null ? (<string[]>this.devNos).join('|') : '',
        };
        this.service.cancelAds(params).subscribe(
            () => {
                this.loading = false;
                this.message.success('已撤销');
                this.refreshData(false);
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

}

