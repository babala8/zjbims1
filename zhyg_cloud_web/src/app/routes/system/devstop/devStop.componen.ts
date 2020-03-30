import {Component, OnChanges, OnInit} from '@angular/core';
import {DevStopService} from './devStop.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Page} from '../../../models/page';
import {OrgService} from '../org/org.service';
import {DevService} from '../dev/dev.service';
import {SysMenuService} from '../menu/menu.service';
import {DevDetailComponent} from '../dev/component/dev-detail.component';
import {DevStopAddComponent} from './component/devStop-add.component';
import {OrgDetailLogComponent} from '../org/component/org-detail-log.component';
import {Router} from '@angular/router';
import {DevStopModifyComponent} from './component/devStop-modify.component';


@Component({
    templateUrl: './devStop.html',
})

export class DevStopComponent implements OnInit, OnChanges {
    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    operateStatusList = [
        {no: '1', name: '启用'},
        {no: '2', name: '停机'},
        {no: '', name: '全部'},
    ];
    loading = true;
    devs = {no: ''};
    orgs = {no: ''};
    page = new Page();

    constructor(
        private fb: FormBuilder,
        private devStopService: DevStopService,
        private devService: DevService,
        private orgService: OrgService,
        private modal: NzModalService,
        private session: SessionService,
        private menuService: SysMenuService,
        private message: NzMessageService,
        private router: Router,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            ip: [null, Validators.maxLength(20)],
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
            devCatalog: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            devType: [null, Validators.maxLength(5)],
            address: [null, Validators.maxLength(5)],
            operateStatus: [null, Validators.maxLength(5)],
            stopDevEndTime: [null, Validators.maxLength(5)],
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
            devIp: this.validateForm.controls.ip.value || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            address: this.validateForm.controls.address.value || '',
            operateStatus: this.validateForm.controls.operateStatus.value || '',
            stopDevEndTime: this.date2String(this.validateForm.controls.stopDevEndTime.value || ''),
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        // 获取当前页
        this.devStopService.getDevs(params)
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
                        if (data1.operateStatus === '1') {
                            data1.operateStatus = '启用';
                        } else if (data1.operateStatus === '2') {
                            data1.operateStatus = '停机';
                        } else {
                            data1.operateStatus = '未知';
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

    showDevStopDetail() {
        this.router.navigate(['/system/devStopDetail']);
    }

    addDevStop(devStop) {
        this.modal.open({
            title: '添加停机',
            maskClosable: false,
            footer: false,
            width:'60%',
            content: DevStopAddComponent,
            componentParams: {
                devStop: devStop
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    search() {
        this.refreshData(true);
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
        this.validateForm.controls.ip.setValue('');
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.devCatalog.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.validateForm.controls.address.setValue('');
        this.validateForm.controls.operateStatus.setValue('');
        this.validateForm.controls.stopDevEndTime.setValue('');
        this.devTypeList = [];
        this.refreshData(true);
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date: Date) {
        if (!date) {
            return '';
        }
        date.setHours(date.getHours() + 8);
        const _date = date.toISOString().substring(0, 10);
        const _time = date.toTimeString().substring(0, 8);
        return _date;
    }

    cancel() {

    }

    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string, item): boolean {
        const flag = item.stopDevStartTime != null && item.isAfter == 0;
        return this.menuService.checkBtn(menuName, btnName) && flag;
    }

    showDevDetail(no: any) {
        console.log(no);
        this.devs.no = no;
        this.modal.open({
            title: '设备详情',
            content: DevDetailComponent,
            width: '80%',
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

    showOrgDetail(orgNo) {
        console.log(orgNo);
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

    modDevStop(item: any) {
        this.modal.open({
            title: '停机设定修改',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: DevStopModifyComponent,
            componentParams: {
                item: item
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });

    }
}
