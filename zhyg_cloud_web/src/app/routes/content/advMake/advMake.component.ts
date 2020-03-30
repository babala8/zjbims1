import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {AdvMakeService} from './advMake.service';
import {AdvAddComponent} from './advAdd.component';
import {AdvModifyComponent} from './advModify.component';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {environment} from '@env/environment';

@Component({
    selector: 'advMake',
    templateUrl: './advMake.html',
})
export class AdvMakeComponent implements OnInit {
    formModel = {};
    dataSet = [];
    loading = false;
    page = new Page();
    url = '';
    adsTypeArr: {no: string, name: string}[];
    previewVisible = false;
    selectedRes;

    constructor(
        private service: AdvMakeService,
        private message: NzMessageService,
        private session: SessionService,
        private modal: NzModalService,
    ) {
    }

    refreshData(reset = false) {
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const param = {
            name: this.formModel['name'] || '',
            adsType: this.formModel['adsType'] || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            timeStamp: new Date().getTime()
        };
        this.service.qryAdvs(param).subscribe(
            _data => {
                console.log(_data.data);
                if (_data.data && _data.data.length > 0) {
                    this.dataSet = _data.data;
                }
                if (_data.page) {
                    this.page.totalRow = _data.page.totalRow;
                }

                this.loading = false;
            }, () => {
                this.loading = false;
                this.message.error('查询广告失败');
            }

        );
    }

    ngOnInit(): void {
        this.adsTypeArr = this.service.getAdTypeList();
        this.refreshData(true);
    }

    advMake() {
        this.modal.open({
            title: '创建广告',
            maskClosable: false,
            footer: false,
            content: AdvAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    advModify(data) {
        this.modal.open({
            title: '修改广告',
            maskClosable: false,
            footer: false,
            content: AdvModifyComponent,
            componentParams: {
                adsId: data.adsId
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
        return false;
    }

    advDel(adsId) {
        this.service.delAdv({
            adsId: adsId,
            userNo: this.session.getUserSession().account
        }).subscribe(
            data => {
                this.message.success('删除成功');
                this.refreshData();
            }, error => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
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
