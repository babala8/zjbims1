import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {AdvValidService} from './advValid.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {AdvValidConfigureComponent} from './advValid-configure.component';
import {AdvIssueComponent} from './advIssue.component';
import {SessionService} from '@core/session.service';
import {environment} from '@env/environment';

@Component({
    selector: 'advertisementMaintain',
    templateUrl: './advValid.html',
})
export class AdvValidComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page();
    flag = true;
    limitOrg: string;
    limitCatalog: string;
    adsId: string;
    adsTypeArr: {no: string, name: string}[];
    previewVisible = false;
    selectedRes;

    constructor(
        private fb: FormBuilder,
        private service: AdvValidService,
        private message: NzMessageService,
        private modal: NzModalService,
        private session: SessionService,
    ) {
    }

    refreshData(reset = false) {
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        this.service.qryAdv({
            name: this.validateForm.controls.name.value || '',
            adsType: this.validateForm.controls.adsType.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            timeStamp: new Date().getTime()
        }).subscribe(
            _data => {
                this.loading = false;
                if (_data.data) {
                    this.dataSet = _data.data;
                    this.dataSet.map(x => {
                        if (x.remoteRange == '1') {
                            x.validStatus = '部分投放';
                        } else if (x.remoteRange == '2') {
                            x.validStatus = '正式投放';
                        } else if (x.remoteRange == '3') {
                            x.validStatus = '已取消投放';
                        } else {
                            x.validStatus = '未投放';
                        }
                    });
                    this.page.totalRow = _data.page.totalRow;
                }
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            name: [null],
            adsType: [null]
        });
        this.adsTypeArr = this.service.getAdTypeList();
        this.refreshData(true);
    }

    /**
     * 展示详情
     * @param item
     */
    showDetail(item) {

    }

    /**
     * 投放
     * @param item
     * @param type 第一次投放还是再次投放
     */
    valid(item) {
        this.modal.open({
            title: '设置投放参数',
            maskClosable: false,
            footer: false,
            content: AdvValidConfigureComponent,
            componentParams: {
                adsId: item.adsId,
                limitCatalog: item.limitCatalog,
                limitOrg: item.limitOrg
            },
            width: '340px',
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
        return false;
    }

    /**
     * 取消投放
     * @param item
     */
    invalid(item) {
        this.loading = true;
        this.service.valid({
            adsId: item.adsId,
            remoteRange: '3',
            method: '1',
            userNo: this.session.getUserSession().account,
        }).subscribe(
            () => {
                this.loading = false;
                this.message.success('取消投放成功');
                this.refreshData(false);
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    issuePage(item) {
        this.modal.open({
            title: '选择设备投放',
            maskClosable: false,
            footer: false,
            content: AdvIssueComponent,
            componentParams: {
                adsId: item.adsId,
                limitCatalog: item.limitCatalog,
                limitOrg: item.limitOrg,
                remoteRange: item.remoteRange
            },
            width: '1000px',
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            }
        });
    }
    cancel() {

    }

    // 预览广告
    previewRes(resourceId) {
        this.service.qryResourceByNo({resourceId: resourceId}).subscribe(
            _data => {
                if (_data.data) {
                    this.selectedRes = _data.data;
                    if (this.selectedRes.type === '2') {
                        const d = parseInt(this.selectedRes.duration, 0);
                        this.selectedRes.duration = d > 60 ? Math.floor(d / 1000 / 60) + '分' + d % 60 + '秒' : d + '秒';
                    } else if (this.selectedRes.type == '1') {
                        this.selectedRes.url = `${environment.SERVER_URL}` + '/content/resource/download?sourceId=' + this.selectedRes.no
                            + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
                    }
                    this.previewVisible = true;
                }
            }, (error) => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }
}

