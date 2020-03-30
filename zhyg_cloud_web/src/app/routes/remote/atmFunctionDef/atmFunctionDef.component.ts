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
import {AtmFunctionDefService} from './atmFunctionDef.service';
import {AtmFunctionDefAddComponent} from './component/atmFunctionDef-add.component';
import {logger} from 'codelyzer/util/logger';

@Component({
    templateUrl: './atmFunctionDef.html',
})
export class AtmFunctionDefComponent implements OnInit, OnDestroy {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page(); // 设备列表分页
    devCatalogList = []; // 设备类型列表
    selectCatalog: string;
    selectCatalogName: string;
    devTrans;
    allChecked = false; // 全选
    indeterminate = false; // 半选

    // 加载结果
    loadResult = false;
    // websocket session 标识
    sessionId;


    constructor(
        private fb: FormBuilder,
        private message: NzMessageService,
        private atmFunctioinDefService: AtmFunctionDefService,
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
            devCatalog: [null],
            transNo: [null],
            transName: [null],
            transCode: [null]
        });
        // 查询设备类型
        this.devService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
                console.log(this.devCatalogList);
                this.selectCatalog = this.devCatalogList[0].no;
                this.selectCatalogName = this.devCatalogList[0].name;
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
        if (reset) {
            this.page.curPage = 1;
        }
        this.allChecked = false;
        this.loading = true;
        const params = {
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            transNo: this.validateForm.controls.transNo.value || '',
            transName: this.validateForm.controls.transName.value || '',
            transCode: this.validateForm.controls.transCode.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.atmFunctioinDefService.getAtmFunctionDef(params).subscribe(
            data => {
                // console.log('查询设备类型功能信息:', data.data);
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
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devCatalog.setValue(this.selectCatalogName);
        this.validateForm.controls.transNo.setValue('');
        this.validateForm.controls.transCode.setValue('');
        this.validateForm.controls.transName.setValue('');
        // this.devCatalogList = [];
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
     * 删除设备交易功能
     */
    confirmDel() {
        const devTransList = this.dataSet.filter(x => x.checked).map( item => item.id);
        if (devTransList.length === 0) {
            this.message.error('请选择交易后再操作');
            return;
        }
        this.devTrans = '';
        for (let i = 0; i < devTransList.length; i++) {
            this.devTrans += devTransList[i] + ',';
        }

        const params = {
            devList: this.devTrans
        };
        this.atmFunctioinDefService.delAtmeFunctionDef(params).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除交易类型功能成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }


    /**
     * 添加设备交易类型
     * @param atmFunctionDef
     */


    addAtmFunctionDef() {
        const modal = this.modal.open({
            title: '添加设备交易类型',
            maskClosable: false,
            footer: false,
            content: AtmFunctionDefAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            },
        });
    }



}
