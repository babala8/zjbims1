import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {OrgService} from '../org/org.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {MyAuditService} from './myAudit.service';
import {SysMenuService} from '../menu/menu.service';
import {UserDetailLogComponent} from '../user/component/user-detail-log.component';
import {DevDetailLogComponent} from '../dev/component/dev-detail-log.component';
import {UserService} from '../user/user.service';
import {DevService} from '../dev/dev.service';


@Component({
    templateUrl: './myAudit.html',
})
export class MyAuditComponent implements OnInit, OnChanges {

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
    // 查看详情对应的组件
    viewMap = {
        'dev': DevDetailLogComponent,
        'user': UserDetailLogComponent,
    };

    constructor(
        private fb: FormBuilder,
        private orgService: OrgService,
        private modal: NzModalService,
        private session: SessionService,
        private menuService: SysMenuService,
        private message: NzMessageService,
        private myAuditService: MyAuditService,
        private userService: UserService,
        private  devService: DevService,
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

    ngOnChanges() {

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
            orgNo: this.session.getUserSession().orgNo,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        // 获取当前页
        this.myAuditService.getMyAudit(params).subscribe(data => {
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
                    if (data1.commitStatus === '1') {
                        data1.commitStatus = '提交审核';
                    } else {
                        data1.commitStatus = '已撤销';
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
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    search() {
        this.refreshData(true);
    }


    checkAudit(auditResult) {
        if (auditResult === '未审核') {
            return true;
        } else {
            return false;
        }
    }

    showDetail(item, str) {
        let obj;
        let width = '60%';
        const menuName = item.menuName;
        if (menuName === '用户管理') {
            this.component = this.viewMap.user;
            width = '60%';
            if (str === 'bef') {
                obj = item.before;
            } else {
                obj = item.current;
            }
        } else if (menuName === '设备管理') {
            this.component = this.viewMap.dev;
            width = '80%';
            if (str === 'bef') {
                obj = item.before;
            } else {
                obj = item.current;
            }
        }
        const modal = this.modal.open({
            title: '操作详情',
            maskClosable: false,
            footer: false,
            width: width,
            content: this.component,
            componentParams: {
                param: obj,
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },

        });
        console.log(item);
    }


    // 同意申请
    agree(item) {
        if (item.menuName == '用户管理') {
            if (item.btnNo == 'add') {
                this.userService.addUser(item.current, {}).subscribe(_data => {
                    const params = {
                        no: item.no,
                        flag: 'Y',
                        userNo: this.session.account
                    };
                    this.myAuditService.changeAuditStatus(params).subscribe(data => {
                        this.message.success(`审核通过！`);
                        this.refreshData(true);
                    }, (error) => {
                        this.loading = false;
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    });
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            }
            if (item.btnNo == 'mod') {
                this.userService.updateUser(item.before, item.current, {}).subscribe(_data => {
                    const params = {
                        no: item.no,
                        flag: 'Y',
                        userNo: this.session.account
                    };
                    this.myAuditService.changeAuditStatus(params).subscribe(data => {
                        this.message.success(`审核通过！`);
                        this.refreshData(true);
                    }, (error) => {
                        this.loading = false;
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    });
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            }
            if (item.btnNo == 'del') {
                this.userService.deleteUserAudit(item.current, {}).subscribe(_data => {
                    const params = {
                        no: item.no,
                        flag: 'Y',
                        userNo: this.session.account
                    };
                    this.myAuditService.changeAuditStatus(params).subscribe(data => {
                        this.message.success(`审核通过！`);
                        this.refreshData(true);
                    }, (error) => {
                        this.loading = false;
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    });
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            }
        }
        if (item.menuName == '设备管理') {
            if (item.btnNo == 'add') {
                this.devService.addDev(item.current, {}).subscribe(_data => {
                    const params = {
                        no: item.no,
                        flag: 'Y',
                        userNo: this.session.account
                    };
                    this.myAuditService.changeAuditStatus(params).subscribe(data => {
                        this.message.success(`审核通过！`);
                        this.refreshData(true);
                    }, (error) => {
                        this.loading = false;
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    });
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            }
            if (item.btnNo == 'mod') {
                this.devService.modDev(item.before, item.current, {}).subscribe(_data => {
                    const params = {
                        no: item.no,
                        flag: 'Y',
                        userNo: this.session.account
                    };
                    this.myAuditService.changeAuditStatus(params).subscribe(data => {
                        this.message.success(`审核通过！`);
                        this.refreshData(true);
                    }, (error) => {
                        this.loading = false;
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    });
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            }
            if (item.btnNo == 'del') {
                this.devService.delDevAudit({no: item.current}, {}).subscribe(_data => {
                    const params = {
                        no: item.no,
                        flag: 'Y',
                        userNo: this.session.account
                    };
                    this.myAuditService.changeAuditStatus(params).subscribe(data => {
                        this.message.success(`审核通过！`);
                        this.refreshData(true);
                    }, (error) => {
                        this.loading = false;
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    });
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            }
        }

    }

    // 拒绝申请
    refuse(item) {
        const params = {
            no: item.no,
            flag: 'N',
            userNo: this.session.account
        };
        this.myAuditService.changeAuditStatus(params).subscribe(data => {
            this.message.success(`审核拒绝！`);
            this.refreshData(true);
        }, (error) => {
            this.loading = false;
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });

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
