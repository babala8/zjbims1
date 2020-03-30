import {Component, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {OrgService} from '../../system/org/org.service';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {WebSocketService} from '../webSocketService';
import {SysMenuService} from '../../system/menu/menu.service';
import {DevControlService} from '../devControl/devControl.service';
import {DevService} from '../../system/dev/dev.service';
import {AtmFunctionDetailComponent} from './component/atmFunctionDetail.component';

@Component({
    templateUrl: './atmFunction.html',
})
export class AtmFunctionComponent implements OnInit, OnDestroy {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page(); // 设备列表分页
    devTypeList = []; // 设备型号列表
    devVendorList = []; // 设备品牌列表
    devCatalogList = []; // 设备类型列表
    selectCatalog: string;

    allChecked = false; // 全选
    indeterminate = false; // 半选

    // 加载结果
    loadResult = false;
    // websocket session 标识
    sessionId;


    constructor(
        private fb: FormBuilder,
        private message: NzMessageService,
        private orgService: OrgService,
        private devControlService: DevControlService,
        private session: SessionService,
        private webSocketService: WebSocketService,
        private menuService: SysMenuService,
        private devService: DevService,
        private modal: NzModalService) {

    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
            devVendor: [null],
            devType: [null],
            devCatalog: [null]
        });
        // 查询设备品牌信息
        this.devControlService.qryDevVendors({}).subscribe(
            data => {
                if (data.data) {
                    this.devVendorList = data.data;
                }
            },
            error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 查询设备型号
        this.devControlService.qryDevTypes({}).subscribe(
            data => {
                if (data.data) {
                    this.devTypeList = data.data;
                    // this.selectableDevTypeList = this.devTypeList;
                }
            },
            error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 查询设备类型
        this.devService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
                console.log(this.devCatalogList);
                this.selectCatalog = this.devCatalogList[0].no;
                this.refreshData(true);
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }


    ngOnDestroy(): void {
        // this.webSocketService.ws.close();
    }

    /**
     * 刷新设备列表
     * @param reset
     */
    refreshData(reset = false) {
        setTimeout(() => {
            if (reset) {
                this.page.curPage = 1;
            }
            this.allChecked = false;
            this.loading = true;
            const params = {
                orgNo: this.validateForm.controls.org.value.no || '',
                devNo: this.validateForm.controls.devNo.value || '',
                devVendor: this.validateForm.controls.devVendor.value || '',
                devType: this.validateForm.controls.devType.value || '',
                devCatalog: this.validateForm.controls.devCatalog.value || this.selectCatalog || '',
                curPage: this.page.curPage,
                pageSize: this.page.pageSize
            };
            this.devControlService.qryDevs(params).subscribe(
                data => {
                    // console.log('查询设备:', data.data);
                    this.loading = false;
                    if (data.data) {
                        this.dataSet = data.data;
                        this.page.totalRow = data.page.totalRow;
                        this.dataSet.forEach(itme => {
                            itme.checked = false;
                        });
                    } else {
                        this.dataSet = [];
                        this.page.totalRow = 0;
                    }
                },
                error => {
                    this.loading = false;
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
        }, 0);
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.org.setValue({no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName});
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.devTypeList = [];
        this.refreshData(true);
    }

    cancel() {

    }

    /**
     * 刷新全选按钮状态
     * @private
     */
    refreshStatus() {
        if (this.dataSet.length > 0) {
            const allChecked = this.dataSet.every(value => value.checked === true);
            const allUnChecked = this.dataSet.every(value => !value.checked);
            this.allChecked = allChecked;
            this.indeterminate = (!allChecked) && (!allUnChecked);
        }
    }

    /**
     * 全选/全不选
     * @param value
     * @private
     */
    checkAll(value) {
        if (value) {
            this.dataSet.forEach(data => data.checked = true);
        } else {
            this.dataSet.forEach(data => data.checked = false);
        }
        this.refreshStatus();
    }


    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        return this.menuService.checkBtn(menuName, btnName);
    }

    /**
     * 功能设定
     */
    atmFunction() {
        const devList = this.dataSet.filter(x => x.checked).map( item => item.devNo);
        if (devList.length === 0) {
            this.message.error('请选择设备后再操作');
            return;
        }
        console.log('设备功能设定。。。');
        console.log(devList);
        let devs = '';
        for (let i = 0; i < devList.length; i++) {
            devs += devList[i] + ',';
        }
        const modal = this.modal.open({
            title: '功能定义',
            content: AtmFunctionDetailComponent,
            width: '80%',
            componentParams: {
                devList: devs,
                devCatalog: this.selectCatalog
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
