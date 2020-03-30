import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {CatalogService} from './catalog.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {CatalogAddComponent} from './component/catalog-add.component';
import {CatalogModifyComponent} from './component/catalog-modify.component';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SysMenuService} from '../menu/menu.service';



@Component({
    templateUrl: './catalog.html',
})
export class CatalogComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private catalogService: CatalogService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            enname: [null]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            // this.page.curPage = 1;
        }
        const params = {
            enname: this.validateForm.controls.enname.value || '',
            // curPage: this.page.curPage,
            // pageSize: this.page.pageSize,
        };
        console.log(params);
        this.loading = true;
        // 获取当前页
        this.catalogService.getCatalogs(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                this.dataSet = data.data;
                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }
                // if (data.page != null) {
                //     this.page.totalRow = data.page.totalRowF;
                // } else {
                //     this.page.totalRow = 0;
                // }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addCatalog() {
        const modal = this.modal.open({
            title: '添加设备类型',
            maskClosable: false,
            footer: false,
            content: CatalogAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyCatalog(catalog) {
        const modal = this.modal.open({
            title: '修改设备类型',
            maskClosable: false,
            footer: false,
            content: CatalogModifyComponent,
            componentParams: {
                catalog: catalog
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(no) {
        this.catalogService.delCatalog({
            no: no
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除设备类型成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.enname.setValue('');
        this.refreshData(true);
    }

    cancel() {

    }

}
