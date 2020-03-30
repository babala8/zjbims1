import {Component, OnInit} from '@angular/core';
import {Page} from '../../../models/page';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {AdvValidService} from './advValid.service';
import {DevService} from '../../system/dev/dev.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {DevDetailComponent} from '../../system/dev/component/dev-detail.component';

@Component({
    selector: 'advertisementIssue',
    templateUrl: './advIssue.html',
})
export class AdvIssueComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page();
    devNos = [];
    adsId;
    limitOrg = [];
    limitCatalog = [];
    remoteRange = '';

    constructor(
        private fb: FormBuilder,
        private service: AdvValidService,
        private devService: DevService,
        private nzModal: NzModalSubject,
        private session: SessionService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    refreshData(reset = false) {
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        this.service.qryDev({
            devNo: this.validateForm.controls.devNo.value || '',
            adsId: this.adsId || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            limitOrg: this.limitOrg,
            limitCatalog: this.limitCatalog,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        }).subscribe(data => {
                this.dataSet = data.data;
                if (this.dataSet) {
                    this.page.totalRow = data.page.totalRow;
                    data.data.forEach(data1 => {
                        if (data1.awayFlag === '1') {
                            data1.awayFlag = '在行';
                        } else {
                            data1.awayFlag = '离行';
                        }
                        if (data1.cancelstatus) {
                            data1.status = '已撤销';
                        } else if (data1.effectstatus == '1') {
                            data1.status = '已生效';
                            data1.disabled = true;
                        } else if (this.remoteRange == '2') {
                            data1.status = '投放中';
                            data1.disabled = true;
                        } else if (data1.issuestatus) {
                            data1.status = '投放中';
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
        this.validateForm = this.fb.group({
            devNo: [null],
            org: [{no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}]
        });
        this.refreshData(true);
    }

    /**
     * 展示详情
     * @param item
     */
    showDetail(item) {
        this.modal.open({
            title: '设备详情',
            content: DevDetailComponent,
            width: '60%',
            componentParams: {
                devs: item
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false
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
     * 下发广告到设备
     */
    issue() {
        const devNos = this.devNos != null ? (<string[]>this.devNos).join('|') : '';
        if (devNos == '' || devNos.length == 0) {
            this.message.warning('请先选择设备');
            return;
        }
        const params = {
            adsId: this.adsId,
            devNo: devNos,
            remoteRange: '1',
            method: '1',
            userNo: this.session.getUserSession().account
        };
        this.service.valid(params).subscribe(
            () => {
                this.loading = false;
                this.message.success('已添加到下发队列');
                this.refreshData(false);
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.org.setValue({no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName});
        this.refreshData(true);
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}

