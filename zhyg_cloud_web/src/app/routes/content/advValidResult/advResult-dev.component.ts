import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {AdvValidService} from '../advInvalid/advValid.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {DevService} from '../../system/dev/dev.service';
import {AdvResultDevAdvComponent} from './advResult-dev-adv.component';
import {DevDetailComponent} from '../../system/dev/component/dev-detail.component';
import {AdvResultService} from './advResult.service';

@Component({
    selector: 'advResultDev',
    templateUrl: './advResult-dev.html',
})
export class AdvResultDevComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page();
    devCatalogList = [];
    devVendorList = [];

    constructor(
        private fb: FormBuilder,
        private service: AdvValidService,
        private resultService: AdvResultService,
        private devService: DevService,
        private session: SessionService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {devNo: this.validateForm.controls.devNo.value || '',
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        console.log(params);
        this.devService.getDevs(params).subscribe(data => {
            this.dataSet = data.data;
            console.log(this.dataSet);
            if (this.dataSet) {
                this.page.totalRow = data.page.totalRow;
                this.dataSet.forEach(item => {
                    if (item.awayFlag === '1') {
                        item.awayFlag = '在行';
                    } else {
                        item.awayFlag = '离行';
                    }
                });
            } else {
                this.dataSet = [];
                this.page.totalRow = 0 ;
            }
            this.loading = false;
        }, (error) => {
            this.loading = false;
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    ngOnInit(): void {
        this.devService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.validateForm = this.fb.group({
            devNo: [null],
            org: [{no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
            devCatalog: [null],
            devVendor: [null]
        });
        this.refreshData(true);
    }

    /**
     * 设备重新对标
     * @param devNo
     */
    syncAds(devNo) {
        /*
        const devNos = this.devNos != null ? (<string[]>this.devNos).join('|') : '';
        if (devNos == '' || devNos.length == 0) {
            this.message.warning('请先选择设备');
            return;
        }
        */
        const params = {
            userNo: this.session.getUserSession().account,
            devNos: devNo,
            taskType: '9'
        };
        this.resultService.syncAds(params).subscribe(
            () => {
                this.loading = false;
                this.message.success('已添加后台作业');
                this.refreshData(false);
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 展示详情
     * @param item
     */
    showDetail(item) {
        this.modal.open({
            title: '广告详情',
            footer: false,
            maskClosable: false,
            width: '60%',
            content: AdvResultDevAdvComponent,
            componentParams: {
                devNo: item.no,
            },
            onOk: () => {
            },
            onCancel: () => {
            }
        });
    }

    /**
     * 展示设备详细信息
     * @param item
     */
    showDevDetail(item) {
        this.modal.open({
            title: '设备详情',
            width: '60%',
            content: DevDetailComponent,
            componentParams: {
                devs: item
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    cancel() {

    }

    search() {
        this.refreshData(true);
    }

    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.org.setValue({no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName});
        this.refreshData(true);
    }
}

