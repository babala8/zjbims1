import {Component, OnInit, TemplateRef} from '@angular/core';
import {UserService} from './user.service';
import {User} from '../../../models/user';
import {UserAddComponent} from './component/user-add.component';
import {UserDetailComponent} from './component/user-detail.component';
import {UserModifyComponent} from './component/user-modify.component';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {RoleService} from '../role/role.service';
import {SessionService} from '@core/session.service';
import {OrgService} from '../org/org.service';
import {HttpResponse} from '@angular/common/http';
import * as _ from 'lodash';
import {SysMenuService} from '../menu/menu.service';
import {UserDelComponent} from './component/user-del.component';
import {FormBuilder, FormGroup} from '@angular/forms';

@Component({
    templateUrl: './user.html'
})
export class UserComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    formModel = {};
    page = new Page();
    loading = false;
    nodes = [];
    roles = [];
    org: any;
    auditDel: Boolean;
    curOrg = {
        no: this.session.getUserSession().orgNo,
        name: this.session.getUserSession().orgName,
    };

    constructor(private userService: UserService,
                private fb: FormBuilder,
                private message: NzMessageService,
                private orgService: OrgService,
                private roleService: RoleService,
                private session: SessionService,
                private modal: NzModalService,
                private menuService: SysMenuService
    ) {
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        console.log(this.validateForm.controls);
        const params = {
            userName: this.validateForm.controls.userName.value || '',
            userNo: this.validateForm.controls.userNo.value || '',
            orgNo: this.validateForm.controls.org.value.no || '',
            roleNo: this.validateForm.controls.roleNo.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        this.userService.getUserByPage(params)
            .subscribe(data => {
                this.loading = false;
                console.log(data);
                if (data.data !== null) {
                    data.data.forEach(data1 => {
                        if (data1.devCatalog == 'all') {
                            data1.devCatalog = '全部设备';
                        }
                    });

                    this.dataSet = data.data;
                    if (data.page != null) {
                        this.page.totalRow = data.page.totalRow;
                        this.page.curRow = data.page.curRow;
                        this.page.totalPage = data.page.totalPage;
                    } else {
                        this.page.totalRow = 0;
                        this.page.curRow = 0;
                        this.page.totalPage = 0;
                    }
                    if (this.dataSet == null || this.dataSet.length == 0) {
                        this.dataSet = [];
                    }
                } else {
                    this.dataSet = [];
                }

            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    search() {
        this.refreshData(true);
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            userNo: [null],
            userName: [null],
            org: [{
                no: this.curOrg.no,
                name: this.curOrg.name
            }],
            roleNo: [null]
        });
        this.auditDel = this.menuService.checkAudit('用户管理', '删除');
        const param = {
            orgNo: this.curOrg.no
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            console.log('角色' + data);
            this.roles = data.data;
        });

        this.refreshData(true);

    }

    addUser(menuName, btnName) {
        const checkAudit = this.menuService.checkAudit(menuName, btnName);
        const modal = this.modal.open({
            title: '添加用户',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: UserAddComponent,
            componentParams: {
                checkAudit: checkAudit
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    openDetail(user) {
        const modal = this.modal.open({
            title: '用户详细信息',
            content: UserDetailComponent,
            maskClosable: false,
            width: '60%',
            componentParams: {
                user: user,
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    modifyUser(menuName, btnName, user) {
        const checkAudit = this.menuService.checkAudit(menuName, btnName);
        const modal = this.modal.open({
            title: '修改用户',
            maskClosable: false,
            footer: false,
            width:'60%',
            content: UserModifyComponent,
            componentParams: {
                user: user,
                checkAudit: checkAudit,
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    deleteUser(user) {
        if (user.no == this.session.account) {
            this.message.warning('用户不能删除自身信息');
            return;
        }
        this.userService.deleteUser(user.no).subscribe(r => {
            this.message.success(
                `用户${user.no}删除成功！`
            );
            this.refreshData(true);
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    deleteUserAudit(user) {
        console.log(user.no);
        if (user.no == this.session.account) {
            this.message.warning('用户不能删除自身信息');
            return;
        }
        const modal = this.modal.open({
            title: '删除用户',
            maskClosable: false,
            footer: false,
            content: UserDelComponent,
            componentParams: {
                checkAudit: this.auditDel,
                userNo: user.no,
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });

    }

    resetPassword(user: User) {
        console.log('reset password!');
        this.userService.getUser(user.no).subscribe(data => {
            const type = {type: 'reset'};
            const params = _.extend({
                no: user.no,
                passwd: 'abcd1234',
            });
            console.log(params);
            this.userService.resetPassword(params).subscribe(r => {
                this.message.success('用户密码已重置成功');
                this.refreshData(true);
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        });
    }

    unlock(user: User) {
        this.userService.unlock(user.no).subscribe(r => {
            this.message.success(`用户${user.name}已解锁`);
            this.refreshData(true);
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 重置
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({
            no: this.curOrg.no,
            name: this.curOrg.name
        } || {});
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
     *
     */
    selectRole(evt) {
        console.log(evt);
        /*const orgNo = evt.no;*/
        const param = {
            orgNo: evt.no
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            console.log('角色' + data);
            this.roles = data.data;
        });
    }

}
