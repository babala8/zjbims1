import {Component, OnInit, TemplateRef} from '@angular/core';
import {OrgService} from '../org/org.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {MyApplyService} from './myApply.service';
import {SysMenuService} from '../menu/menu.service';
import {UserDetailLogComponent} from '../user/component/user-detail-log.component';
import {UserRefillComponent} from './component/user-refill.component';
import {DevRefillComponent} from './component/dev-refill.component';
import {UserRedelComponent} from './component/user-redel.component';
import {DevRedelComponent} from './component/dev-redel.component';
import {DevDetailLogComponent} from '../dev/component/dev-detail-log.component';

@Component({
    templateUrl: './myApply.html',
})
export class MyApplyComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    /**
     * 审核状态
     */
    commitStatusList = [
        {no: '1', name: '未审核'},
        {no: '2', name: '已审核'},
        {no: '', name: '全部'}
    ];
    /**
     * 经营方式
     */
    menuList = [
        {no: 'com.zjft.zhyg.system.controller.UserController', name: '用户管理'},
        {no: 'com.zjft.zhyg.system.controller.DevBaseController', name: '设备管理'},
        {no: '', name: '全部'}
    ];
    /**
     * 设备维护商
     */
    btnList = [
        {no: 'add', name: '添加'},
        {no: 'mod', name: '修改'},
        {no: 'del', name: '删除'},
        {no: '', name: '全部'},
    ];
    /**
     * 提交状态
     */
    auditResultList = [
        {no: 'Y', name: '通过'},
        {no: 'N', name: '拒绝'},
        {no: '', name: '全部'},
    ];
    loading = true;
    startTime;
    endTime;
    page = new Page();
    component;
    //查看详情对应的组件
    viewMap = {
        'dev': DevDetailLogComponent,
        'user': UserDetailLogComponent,
    };
    //重填对应的组件
    modMap = {
        'dev': DevRefillComponent,
        'user': UserRefillComponent,
        'devDel': DevRedelComponent,
        'userDel': UserRedelComponent,
    };


    constructor(
        private fb: FormBuilder,
        private orgService: OrgService,
        private modal: NzModalService,
        private session: SessionService,
        private menuService: SysMenuService,
        private message: NzMessageService,
        private myApplyService: MyApplyService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            auditResult: [null, Validators.maxLength(20)],
            menuNo: [null, Validators.maxLength(100)],
            btnNo: [null, Validators.maxLength(30)],
            startTime: [null, Validators.maxLength(20)],
            endTime: [null, Validators.maxLength(20)],
            commitStatus: [null, Validators.maxLength(5)],
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            auditResult: this.validateForm.controls.auditResult.value || '',
            menuNo: this.validateForm.controls.menuNo.value || '',
            btnNo: this.validateForm.controls.btnNo.value || '',
            startTime: this.date2String(this.validateForm.controls.startTime.value || ''),
            endTime: this.date2String(this.validateForm.controls.endTime.value || ''),
            commitStatus: this.validateForm.controls.commitStatus.value || '',
            userNo: this.session.getUserSession().account,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        const start = this.validateForm.controls.startTime.value;
        const end = this.validateForm.controls.endTime.value;
        if (!this.checkDate(start, end)) {
            this.loading = false;
            return;
        }
        // 获取当前页
        this.myApplyService.getMyApply(params).subscribe(data => {
            this.dataSet = data.data;
            console.log(data.data);
            if (data.page != null) {
                this.page.totalRow = data.page.totalRow;
            } else {
                this.page.totalRow = 0;
            }
            if (this.dataSet == null || this.dataSet.length == 0) {
                this.dataSet = [];
            } else {
                data.data.forEach(data1 => {
                    console.log(data1.catalogNo);
                    if (data1.commitStatus === '1') {
                        data1.commitStatus = '提交审核';
                    } else {
                        data1.commitStatus = '撤销';
                    }
                    if (data1.auditResult === 'Y') {
                        data1.auditResult = '通过';
                    } else if (data1.auditResult === 'N') {
                        data1.auditResult = '拒绝';
                    } else {
                        data1.auditResult = '未审核';
                    }
                });
            }
            this.loading = false;
            console.log(this.dataSet);
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    checkDate(start, end) {
        if (start != null && end != null) {
            if (start > end) {
                this.message.error('开始时间不能大于结束时间');
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    }

    search() {
        this.refreshData(true);
    }

    checkStatus(commitStatus, auditResult) {
        if (auditResult == '拒绝' && commitStatus == '提交审核') {
            return true;
        } else {
            return false;
        }
    }

    //重新填写
    reApply(item) {
        console.log(item);
        const obj = item.current;
        let width = '60%';
        let isMod = true;
        const btnName = item.btnName;
        const menuName = item.menuName;
        if (btnName === '删除') {
            if (menuName === '用户管理') {
                this.component = this.modMap.userDel;
                width = '60%';
            } else if (menuName === '设备管理') {
                this.component = this.modMap.devDel;
                width = '60%';
            }
        } else {
            if (btnName === '添加') {
                isMod = false;
            }
            if (menuName === '用户管理') {
                this.component = this.modMap.user;
                width = '60%';
            } else if (menuName === '设备管理') {
                this.component = this.modMap.dev;
                width = '80%';
            }
        }
        this.modal.open({
            title: '重新填写',
            maskClosable: false,
            footer: false,
            width: width,
            content: this.component,
            componentParams: {
                param: obj,
                isMod: isMod,
                checkAudit: true,
            },
            onOk: () => {
                this.changeCommitStatus(item.no);
            },
            onCancel: () => {
            },
        });
    }

    changeCommitStatus(no) {
        const params = {
            no: no
        };
        this.myApplyService.changeCommitStatus(params).subscribe(data => {
            this.refreshData(true);
        }, (error) => {
            this.loading = false;
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    showDetail(item, str) {
        console.log(this.dataSet);
        console.log('选择对象');
        console.log(item);
        let obj;
        const menuName = item.menuName;
        let beforeOrcurrent;
        let width = '60%';
        if (menuName === '用户管理') {
            this.component = this.viewMap.user;
            width = '60%';
            if (str === 'bef') {
                obj = item.before;
                beforeOrcurrent = 'before';
            } else {
                obj = item.current;
                beforeOrcurrent = 'current';
            }
        } else if (menuName === '设备管理') {
            this.component = this.viewMap.dev;
            width = '80%';
            if (str === 'bef') {
                obj = item.before;
                beforeOrcurrent = 'before';
            } else {
                obj = item.current;
                beforeOrcurrent = 'current';
            }
        }
        console.log('对象');
        console.log(obj);
        const modal = this.modal.open({
            title: '操作详情',
            maskClosable: false,
            footer: false,
            width: width,
            content: this.component,
            componentParams: {
                param: obj,
                beforeOrcurrent: beforeOrcurrent,
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },

        });
        console.log(item);
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

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.auditResult.setValue('');
        this.validateForm.controls.menuNo.setValue('');
        this.validateForm.controls.btnNo.setValue('');
        this.validateForm.controls.startTime.setValue('');
        this.validateForm.controls.endTime.setValue('');
        this.validateForm.controls.commitStatus.setValue('');
        this.refreshData(true);
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
