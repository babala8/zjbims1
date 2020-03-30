import {Component, OnInit} from '@angular/core';
import {RoleService} from './role.service';
import {Page} from '../../../models/page';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {RoleAddComponent} from './component/role-add.component';
import {RoleModifyComponent} from './component/role-modify.component';
import {RoleDetailComponent} from './component/role-detail.component';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {OrgService} from '../org/org.service';
import {SysMenuService} from '../menu/menu.service';
import {RoleAccessComponent} from './component/role-access.component';

@Component({
    templateUrl: './role.html',

})
export class RoleComponent implements OnInit {

    formModel = {};
    dataSet = [];
    loading = false;
    page = new Page();
    orgGrades = [];

    constructor(private roleService: RoleService,
                private orgService: OrgService,
                private session: SessionService,
                private message: NzMessageService,
                private menuService: SysMenuService,
                private modal: NzModalService) {
    }

    ngOnInit() {
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;

        // TODO:  合并 this.page 与 this.formModel对象

        const orgNo = this.session.orgNo;
        this.orgService.getOrgTypesByOrgNo(orgNo)
            .subscribe(_data => {
            this.orgGrades = _data.data;
            console.log(this.orgGrades);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });

        console.log('......................>' + this.page.curPage);
        const params = {
            orgTypeNo: this.formModel['orgTypeNo'] || '',
            userOrgNo: this.session.getUserSession().orgNo,
            roleName: this.formModel['roleName'] || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize || '20',
            curRow: this.page.curRow || '',
            totalPage: this.page.totalPage || '',
            totalRow: this.page.totalRow || '',
        };
        console.log('查询角色--' + params);
        console.log(params);
        this.roleService.qryRolesByPages(params)
            .subscribe(_data => {
                console.log('查询角色' + _data);
                this.dataSet = _data.data;
                if (_data.page != null) {
                    this.page.totalRow = _data.page.totalRow;
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
        console.log(this.formModel);
    }

    delRole(item) {
        if (item == '10001') {
            this.message.warning('系统角色，不可操作');
            return;
        }
        this.loading = true;
        this.roleService.delRole(item).subscribe(_data => {
                this.loading = false;
                this.message.success('删除成功');
                this.refreshData(true);
            }, (error) => {
                console.log(error);
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    modRole(role) {
        console.log(role);
        if (this.checkRole(role)) {
            this.message.warning('系统角色不可操作');
            return;
        }
        const modal = this.modal.open({
            title: '修改角色',
            maskClosable: false,
            footer: false,
            content: RoleModifyComponent,
            componentParams: {
                role: role,
                grades: this.orgGrades
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modAccess(role) {
        if (this.checkRole(role)) {
            this.message.warning('系统角色，不可操作');
            return;
        }
        const modal = this.modal.open({
            title: '修改权限',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: RoleAccessComponent,
            componentParams: {
                role: role
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    addRole() {
        const modal = this.modal.open({
            title: '添加角色',
            maskClosable: false,
            footer: false,
            content: RoleAddComponent,
            componentParams: {
                grades: this.orgGrades
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    showDetail(role) {
        const modal = this.modal.open({
            title: '角色详情',
            footer: false,
            maskClosable: false,
            content: RoleDetailComponent,
            componentParams: {
                role: role
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    /**
     * 重置查询条件
     *
     */
    reset() {
        this.formModel = {};
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

    /**
     * 校验角色，系统管理员不可操作
     */
    checkRole(role): boolean {
        return role.no == '10001' ;
    }

}
