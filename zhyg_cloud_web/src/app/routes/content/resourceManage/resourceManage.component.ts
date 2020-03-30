import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {ResourceManageService} from './resourceManage.service';
import {ResourceAddComponent} from './component/resource-add.component';
import {ResourceModifyComponent} from './component/resource-modify.component';
import {environment} from '@env/environment';
import {SessionService} from '@core/session.service';

@Component({
    selector: 'resourceManage',
    templateUrl: './resourceManage.html',
})
export class ResourceManageComponent implements OnInit {
    formModel = {};
    dataSet = [];
    resourceTypes;
    loading = false;
    page = new Page();
    selectedRes;
    previewVisible = false;

    constructor(
        private service: ResourceManageService,
        private message: NzMessageService,
        private modal: NzModalService,
        private session: SessionService
    ) {
    }

    refreshData(reset = false) {
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const param = {
            resourceName: this.formModel['resourceName'] || '',
            resourceType: this.formModel['resourceType'] || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            timeStamp: new Date().getTime()
        };
        this.service.qryResources(param).subscribe(
            _data => {
                console.log(_data);
                if (_data.data) {
                    this.dataSet = _data.data;
                    this.dataSet.forEach(x => {
                        x.typeName = x.type === '1' ? '图片' : x.type === '2' ? '视频' : x.type === '3' ? '文字' : '未知类型';
                        if (x.type === '2') {
                            const d = parseInt(x.duration, 0);
                            x.duration = d > 60 ? Math.floor(d / 1000 / 60) + '分' + d % 60 + '秒' : d + '秒';
                        } else if (x.type == '1') {
                            x.url = `${environment.SERVER_URL}` + '/content/resource/download?sourceId=' + x.no
                                + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
                        }
                    });
                    this.page.totalRow = _data.page.totalRow;
                }
                this.loading = false;
            }, _error => {
                this.loading = false;
                this.message.error('刷新数据失败');
                console.log(_error);
            }
        );
    }

    ngOnInit(): void {
        this.resourceTypes = this.service.getResourceTypes();
        this.refreshData(true);
    }

    addResource() {
        this.modal.open({
            title: '创建资源',
            maskClosable: false,
            footer: false,
            content: ResourceAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modify(resource) {
        this.modal.open({
            title: '修改资源',
            maskClosable: false,
            footer: false,
            componentParams: {
                resource: resource
            },
            content: ResourceModifyComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    delete(resource) {
        this.service.delResource({no: resource.no}).subscribe(
            data => {
                this.message.success('删除成功');
                this.refreshData();
            }, error => {
                this.message.error(error.body.retMsg);
            }
        );
    }

    cancel() {

    }

    previewRes(resource) {
        this.selectedRes = resource;
        this.previewVisible = true;
    }
}
