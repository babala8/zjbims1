import {Component, OnInit} from '@angular/core';
import {ElockInfoService} from './elockInfo.service';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {Page} from '../../../models/page';
import {SysMenuService} from '../../system/menu/menu.service';
import {ElockAddComponent} from './component/elock-add.component';

@Component({
    templateUrl: './elockInfo.html',
})
export class ElockInfoComponent implements OnInit {

    elockdateForm: FormGroup;
    dataSet = [];
    loading = true;
    page = new Page();


    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private elockInfoService: ElockInfoService,
        private message: NzMessageService,
        private menuService: SysMenuService,
        private modal: NzModalService
    ) {
    }

    ngOnInit() {
        this.elockdateForm = this.fb.group({
            elockId: [null],
            devNo: [null],
            elockType: [null]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            elockId: this.elockdateForm.controls.elockId.value || '',
            devNo: this.elockdateForm.controls.devNo.value || '',
            elockType: this.elockdateForm.controls.elockType.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.loading = true;
        this.elockInfoService.getElocks(params)
            .subscribe(data => {
                // console.log(data);
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

    addElock() {
        const model = this.modal.open({
            title: '添加锁具',
            maskClosable: false,
            footer: false,
            content: ElockAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }



    /**
     * 选择上级机构后，查询用户可选的机构类型列表
     * @param evt
     */



    /**
     * 重置查询条件
     *
     */
    reset() {
        this.elockdateForm.reset();
        this.elockdateForm.controls.elockId.setValue('');
        this.elockdateForm.controls.devNo.setValue('');
        this.elockdateForm.controls.elockType.setValue('');
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
