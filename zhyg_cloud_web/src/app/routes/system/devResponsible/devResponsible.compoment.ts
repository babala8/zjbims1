import {Component, OnInit, OnChanges} from '@angular/core';
import {DevResponsibleService} from './devResponsible.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Page} from '../../../models/page';
import {DevResponsibleManagerComponent} from './component/devResponsible-manager.component';
import {DevResponsibleOrgComponent} from './component/devResponsible-org.component';
import {DevResponsibleDetailComponent} from './component/devResponsible-detail.component';
import {SessionService} from '@core/session.service';
import {DevManagerComponent} from './component/devResponsible-devmanager.component';

@Component({
    templateUrl: './devResponsible.html',
})

// 设备责任人管理
export class DevResponsibleComponent implements OnInit, OnChanges {

    validateForm: FormGroup;
    dataSet = [];
    loading = true;
    page = new Page();


    constructor(
        private fb: FormBuilder,
        private devResponsibleService: DevResponsibleService,
        private message: NzMessageService,
        private modal: NzModalService,
        private session: SessionService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
        });
        this.refreshData(true);
    }
    ngOnChanges() {

    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            devNo: this.validateForm.controls.devNo.value || '',
            orgNo: this.validateForm.controls.org.value.no,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log('2222222');
        console.log(params);
        // 获取当前页
        this.devResponsibleService.getDevResponsor(params)
            .subscribe(data => {
                this.dataSet = data.data;
                console.log(this.dataSet);
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.page.totalRow = 0 ;
                }
                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }
                this.loading = false;
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    search() {
        this.refreshData(true);
    }

    showDevResponsible(item) {
        const modal = this.modal.open({
            title: '设备责任人',
            content: DevResponsibleManagerComponent,
            maskClosable: false,
            width: '60%',
            componentParams: {
                item: item
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    showDevinfo(devs) {
        const modal = this.modal.open({
            title: '设备详情',
            content: DevResponsibleDetailComponent,
            maskClosable: false,
            width: '60%',
            componentParams: {
                devs: devs
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    showOrg(orgs) {
        const modal = this.modal.open({
            title: '机构详情',
            maskClosable: false,
            footer: false,
            content: DevResponsibleOrgComponent,
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

    showManager(manager) {
        console.log(manager);
        const modal = this.modal.open({
            title: '管机员详情',
            maskClosable: false,
            footer: false,
            width: '70%',
            content: DevManagerComponent,
            componentParams: {
                manager: manager
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
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.org.setValue({no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName});
        this.refreshData(true);
    }

    cancel() {

    }

}
