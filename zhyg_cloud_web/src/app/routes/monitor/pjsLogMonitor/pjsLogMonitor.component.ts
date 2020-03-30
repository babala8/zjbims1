import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {Dev} from '../../../models/dev';
import {Org} from '../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {Component, OnInit} from '@angular/core';
import {PjsLogMonitorService} from './pjsLogMonitor.service';
import {format} from 'date-fns';
import {PjsLogDetailComponent} from './component/pjsLogDetail.component';


@Component({
    templateUrl: './pjsLogMonitor.html',
})
export class PjsLogMonitorComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    orgNoList = [];
    loading = true;
    page = new Page();

    constructor(
        private pjsMonitorService: PjsLogMonitorService,
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            // ip: [null, Validators.maxLength(20)],
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
            devCatalog: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
           // devType: [null, Validators.maxLength(5)],
            logDate: [new Date()],
        });
        this.pjsMonitorService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;

            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.pjsMonitorService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            devNo: this.validateForm.controls.devNo.value || '',
            // ip: this.validateForm.controls.ip.value || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            // devType: this.validateForm.controls.devType.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        // 获取当前页
        this.pjsMonitorService.getDevs(params)
            .subscribe(data => {
                this.dataSet = data.data;
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                } else {
                    this.page.totalRow = 0;
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

    showLog(devNo) {
        const params = {
            devNo: devNo,
            logDate: format(this.validateForm.controls.logDate.value, 'YYYY-MM-DD'),
        };
        const modal = this.modal.open({
            title: '查看流水',
            content: PjsLogDetailComponent,
            width: '60%',
            componentParams: {
                params
            },
            footer: false
        });
    }


    /**
     * 选择设备品牌后，查询用户可选的设备类型
     * @param evt
     */
    selectDevType(evt: any) {
        console.log(evt);
        if (evt) {
            const params = {
                devVendor: evt || '',
                devCatalog: '',
            };
            console.log(params);
            this.pjsMonitorService.getDevTypeByVendor(params).subscribe(
                data => {
                    this.devTypeList = data.data;
                    console.log(this.devTypeList);
                }, error => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
        }
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        // this.validateForm.controls.ip.setValue('');
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.devCatalog.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        // this.validateForm.controls.devType.setValue('');
        // this.devTypeList = [];
        this.validateForm.controls.logDate.setValue(new Date());
        this.refreshData(true);
    }

    _disabledDate(current: Date): boolean {
        return current && current.getTime() > Date.now();
    }

}
