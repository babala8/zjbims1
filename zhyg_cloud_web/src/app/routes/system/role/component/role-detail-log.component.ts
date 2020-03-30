import {Component, OnInit} from '@angular/core';
import {RoleService} from '../role.service';
import {NzModalSubject} from 'ng-zorro-antd';
import {OrgService} from '../../org/org.service';

@Component({
    templateUrl: './role-detail-log.html'
})
export class RoleDetailLogComponent implements OnInit {
    _isSpinning = true;
    role;
    formModel = {};
    menus = [];
    buttons = [];
    dataSet = [];
    orgType;
    param;

    constructor(private service: RoleService,
                private orgService: OrgService,
                private nzModal: NzModalSubject) {
    }

    ngOnInit() {
        if (this.param !== null) {
            this.role = this.param;
        }
        if (this.param.orgType !== null) {
            this.orgService.getOrgType(this.param.orgType).subscribe(data => {
                this.orgType = data.data;
                console.log(this.orgType);
                this.formModel['orgType'] = this.orgType.type;
                if (this.role.roleName) {
                    this.formModel['name'] = this.role.roleName;
                }
                if (this.role.name) {
                    this.formModel['name'] = this.role.name;
                }
                this.formModel['note'] = this.role.note;
                this.service.qryAccessById(this.role.no).subscribe(
                    _data => {
                        if (_data) {
                            this.menus = _data.data.menus;
                            this.buttons = _data.data.buttons;
                            this.buttons = this.buttons.map(m => m.button.no);
                            let tmp = _data.data.allAccesses;
                            tmp = tmp.filter(x => {
                                x.menus = x.menus.filter(y => this.menus.includes(y.menuNo));
                                if (x.menus) {
                                    x.menus.forEach(k => {
                                        if (k.buttons) {
                                            k.buttons = k.buttons.filter(j => this.buttons.includes(j.btnNo));
                                        }
                                    });
                                }
                                return x.menus && x.menus.length > 0;
                            });
                            this.dataSet = tmp;
                        }
                        this._isSpinning = false;
                    }, _error => {
                        this._isSpinning = false;
                        console.log(_error);
                    }
                );
            });
        }

    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
