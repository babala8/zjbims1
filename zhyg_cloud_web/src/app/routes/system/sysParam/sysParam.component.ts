import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SysParamService} from './sysParam.service';
import {CaseCatalogModifyComponent} from './component/caseCatalog-modify.component';
import {Page} from '../../../models/page';


@Component({
    templateUrl: './sysParam.html',
})
export class SysParamComponent implements OnInit {
    formModel = {};
    dataSet = [];
    loading = true;
    page = new Page();
    constructor(
        private fb: FormBuilder,
        private sysParamService: SysParamService,
        private modal: NzModalService,
        private message: NzMessageService,
    ) {
    }
    ngOnInit() {
        this.formModel['org'] = {
            no: '',
            name: ''
        };
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            orgNo: this.formModel['org'].no ,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        console.log(params);

        this.sysParamService.getSysParam(params)
            .subscribe(data => {
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
                        if (data1.responsorCatalog === 1) {
                            data1.responsorCatalog = '管机员';
                        }else if (data1.responsorCatalog === 2) {
                            data1.responsorCatalog = '维护人员';
                        }else {
                            data1.responsorCatalog = '管机员与维护人员';
                        }
                        if (data1.notifyWay === 1) {
                            data1.notifyWay = '短信';
                        }else if (data1.notifyWay === 2) {
                            data1.notifyWay = '邮件';
                        }else if (data1.notifyWay === 3) {
                            data1.notifyWay = '短信和邮件';
                        } else {
                            data1.notifyWay = '不通知';
                        }
                        if (data1.sendMsgMethod === 0) {
                            data1.sendMsgMethod = '逐级放送';
                        }else {
                            data1.sendMsgMethod = '全部放送';
                        }
                    });
                }
                this.loading = false;
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    selectOrg(nets) {
        console.log(nets.target.value);
    }

    searchOrgNo() {
        this.refreshData(true);
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        // this.validateForm.reset();
        this.formModel['org'] = {
            no: '',
            name: ''
        };
        this.refreshData(true);
    }

    modCaseCatalog(caseCatalog) {
        const modal = this.modal.open({
            title: '修改故障响应设定',
            content: CaseCatalogModifyComponent,
            maskClosable: false,
            width: '60%',
            componentParams: {
                caseCatalog: caseCatalog
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            },
            footer: false
        });
    }
}
