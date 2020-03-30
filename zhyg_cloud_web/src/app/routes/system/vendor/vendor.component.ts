import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {VendorService} from './vendor.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {VendorAddComponent} from './component/vendor-add.component';
import {VendorModifyComponent} from './component/vendor-modify.component';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SysMenuService} from '../menu/menu.service';



@Component({
    templateUrl: './vendor.html',
})
export class VendorComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = false;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private vendorService: VendorService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            name: [null]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            name: this.validateForm.controls.name.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        // 获取当前页
        this.vendorService.getVendors(params)
            .subscribe(data => {
                this.dataSet = data.data;
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                } else {
                    this.page.totalRow = 0;
                }
                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addVendor() {
        const modal = this.modal.open({
            title: '添加设备品牌',
            maskClosable: false,
            footer: false,
            content: VendorAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyVendor(vendors) {
        const modal = this.modal.open({
            title: '修改设备品牌',
            maskClosable: false,
            footer: false,
            content: VendorModifyComponent,
            componentParams: {
                vendors: vendors
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(no) {
        this.vendorService.delVendor({
            no: no
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除设备品牌成功');
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
        this.validateForm.controls.name.setValue('');
        this.refreshData(true);
    }

    cancel() {

    }
    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        return this.menuService.checkBtn(menuName, btnName);
    }
}
