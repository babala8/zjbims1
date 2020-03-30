import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {TargetManagementService} from './targetManagement.service';
import {Org} from '../../../models/org';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {TargetManagementAddComponent} from './component/targetManagement-add.component';
import {TargetManagementModifyComponent} from './component/targetManagement-modify.component';
import {FormBuilder, FormGroup} from '@angular/forms';


@Component({
    templateUrl: './targetManagement.html',
})
export class TargetManagementComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    org: Org;
    page = new Page();
    tarType = {
        ar: true,
        dar: true,
        dcr: true,
        far: true,
        fcr: true,
        or: true
    };

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private targetManagementService: TargetManagementService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            org: [
                {no: '10001', name: '总行'}],
            year: [null],
            quarter: [null],
            tarType: [null]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        // 季度多选
        let quarter = '';
        if (this.validateForm.controls.quarter.value) {
            for (const i of this.validateForm.controls.quarter.value) {
                quarter += ',' + i ;
            }
        }
        if (quarter === '') {
            quarter = '1,2,3,4';
        } else {
            quarter = quarter.substring(1);
        }
        // 目标类型多选
        if (this.validateForm.controls.tarType.value) {
            this.tarType.or = false;
            this.tarType.dar = false;
            this.tarType.dcr = false;
            this.tarType.fcr = false;
            this.tarType.far = false;
            this.tarType.ar = false;
            for (const i of this.validateForm.controls.tarType.value) {
                switch (i) {
                    case 'or' :
                        this.tarType.or = true;
                        break;
                    case 'dcr' :
                        this.tarType.dcr = true;
                        break;
                    case 'dar' :
                        this.tarType.dar = true;
                        break;
                    case 'fcr' :
                        this.tarType.fcr = true;
                        break;
                    case 'far' :
                        this.tarType.far = true;
                        break;
                    case 'ar' :
                        this.tarType.ar = true;
                        break;
                }
            }
        }
        const params = {
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo || '10001',
            year: this.validateForm.controls.year.value || '',
            quarter: quarter,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        this.loading = true;
        // 获取当前页
        this.targetManagementService.getTargets(params)
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.dataSet.forEach(x => {
                        x.openAccountCount = x.openAccountCount + '(' + x.or + '%)';
                        x.depositCount = x.depositCount + '(' + x.dcr + '%)';
                        x.depositAmount = x.depositAmount + '(' + x.dar + '%)';
                        x.financingCount = x.financingCount + '(' + x.fcr + '%)';
                        x.financingAmount = x.financingAmount + '(' + x.far + '%)';
                        x.ar = x.ar + '%';
                    });
                    this.page.totalRow = data.page['totalRow'];
                } else {
                    this.dataSet = [];
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addTarget() {
        const modal = this.modal.open({
            title: '添加目标',
            maskClosable: false,
            footer: false,
            content: TargetManagementAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyTarget(target) {
        const modal = this.modal.open({
            title: '修改目标',
            maskClosable: false,
            footer: false,
            content: TargetManagementModifyComponent,
            componentParams: {
                target: target
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(params) {
        console.log(params);
        this.targetManagementService.delTarget(params)
            .subscribe(data => {

                this.refreshData(false);
                this.message.success('删除成功');
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
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.year.setValue('');
        this.validateForm.controls.quarter.setValue('');
        this.refreshData(true);
    }

    cancel() {

    }


}
