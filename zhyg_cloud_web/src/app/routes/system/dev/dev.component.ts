import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {DevService} from './dev.service';
import {OrgService} from '../org/org.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {Dev} from '../../../models/dev';
import {Org} from '../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {DevDetailComponent} from '../dev/component/dev-detail.component';
import {DevModifyComponent} from '../dev/component/dev-modify.component';
import {DevAddComponent} from '../dev/component/dev-add.component';
import {SysMenuService} from '../menu/menu.service';
import {DevDelComponent} from './component/dev-del.component';

@Component({
    templateUrl: './dev.html',
})
export class DevComponent implements OnInit, OnChanges {

    validateForm: FormGroup;
    dataSet = [];
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    orgNoList = [];
    auditDel: boolean;
    loading = true;
    dev: Dev;
    org: Org;
    page = new Page();

    constructor(
        private fb: FormBuilder,
        private devService: DevService,
        private orgService: OrgService,
        private modal: NzModalService,
        private session: SessionService,
        private menuService: SysMenuService,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        this.auditDel = this.menuService.checkAudit('设备管理', '删除');
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            ip: [null, Validators.maxLength(20)],
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
            devCatalog: [null, Validators.maxLength(5)],
            devVendor: [null, Validators.maxLength(5)],
            devType: [null, Validators.maxLength(5)],
        });
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
            ip: this.validateForm.controls.ip.value || '',
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo,
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        // 获取当前页
        this.devService.getDevs(params)
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
                        if (data1.awayFlag === '1') {
                            data1.awayFlag = '在行';
                        } else {
                            data1.awayFlag = '离行';
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

    showDetail(devs) {
        const modal = this.modal.open({
            title: '设备详情',
            maskClosable: false,
            content: DevDetailComponent,
            width: '75%',
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

    modDev(menuName, btnName, devs) {
        const checkAudit = this.menuService.checkAudit(menuName, btnName);
        const modal = this.modal.open({
            title: '修改设备',
            maskClosable: false,
            content: DevModifyComponent,
            width: '75%',
            componentParams: {
                devs: devs,
                checkAudit: checkAudit,
            },
            onOk: () => {
                this.refreshData();
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    addDev(menuName, btnName) {
        const checkAudit = this.menuService.checkAudit(menuName, btnName);
        const modal = this.modal.open({
            title: '添加设备',
            content: DevAddComponent,
            maskClosable: false,
            width: '75%',
            componentParams: {
                checkAudit: checkAudit,
            },
            onOk: () => {
                this.refreshData();
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    search() {
        this.refreshData(true);
    }

    confirmDel(no) {
        this.devService.delDev({
            no: no
        }).subscribe(data => {
            this.message.success('删除设备成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    deleteDevAudit(devNo) {
        const modal = this.modal.open({
            title: '删除设备',
            maskClosable: false,
            footer: false,
            content: DevDelComponent,
            componentParams: {
                checkAudit: this.auditDel,
                devNo: devNo,
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
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
            this.devService.getDevTypeByVendor(params).subscribe(
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
        this.devTypeList = [];
        this.refreshData(true);
    }

    cancel() {

    }

    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        return this.menuService.checkBtn(menuName, btnName);
    }

}
