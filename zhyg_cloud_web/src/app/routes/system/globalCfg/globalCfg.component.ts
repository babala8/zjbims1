import {Component, OnInit} from '@angular/core';
import {FormGroup} from '@angular/forms';
import {Page} from '../../../models/page';
import {GlobalCfgService} from './globalCfg.service';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {FactoryModifyComponent} from '../factory/component/factory-modify.component';
import {GlobalCfgModifyComponent} from './component/globalCfg-modify.component';

@Component({
    templateUrl: './globalCfg.html',
})

export class GlobalCfgComponent implements OnInit {
    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    loading = true;
    page = new Page();

    constructor(
        private modCatalogService: GlobalCfgService,
        private service: GlobalCfgService,
        private modal: NzModalService,
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
        this.loading = true;
        this.service.getGlobalCfg(params)
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.dataSet.forEach( item => {
                        if (item.editable == '1') {
                            item.editable = '是';
                        } else {
                            item.editable = '否';
                        }
                    });
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.dataSet = [];
                    this.page.totalRow = 0;
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 修改参数配置
     */
    modGlobalCfg(globalCfg) {
        if ( globalCfg.editable == '否' ) {
            this.message.info('该参数不可编辑');
            return;
        }
        const modal = this.modal.open({
            title: '修改参数配置',
            maskClosable: false,
            footer: false,
            content: GlobalCfgModifyComponent,
            componentParams: {
                globalCfg: globalCfg
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }

}
