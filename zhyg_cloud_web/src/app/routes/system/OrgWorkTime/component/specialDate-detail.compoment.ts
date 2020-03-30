import {Component, OnInit} from '@angular/core';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {Page} from '../../../../models/page';
import {OrgWorkTimeService} from '../OrgWorkTime.service';

@Component({
    templateUrl: './specialDate-detail.html',
})

export class SpecialDateDetailCompoment implements OnInit {

    dataSet = [];
    loading = true;
    orgNo;
    page = new Page();
    allChecked = false;
    indeterminate = false;
    displayData: Array<any> = [];


    constructor(
        private orgService: OrgService,
        private orgWorkTimeService: OrgWorkTimeService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        this.refreshData(true);
    }
    displayDataChange($event) {
        this.displayData = $event;
    }

    checkAll(value) {
        if (value) {
            this.displayData.forEach(data => data.checked = true);
        } else {
            this.displayData.forEach(data => data.checked = false);
        }
        this.refreshStatus();
    }

    refreshStatus() {
        const allChecked = this.displayData.every(value => value.checked === true);
        const allUnChecked = this.displayData.every(value => !value.checked);
        this.allChecked = allChecked;
        this.indeterminate = (!allChecked) && (!allUnChecked);
    }

    refreshData(reset) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            orgNo: this.orgNo,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.allChecked = false;
        this.loading = true;
        // 获取当前页
        this.orgWorkTimeService.getOrgSpecialDate(params)
            .subscribe(data => {
                this.dataSet = data.data;
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                } else {
                    this.page.totalRow = 0;
                }
                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                } else {
                    data.data.forEach(data1 => {
                        if (data1.businessFlag === 'Y') {
                            data1.businessFlag = '营业';
                        } else {
                            data1.businessFlag = '不营业';
                        }
                    });
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                // console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    delSpecial() {
        const selected = this.dataSet.filter(x => x.checked);
        const logicIds = [];
        if (selected.length == 0) {
            this.message.error('请选择机构后再操作');
            return;
        } else {
            for (let i = 0; i < selected.length; i++) {
                logicIds.push(selected[i].logicId);
            }
        }
        const param = {
            logicIds: logicIds,
        };
        this.orgWorkTimeService.delSpecialDate(param)
            .subscribe(data => {
                this.loading = false;
                this.message.success('删除成功');
                this.refreshData(true);
            }, error => {
                this.loading = false;
                this.message.error(error.body.retMsg);
            });


    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    cancelDel() {

    }


}
