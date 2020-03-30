import {Component, OnInit} from '@angular/core';
import {RoleService} from '../role.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';
import {SysMenuService} from '../../menu/menu.service';

@Component({
    templateUrl: './role-access.html'
})
export class RoleAccessComponent implements OnInit {
    role;
    dataSet = [];
    loading = false;
    modules = [];
    menus = [];
    buttons = [];
    selectedMenus = [];
    selectedButtons = [];

    constructor(private service: RoleService,
                private menuService: SysMenuService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService) {
    }

    ngOnInit() {
        this.service.qryAccessById(this.role.no).subscribe(
            _data => {
                if (_data) {
                    console.log(_data.data);
                    this.modules = _data.data.modules;
                    this.menus = _data.data.menus;
                    this.buttons = _data.data.buttons;
                    this.selectedMenus = this.menus;
                    this.selectedButtons = this.buttons.map(x => x.button.no);
                    const tmp = _data.data.allAccesses;
                    tmp.forEach(x => x.menus.forEach(y => {
                        y.checked = this.menus.includes(y.menuNo);
                        if (y.buttons) {
                            y.buttons.forEach(k => {
                                const tmp1 = this.buttons.filter(j => j.button.no == k.btnNo);
                                k.checked = tmp1 && tmp1.length > 0;
                            });
                        }
                    }));
                    this.dataSet = tmp;
                    for (let j = 1; j < this.dataSet.length; j++) {
                        let flag = false;
                        const tmp2 = this.dataSet[j];
                        console.log(tmp2);
                        for (let i = 0; i < tmp2.menus.length; i++) {
                            const menu = tmp2.menus[i];
                            if (menu.checked) {
                                flag = true;
                            }
                        }
                        if (flag) {
                            tmp2.checked = true;
                        } else {
                            tmp2.checked = false;
                        }
                    }
                }
            }, _error => {
                console.log(_error);
                this.message.error('查询角色信息失败');
            }
        );
    }

// 全选菜单
    updateAllChecked(event, menus, moduleNo) {
        console.log(this.selectedMenus, this.selectedButtons);
        console.log(menus);
        if (event) {
            menus.forEach(x => {
                if (!this.selectedMenus.includes((x.menuNo))) {
                    this.selectedMenus.push(x.menuNo);
                }
                if (x.buttons) {
                    x.buttons.forEach(y => {
                        if (!this.selectedButtons.includes(y.btnNo)) {
                            this.selectedButtons.push(y.btnNo);
                        }
                    });
                }
            });
            if (!this.selectedMenus.includes(moduleNo)) {
                this.selectedMenus.push(moduleNo);
            }
            console.log(this.selectedMenus, this.selectedButtons);
        } else {
            menus.forEach(x => {
                if (this.selectedMenus.includes((x.menuNo))) {
                    this.selectedMenus.splice(this.selectedMenus.indexOf(x.menuNo), 1);
                }
                if (x.buttons) {
                    x.buttons.forEach(y => {
                        if (this.selectedButtons.indexOf(y.btnNo) >= 0) {
                            this.selectedButtons.splice(this.selectedButtons.indexOf(y.btnNo), 1);
                        }
                    });
                }
            });
            if (this.selectedMenus.includes(moduleNo)) {
                this.selectedMenus.splice(this.selectedMenus.indexOf(moduleNo), 1);
            }
        }
        menus.forEach(x => {
            x.checked = event;
            if (x.buttons) {
                x.buttons.forEach(y => y.checked = event);
            }
        });
        console.log(this.selectedMenus, this.selectedButtons);
    }

    /**
     * 勾选菜单
     * @param event
     * @param menuNo
     * @param buttons
     * @param moduleNo
     */
    selectMenu(event, menuNo, buttons, moduleNo) {
        console.log(event, menuNo, buttons, moduleNo);
        console.log(this.selectedMenus, this.selectedButtons);
        if (event) {
            if (!this.selectedMenus.includes(menuNo)) {
                this.selectedMenus.push(menuNo);
            }
            if (!this.selectedMenus.includes(moduleNo)) {
                this.selectedMenus.push(moduleNo);
            }
            if (buttons) {
                buttons.forEach(x => {
                    if (!this.selectedButtons.includes(x.btnNo)) {
                        this.selectedButtons.push(x.btnNo);
                    }
                });
            }
            console.log(this.selectedMenus, this.selectedButtons);
        } else {
            this.selectedMenus.splice(this.selectedMenus.indexOf(menuNo), 1);
            if (buttons) {
                buttons.forEach(x => {
                    if (this.selectedButtons.indexOf(x.btnNo) >= 0) {
                        this.selectedButtons.splice(this.selectedButtons.indexOf(x.btnNo), 1);
                    }
                });
            }
            console.log(this.selectedButtons);
        }
        let tmp = this.dataSet.filter(x => x.moduleNo == moduleNo);

        tmp = tmp[0].menus.filter(x => x.menuNo == menuNo);
        if (tmp[0].buttons) {
            tmp[0].buttons.forEach(x => x.checked = event);
        }
        tmp = this.dataSet.filter(x => x.moduleNo == moduleNo);
        let flag = false;
        for (let i = 0; i < tmp[0].menus.length; i++) {
            const menu = tmp[0].menus[i];
            if (menu.checked) {
                flag = true;
            }
        }
        if (flag) {
            tmp[0].checked = true;
        } else {
            tmp[0].checked = false;
            if (this.selectedMenus.includes(moduleNo)) {
                this.selectedMenus.splice(this.selectedMenus.indexOf(moduleNo), 1);
            }

        }
        console.log(this.selectedMenus, this.selectedButtons);
    }

