import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {DevServiceManagerService} from './devServiceManager.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {DevServiceManagerAddComponent} from './component/devServiceManager-add.component';
import {DevServiceManagerModifyComponent} from './component/devServiceManager-modify.component';
import {SysMenuService} from '../menu/menu.service';


@Component({
    templateUrl: './devServiceManager.html',
})
export class DevServiceManagerComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private devServiceManagerService: DevServiceManagerService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        this.loading = true;
        // 获取当前页
        this.devServiceManagerService.getDevServiceManagers(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                this.dataSet = data.data;
                this.page.totalRow = data.page.totalRow;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addDevServiceManager() {
        const modal = this.modal.open({
            title: '添加设备维护商',
            maskClosable: false,
            width: '60%',
            footer: false,
            content: DevServiceManagerAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyDevServiceManager(devServiceManagers) {
        const modal = this.modal.open({
            title: '修改设备维护商',
            maskClosable: false,
            width: '60%',
            footer: false,
            content: DevServiceManagerModifyComponent,
            componentParams: {
                devServiceManagers: devServiceManagers
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(no) {
        this.devServiceManagerService.delDevServiceManager({
            no: no
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除设备维护商成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 下载文件
     * @param obj
     */
    downFile(obj) {
        const data = {
            no: obj.no,
            userNo: this.session.getUserSession().account,
            token: this.session.token
        };
        this.devServiceManagerService.beforeDown(data).subscribe(data1 => {
            if (data1.retCode == 'fail') {
                this.message.error(data1.retMsg);
            }else {
                this.devServiceManagerService.downFile(data);
            }
        }, (error) => {
            this.loading = false;
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    cancel() {

    }

}
