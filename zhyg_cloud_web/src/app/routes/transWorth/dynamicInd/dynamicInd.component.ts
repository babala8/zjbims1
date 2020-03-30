import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {Org} from '../../../models/org';
import {Page} from '../../../models/page';
import {DynamicIndService} from './dynamicInd.service';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {DynamicIndAddComponent} from './component/dynamicInd-add.component';
import {DynamicIndModifyComponent} from './component/dynamicInd-modify.component';

@Component({
    templateUrl: './dynamicInd.html',
})
export class DynamicIndComponent implements OnInit {
    formModel = {};
    validateForm: FormGroup;
    org: Org;
    loading = true;
    dataSet = [];
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private dynamicIndService: DynamicIndService,
        private message: NzMessageService,
        private modal: NzModalService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            name: [null],
            org: [
                {no: '10001', name: '总行'}]
        });
        this.refreshData();
    }

    refreshData() {
        const params = {
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo,
            name: this.validateForm.controls.name.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        this.dynamicIndService.getDynamicInd(params)
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.page.totalRow = data.page['totalRow'];
                } else {
                    this.dataSet = [];
                }
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addIndicator() {
        const modal = this.modal.open({
            title: '添加动态指标',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: DynamicIndAddComponent,
            onOk: () => {
                this.refreshData();
            },
            onCancel: () => {
            }
        });
    }

    modifyDynamicInd(dynamicInds) {
        console.log(dynamicInds);
        const modal = this.modal.open({
            title: '修改动态指标',
            maskClosable: false,
            footer: false,
            width: 800,
            content: DynamicIndModifyComponent,
            componentParams: {
                dynamicInds: dynamicInds
            },
            onOk: () => {
                this.refreshData();
            },
            onCancel: () => {
            },
        });
    }

    confirmDel(no) {
        this.dynamicIndService.delDynamicInd({
            no: no
        })
            .subscribe(data => {
                this.message.success('删除指标成功');
                this.refreshData();
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {

    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({});
        this.refreshData();
    }
}
