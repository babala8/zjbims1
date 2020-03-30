import {Component, OnInit} from '@angular/core';
import {Page} from '../../../models/page';
import {OrgService} from '../org/org.service';
import {OrgWorkTimeService} from './OrgWorkTime.service';
import {Org} from '../../../models/org';
import {FormBuilder, FormGroup} from '@angular/forms';
import {OrgType} from '../../../models/orgType';
import {SessionService} from '@core/session.service';
import {OrgDetailComponent} from './component/org-detail.component';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {OrgBatchAddComponent} from './component/org-batchAdd.compent';
import {SpecialDateDetailCompoment} from './component/specialDate-detail.compoment';

@Component({
    templateUrl: './OrgWorkTime.html',
})

export class OrgWorkTimeComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    orgGrade;
    orgTypeList: OrgType[] = [];
    loading = true;
    org: Org;
    page = new Page();
    num = 0;
    allChecked = false;
    indeterminate = false;
    displayData: Array<any> = [];


    constructor(
        private orgService: OrgService,
        private session: SessionService,
        private fb: FormBuilder,
        private orgWorkTimeService: OrgWorkTimeService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            orgNo: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}]
        });
        this.refreshData(true);
    }
    displayDataChange($event) {
        this.displayData = $event;
    }
    refreshData(reset) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.allChecked = false;
        const params = {
            orgNo: this.validateForm.controls.orgNo.value.no || this.session.getUserSession().orgNo,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.loading = true;
        // 获取当前页
        this.orgWorkTimeService.getOrgWorkTime(params)
            .subscribe(data => {
                this.loading = false;
                this.dataSet = data.data;
                this.page.totalRow = data.page.totalRow;
            }, (error) => {
                this.loading = false;
                // console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
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


    openDetail(orgs) {
        const modal = this.modal.open({
            title: '机构详情',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: OrgDetailComponent,
            componentParams: {
                orgs: orgs
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.orgNo.setValue({no: '', name: ''});
        this.refreshData(true);
    }


    /**
     * 设置多个机构时间
     * */
    modifyWorkTime() {
        const selectedOrgs = this.dataSet.filter(x => x.checked);
        if (selectedOrgs.length == 0) {
            this.message.error('请选择机构后再操作');
            return;
        }
        console.log(selectedOrgs);
        const modal = this.modal.open({
            title: '设置机构工作时间',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: OrgBatchAddComponent,
            componentParams: {
                orgs: selectedOrgs
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });

    }

    /**
     * 查询机构特殊日期明细
     * @param item
     */
    openSpecialDetail(item) {
        const modal = this.modal.open({
            title: '特殊日期详情',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: SpecialDateDetailCompoment,
            componentParams: {
                orgNo: item.no
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });


    }


}
