import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {BulletinService} from './bulletin.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {BulletinAddComponent} from './component/bulletin-add.component';
import {BulletinModifyComponent} from './component/bulletin-modify.component';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SysMenuService} from '../menu/menu.service';
 import {BulletinDetailComponent} from './component/bulletin-detail.component';

// 公告管理

@Component({
    templateUrl: './bulletin.html',

})
export class BulletinComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private bulletinService: BulletinService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            publisher: null,
            title: null,
            startTime: null,
            endTime: null,
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            publisher: this.validateForm.controls.publisher.value || '',
            title: this.validateForm.controls.title.value || '',
            startTime: this.date2String(this.validateForm.controls.startTime.value, 'yyyy-MM-dd') || '',
            endTime: this.date2String(this.validateForm.controls.endTime.value, 'yyyy-MM-dd') || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        console.log(this.validateForm.controls.startTime.value);
        this.loading = true;
        // 获取当前页
        this.bulletinService.getBulletins(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                this.dataSet = data.data;
                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.page.totalRow = 0 ;
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addBulletin() {
        const modal = this.modal.open({
            title: '添加公告',
            maskClosable: false,
            footer: false,
            content: BulletinAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }
    openDetail(bulletin) {
        const modal = this.modal.open({
            title: '公告详情',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: BulletinDetailComponent,
            componentParams: {
                bulletin: bulletin
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
            });
    }
    confirmDel(bulletinId) {
        this.bulletinService.delBulletin({
            bulletinId: bulletinId
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除系统公告成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }
    modifyBulletin(bulletins) {
        const modal = this.modal.open({
            title: '修改系统公告',
            maskClosable: false,
            footer: false,
            content: BulletinModifyComponent,
            componentParams: {
                bulletins: bulletins
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }

    /**
     * 日期转字符串
     * @param date
     */
    date2String(date: Date, fmt: string): string {
        if (date == null) {
            return '';
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
     * 限制开始时间
     * @param startValue
     * @private
     */
    _disabledStartDate = (startValue) => {
        const endValue = this.validateForm.controls.endTime.value;
        if (!startValue || !endValue) {
            return false;
        }
        return startValue.getTime() >= endValue.getTime();
    }
    /**
     * 限制结束时间
     * @param endValue
     * @private
     */
    _disabledEndDate = (endValue) => {
        const startValue = this.validateForm.controls.startTime.value;
        if (!endValue || !startValue) {
            return false;
        }
        return endValue.getTime() <= startValue.getTime();
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.publisher.setValue('');
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
