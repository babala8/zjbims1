import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';

import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {Component, OnInit} from '@angular/core';
import {PjsMonitorService} from './pjsMonitor.service';
import {format} from 'date-fns';
import {PjsLogDetailComponent} from '../pjsLogMonitor/component/pjsLogDetail.component';
import {PjsDetailComponent} from './component/pjsDetail.component';


@Component({
    templateUrl: './pjsMonitor.html',
})
export class PjsMonitorComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    dayList = [
        {value: '0', name: '全部'},
        {value: '2', name: '2天未上送'},
        {value: '3', name: '3天未上送'},
        {value: '5', name: '5天未上送'},
        {value: '7', name: '7天未上送'},
    ];
    orderList = [
        {value: '1', name: '设备号↓'},
        {value: '2', name: '设备号↑'},
        {value: '3', name: '流水日期↓'},
        {value: '4', name: '流水日期↑'},
    ];
    faultList = [
        {value: 'all', name: '全部'},
        {value: 'all', name: '网络故障'},
        {value: 'all', name: '设备号不存在'},
        {value: 'all', name: '设备校验失败'},
    ];
    // 不同状态对应的图片
    status_pictures = [
        {status: 'ok', puctureName: 'ok.gif', Ename: '流水上送正常' },
        {status: 'warning', puctureName: 'warning.png', Ename: '设备离线' },
        {status: 'offline_warning', puctureName: 'offline_warning.png' , Ename: '通信异常'},
        {status: 'error', puctureName: 'error.png', Ename: '无纸化故障'},
        {status: 'offline_error', puctureName: 'offline_error.png', Ename: '网络故障'},
        {status: 'none', puctureName: 'none.png', Ename: '设备离线'},

    ];

    loading = true;
    page = new Page();

    constructor(
        private pjsMonitorService: PjsMonitorService,
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            org: [{no: '', name: ''}],
            day: [null, Validators.maxLength(5)],
            order: [null, Validators.maxLength(5)],
            fault: [null, Validators.maxLength(5)],
        });

        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            devNo: this.validateForm.controls.devNo.value || '',
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo,
            day: this.validateForm.controls.day.value || '',
            order: this.validateForm.controls.order.value || '',
            fault: this.validateForm.controls.fault.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        // 获取当前页
        this.pjsMonitorService.getDevsStatus(params).subscribe(data => {
            this.dataSet = data.data;
            console.log(this.dataSet);
            if (data.page != null) {
                this.page.totalRow = data.page.totalRow;
            }else {
                this.page.totalRow = 0 ;
            }
            if (this.dataSet == null || this.dataSet.length == 0) {
                this.dataSet = [];
            }else {
                this.dataSet.forEach(mapData => {
                    if (mapData.status != null) {
                        this.status_pictures.forEach(status_picture => {
                            if (status_picture.status == mapData.status) {
                                mapData.status = status_picture.puctureName;
                                mapData.statusName = status_picture.Ename;
                            }
                        });
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


    search() {
        this.refreshData(true);
    }
    /**
     * 将20190723格式的字符串转为标准时间字符串
     * @param str
     */
    string2DateString(str) {
        if (str == null) {
            return '';
        }
        const reg = /^(\d{4})(\d{2})(\d{2})$/;
        const d = str.replace(reg, '$1-$2-$3');
        return d;
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }


    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({});
        this.refreshData(true);
    }

    showDetail(devNo) {
        const modal = this.modal.open({
            title: '查看无纸化监控详细情',
            content: PjsDetailComponent,
            width: '60%',
            componentParams: {
                devNo: devNo
            },
            footer: false
        });
    }


}
