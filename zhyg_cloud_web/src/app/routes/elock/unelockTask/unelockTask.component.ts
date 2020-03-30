import {Component, OnInit} from '@angular/core';
import {UnelockTaskService} from './unelockTask.service';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {Page} from '../../../models/page';
import {SysMenuService} from '../../system/menu/menu.service';
import {UnelockTaskAddComponent} from './component/unelockTask-add.component';

@Component({
    templateUrl: './unelockTask.html',
})
export class UnelockTaskComponent implements OnInit {

    unelockTaskDateForm: FormGroup;
    dataSet = [];
    loading = true;
    page = new Page();


    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private unelockTaskService: UnelockTaskService,
        private message: NzMessageService,
        private menuService: SysMenuService,
        private modal: NzModalService
    ) {
    }

    ngOnInit() {
        this.unelockTaskDateForm = this.fb.group({
            elockId: [null],
            devNo: [null],
            taskStatus: [null]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            elockId: this.unelockTaskDateForm.controls.elockId.value || '',
            devNo: this.unelockTaskDateForm.controls.devNo.value || '',
            taskStatus: this.unelockTaskDateForm.controls.taskStatus.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.loading = true;
        this.unelockTaskService.getUnelockTasks(params)
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

    addUnelockTask() {
        const model = this.modal.open({
            title: '添加开锁任务',
            maskClosable: false,
            footer: false,
            content: UnelockTaskAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }


    /**
     * 重置查询条件
     *
     */
    reset() {
        this.unelockTaskDateForm.reset();
        this.unelockTaskDateForm.controls.elockId.setValue('');
        this.unelockTaskDateForm.controls.devNo.setValue('');
        this.unelockTaskDateForm.controls.taskStatus.setValue('');
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
