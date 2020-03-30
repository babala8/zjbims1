import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {Component, OnInit} from '@angular/core';
import {format} from 'date-fns';
import {PjsTermMonitorService} from './pjsTermMonitor.service';


@Component({
    templateUrl: './pjsTermMonitor.html',
})
export class PjsTermMonitorComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    bindRemarkList = [];


    loading = true;
    page = new Page();


    constructor(
        private pjsTermMonitorService: PjsTermMonitorService,
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
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
            bindRemark: [null, Validators.maxLength(5)],
        });
        this.bindRemarkList = this.pjsTermMonitorService.getBindRemarkList();
        this.pjsTermMonitorService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.pjsTermMonitorService.getDevVendorInfo({}).subscribe(
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
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo ,
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            bindRemark: this.validateForm.controls.bindRemark.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        // 获取当前页
        this.pjsTermMonitorService.getDevs(params)
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


    /**
     * 日期转字符串
     * @param date 时间对象
     * @param fmt 转换格式
     * @param flag 第一个参数是否为字符串型的date
     */
    formatDate(date: Date, fmt: string, flag: boolean) {
        if (date == null) {
            return '';
        }
        if (flag) {
            date = new Date(date);
        }
        if (!date) {
            date = new Date();
        }
        const o = {
            'M+' : date.getMonth() + 1, // 月份
            'd+' : date.getDate(), // 日
            'h+' : date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, // 小时
            'H+' : date.getHours(), // 小时
            'm+' : date.getMinutes(), // 分
            's+' : date.getSeconds(), // 秒
            'q+' : Math.floor((date.getMonth() + 3) / 3), // 季度
            'S' : date.getMilliseconds() // 毫秒
        };
        const week = {
            '0' : '/u65e5',
            '1' : '/u4e00',
            '2' : '/u4e8c',
            '3' : '/u4e09',
            '4' : '/u56db',
            '5' : '/u4e94',
            '6' : '/u516d'
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        if (/(E+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? '/u661f/u671f' : '/u5468') : '')
                + week[date.getDay() + '']);
        }
        for (const k in o) {
            if (new RegExp('(' + k + ')').test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
            }
        }
        return fmt;
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
            this.pjsTermMonitorService.getDevTypeByVendor(params).subscribe(
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
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.devCatalog.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.devTypeList = [];
        this.refreshData(true);
    }


    // 解绑
    unbutton(id: any) {
        const params = {id: id};
        this.pjsTermMonitorService.unbutton(params).subscribe(data => {
            this.message.success('解绑设备成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }
}
