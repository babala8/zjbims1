import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {FactoryService} from './factory.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {FactoryAddComponent} from './component/factory-add.component';
import {FactoryModifyComponent} from './component/factory-modify.component';
import {SysMenuService} from '../menu/menu.service';



@Component({
    templateUrl: './factory.html',
})
export class FactoryComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private factoryService: FactoryService,
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
        const params = {
            name: this.validateForm.controls.name.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        this.loading = true;
        // 获取当前页
        this.factoryService.getFactorys(params)
            .subscribe(data => {
                this.loading = false;
                this.dataSet = data.data;
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.page.totalRow = 0 ;
                }

                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }else {
                    data.data.forEach(data1 => {
                        if (data1.status === '1') {
                            data1.status = '启用';
                        }else {
                            data1.status = '停用';
                        }
                    });
                    console.log(data);
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addFactory() {
        const modal = this.modal.open({
            title: '添加厂商维护人员',
            maskClosable: false,
            width:'60%',
            footer: false,
            content: FactoryAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyFactory(factorys) {
        const modal = this.modal.open({
            title: '修改厂商维护人员',
            maskClosable: false,
            footer: false,
            width:'60%',
            content: FactoryModifyComponent,
            componentParams: {
                factorys: factorys
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(no) {
        this.factoryService.delFactory({
            no: no
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除人员成功');
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