    /**
     * 勾选按钮
     * @param event
     * @param btnNo
     * @param menuNo
     * @param moduleNo
     */
    selectButton(event, btnNo, menuNo, moduleNo) {
        console.log(this.selectedMenus, this.selectedButtons);
        if (event) {
            if (!this.selectedMenus.includes(menuNo)) {
                this.selectedMenus.push(menuNo);
            }
            if (!this.selectedButtons.includes(btnNo)) {
                this.selectedButtons.push(btnNo);
            }
            if (!this.selectedMenus.includes(moduleNo)) {
                this.selectedMenus.push(moduleNo);
            }
            this.dataSet.filter(x => x.moduleNo == moduleNo)[0].menus.filter(x => x.menuNo == menuNo)[0].checked = true;
            /* this.dataSet.filter(x => x.moduleNo == moduleNo).checked = true;*/
        } else {
            if (this.selectedButtons.includes(btnNo)) {
                this.selectedButtons.splice(this.selectedButtons.indexOf(btnNo), 1);
            }
        }
        let flag = false;
        let tmp = this.dataSet.filter(x => x.moduleNo == moduleNo);
        tmp = tmp[0].menus.filter(x => x.menuNo == menuNo);
        if (tmp[0].buttons) {
            for (let i = 0; i < tmp[0].buttons.length; i++) {
                const button = tmp[0].buttons[i];
                if (button.checked) {
                    flag = true;
                }
            }
        }
        if (flag) {
            this.dataSet.filter(x => x.moduleNo == moduleNo)[0].menus.filter(x => x.menuNo == menuNo)[0].checked = true;
        } else {
            this.dataSet.filter(x => x.moduleNo == moduleNo)[0].menus.filter(x => x.menuNo == menuNo)[0].checked = false;
            if (this.selectedMenus.includes(menuNo)) {
                this.selectedMenus.splice(this.selectedMenus.indexOf(menuNo), 1);
            }
        }
        tmp = this.dataSet.filter(x => x.moduleNo == moduleNo);
        let flag1 = false;
        for (let i = 0; i < tmp[0].menus.length; i++) {
            const menu = tmp[0].menus[i];
            if (menu.checked) {
                flag1 = true;
            }
        }
        if (flag1) {
            tmp[0].checked = true;
        } else {
            tmp[0].checked = false;
            if (this.selectedMenus.includes(moduleNo)) {
                this.selectedMenus.splice(this.selectedMenus.indexOf(moduleNo), 1);
            }
        }
        console.log(this.selectedMenus, this.selectedButtons);
    }

    _submit() {
        console.log('menus:', this.selectedMenus);
        console.log('buttons:', this.selectedButtons);
        // 添加菜单所属模块
        let tmp = [];
        this.selectedMenus.forEach(x => {
            const tmp1 = x.substring(0, 1);
            if (x.length > 1 && !this.selectedMenus.includes(tmp1) && !tmp.includes(tmp1)) {
                tmp.push(tmp1);
            }

        });
        tmp.forEach(x => this.selectedMenus.push(x));
        // 删除多余模块
        tmp = this.selectedMenus.filter(x => x.length == 1);
        tmp.forEach(x => {
            if (this.selectedMenus.filter(y => y.length > 1 && y.startsWith(x)).length == 0) {
                this.selectedMenus.splice(this.selectedMenus.indexOf(x), 1);
            }
        });
        this.loading = true;
        this.service.modAccess({roleNo: this.role.no, menus: this.selectedMenus, buttons: this.selectedButtons}).subscribe(
            _data => {
                this.loading = false;
                this.message.success('修改权限成功');
                this.nzModal.destroy('onOk');
            }, _error => {
                this.loading = false;
                console.log(_error);
                this.message.error(_error.body.retMsg);
            }
        );
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
