import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {TypeService} from './type.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {TypeAddComponent} from './component/type-add.component';
import {TypeModifyComponent} from './component/type-modify.component';
import {SysMenuService} from '../menu/menu.service';



@Component({
    templateUrl: './type.html',
})
export class TypeComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    devCatalogList = [];
    devVendorList = [];
    i = 0;
    loading = true;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private typeService: TypeService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devCatalog: [null],
            devVendor: [null]
        });

        this.typeService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );

        this.typeService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );


        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);

        this.loading = true;
        // 获取当前页
        this.typeService.getTypes(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.page.totalRow = data.page.totalRow;
                    this.dataSet.forEach( x => {
                        if (x.cashType == '1') {
                            x.cashType = '现金';
                        } else if (x.cashType == '2') {
                            x.cashType = '非现金';
                        }
                    });
                } else {
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

    addType() {
        const modal = this.modal.open({
            title: '添加型号',
            maskClosable: false,
            footer: false,
            content: TypeAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyType(type) {
        const modal = this.modal.open({
            title: '修改型号',
            maskClosable: false,
            footer: false,
            content: TypeModifyComponent,
            componentParams: {
                type: type
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(no) {
        this.typeService.delType({
            no: no
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除型号成功');
            this.refreshData(true);
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
        this.validateForm.controls.devCatalog.setValue('');
        this.validateForm.controls.devVendor.setValue('');
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
