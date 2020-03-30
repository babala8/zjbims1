import {Component, OnInit} from '@angular/core';
import {LogService} from './log.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {BulletinDetailLogComponent} from '../bulletin/component/bulletin-detail-log.component';
import {OrgDetailLogComponent} from '../org/component/org-detail-log.component';
import {UserDetailLogComponent} from '../user/component/user-detail-log.component';
import {DevDetailLogComponent} from '../dev/component/dev-detail-log.component';
import {OrgWorkTimeDetailLogComponent} from '../OrgWorkTime/component/org-detail-log.component';
import {RoleDetailLogComponent} from '../role/component/role-detail-log.component';
import {BankDetailLogComponent} from '../bank/component/bank-detail-log.component';
import {CatalogDetailLogComponent} from '../catalog/component/catalog-detail-log.component';
import {DevServiceManagerDetailLogComponent} from '../devServiceManager/component/devServiceManager-detail-log.component';
import {DevStopDetailLogComponent} from '../devstop/component/devStop-detail-log.component';
import {TypeDetailLogComponent} from '../type/component/type-detail-log.component';
import {VendorDetailLogComponent} from '../vendor/component/vendor-detail-log.component';
import {FactoryDetailLogComponent} from '../factory/component/factory-detail-log.component';
import {CaseCatalogDetailLogComponent} from '../sysParam/component/caseCatalog-detail-log.component';

@Component({
    templateUrl: './log.html',
})
export class LogComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    fullList = [];
    menuList = [];
    operateList = [];
    loading = true;
    page = new Page();
    /*存储组件变量*/
    component;
    /*日志操作详情 json对象和detail绑定*/
    logMap = {
        '机构管理': OrgDetailLogComponent,
        '用户管理': UserDetailLogComponent,
        '设备管理': DevDetailLogComponent,
        '公告管理': BulletinDetailLogComponent,
        '机构工作时段': OrgWorkTimeDetailLogComponent,
        '角色管理': RoleDetailLogComponent,
        '网点人员管理': BankDetailLogComponent,
        '设备类型管理': CatalogDetailLogComponent,
        '设备维护商管理': DevServiceManagerDetailLogComponent,
        '设备停机管理': DevStopDetailLogComponent,
        '设备型号管理': TypeDetailLogComponent,
        '设备品牌管理': VendorDetailLogComponent,
        '厂商维护商管理': FactoryDetailLogComponent,
        '故障响应设定': CaseCatalogDetailLogComponent,
    };

    constructor(private fb: FormBuilder,
                private logService: LogService,
                private session: SessionService,
                private message: NzMessageService,
                private modal: NzModalService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            userNo: [null],
            menu: [null],
            operate: [null],
            startTime: [null],
            endTime: [null],
        });
        this.logService.qryOperates().subscribe(_data => {
            if (_data && _data.data) {
                this.fullList = _data.data;
                for (const i of this.fullList) {
                    let flag = false;
                    for (const j of this.menuList) {
                        if (j.no == i.menuNo) {
                            flag = true;
                            break;
                        }
                    }
                    if (!flag) {
                        this.menuList.push({no: i.menuNo, name: i.menuName});
                    }
                }
            }
        });
        this.refreshData(true);
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
    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            userOrgNo: this.session.getUserSession().orgNo || '',
            userNo: this.validateForm.controls.userNo.value || '',
            menuNo: this.validateForm.controls.menu.value || '',
            btnName: this.validateForm.controls.operate.value || '',
            startTime: this.date2String(this.validateForm.controls.startTime.value) || '',
            endTime: this.date2String(this.validateForm.controls.endTime.value) || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        // console.log(params);
        // 获取当前页
        this.logService.qryLogs(params)
            .subscribe(_data => {
                console.log(_data.data);
                if (_data.data) {
                    this.dataSet = _data.data;
                    this.page.totalRow = _data.page.totalRow;
                }
                this.loading = false;
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {

    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    /**
     * 选择功能模块后才能选择操作
     * @param event
     */
    selectMenu(event) {
        if (event) {
            const tmp = this.fullList.filter(x => x.menuNo == event);
            this.operateList = tmp.map(x => x.btnName);
        }
    }

    reset() {
        this.validateForm.reset();
        this.operateList = [];
        this.refreshData(true);
    }

    private date2String(date): string {
        if (date instanceof Date) {
            const dateStr = date.toLocaleString();
            const tmp1 = dateStr.substring(0, dateStr.indexOf(' '));
            const index1 = tmp1.indexOf('/');
            const index2 = tmp1.indexOf('/', index1 + 1);
            const tmp2 = tmp1.substring(0, index1);
            let tmp3 = tmp1.substring(index1 + 1, index2);
            let tmp4 = tmp1.substring(index2 + 1);
            tmp3 = tmp3.length < 2 ? '0' + tmp3 : tmp3;
            tmp4 = tmp4.length < 2 ? '0' + tmp4 : tmp4;
            return tmp2 + '-' + tmp3 + '-' + tmp4 + ' 00:00:00';
        }
        return '';
    }

    openDetail(param, menuName) {
        let width = '60%';
        this.selectComponent(menuName);
        if (menuName == '设备管理') {
            width = '80%';
        } else {
            width = '60%';
        }
        console.log(param);
        const modal = this.modal.open({
            title: '操作详情',
            maskClosable: false,
            footer: false,
            width: width,
            content: this.component,
            componentParams: {
                param: param,
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },

        });
    }

    selectComponent(menuName) {
        if ('用户管理' == menuName) {
            this.component = this.logMap.用户管理;
        } else if ('机构管理' == menuName) {
            this.component = this.logMap.机构管理;
        } else if ('设备管理' == menuName) {
            this.component = this.logMap.设备管理;
        } else if ('公告管理' == menuName) {
            this.component = this.logMap.公告管理;
        } else if ('机构工作时段' == menuName) {
            this.component = this.logMap.机构工作时段;
        } else if ('角色管理' == menuName) {
            this.component = this.logMap.角色管理;
        } else if ('网点人员管理' == menuName) {
            this.component = this.logMap.网点人员管理;
        } else if ('设备类型管理' == menuName) {
            this.component = this.logMap.设备类型管理;
        } else if ('设备维护商管理' == menuName) {
            this.component = this.logMap.设备维护商管理;
        } else if ('设备停机管理' == menuName) {
            this.component = this.logMap.设备停机管理;
        } else if ('设备型号管理' == menuName) {
            this.component = this.logMap.设备型号管理;
        } else if ('设备品牌管理' == menuName) {
            this.component = this.logMap.设备品牌管理;
        } else if ('厂商维护商管理' == menuName) {
            this.component = this.logMap.厂商维护商管理;
        } else if ('故障响应设定' == menuName) {
            this.component = this.logMap.故障响应设定;
        }
    }
}
