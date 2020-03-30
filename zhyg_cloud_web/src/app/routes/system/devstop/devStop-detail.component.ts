import {Component, OnChanges, OnInit} from '@angular/core';
import {DevStopService} from './devStop.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {DevService} from '../dev/dev.service';
import {Page} from '../../../models/page';
import {OrgService} from '../org/org.service';
import {SysMenuService} from '../menu/menu.service';
import {DevDetailComponent} from '../dev/component/dev-detail.component';
import {OrgDetailLogComponent} from '../org/component/org-detail-log.component';

@Component({
    templateUrl: './devStop-detail.html',
})

export class DevStopDetailComponent implements OnInit, OnChanges {

    validateForm: FormGroup;
    dataSet = [];
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    loading = true;
    devs = {no: ''};
    orgs = {no: ''};
    page = new Page();
    stopDevTypeList = [
        {no: '0', name: '放假'},
        {no: '1', name: '装修'},
        {no: '2', name: '停电'},
        {no: '3', name: '设备故障未修复'},
        {no: '4', name: '其他'},
    ];
    devStop;
    title = '停机详细查询';
    orgNo;


    constructor(
        private fb: FormBuilder,
        private devService: DevService,
        private devStopService: DevStopService,
        private orgService: OrgService,
        private modal: NzModalService,
        private session: SessionService,
        private menuService: SysMenuService,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            org: [
                {no: '', name: ''}],
            devCatalog: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            devType: [null, Validators.maxLength(5)],
            stopDevType: [null],
            stopDevStartTime: [null, Validators.maxLength(20)],
            stopDevEndTime: [null, Validators.maxLength(20)],
        });
        this.devStopService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devStopService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devStopService.getDevTypeByVendor({}).subscribe(
            data => {
                this.devTypeList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
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
            orgNo: this.validateForm.controls.org.value.no || '',
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            stopDevType: this.validateForm.controls.stopDevType.value || '',
            stopDevStartTime: this.date2String(this.validateForm.controls.stopDevStartTime.value) || '',
            stopDevEndTime: this.date2String(this.validateForm.controls.stopDevEndTime.value) || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        // 获取当前页
        this.devStopService.getStopDevDetail(params)
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
                        if (data1.stopDevType === 0) {
                            data1.stopDevType = '放假';
                        } else if (data1.stopDevType === 1) {
                            data1.stopDevType = '装修';
                        } else if (data1.stopDevType === 2) {
                            data1.stopDevType = '停电';
                        } else if (data1.stopDevType === 3) {
                            data1.stopDevType = '设备故障';
                        } else {
                            data1.stopDevType = '其他';
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
            this.devStopService.getDevTypeByVendor(params).subscribe(
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
        this.validateForm.controls.org.setValue('');
        this.validateForm.controls.stopDevType.setValue('');
        this.validateForm.controls.devCatalog.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.validateForm.controls.stopDevStartTime.setValue('');
        this.validateForm.controls.stopDevEndTime.setValue('');
        this.devTypeList = [];
        this.refreshData(true);
    }

    cancel() {

    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }


    showDevDetail(devNo: any) {
        this.devs.no = devNo;
        this.modal.open({
            title: '设备详情',
            content: DevDetailComponent,
            maskClosable: false,
            width: '60%',
            componentParams: {
                devs: this.devs
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false
        });

    }

    showOrgDetail(orgNo: any) {
        this.modal.open({
            title: '机构详情',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: OrgDetailLogComponent,
            componentParams: {
                orgNo: orgNo
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });

    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date: Date): string {
        if (!date) {
            return '';
        }
        date.setHours(date.getHours() + 8);
        const _date = date.toISOString().substring(0, 10);
        return _date;
    }

    search() {
        this.refreshData(true);

    }
}
