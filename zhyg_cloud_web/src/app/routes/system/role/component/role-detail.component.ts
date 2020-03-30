import {Component, OnInit} from '@angular/core';
import {RoleService} from '../role.service';
import {NzModalSubject} from 'ng-zorro-antd';

@Component({
    templateUrl: './role-detail.html'
})
export class RoleDetailComponent implements OnInit {
    _isSpinning = true;
    role;
    formModel = {};
    menus = [];
    buttons = [];
    dataSet = [];

    constructor(private service: RoleService,
                private nzModal: NzModalSubject) {
    }

    ngOnInit() {
        this.formModel['orgType'] = this.role.orgTypeName;
        this.formModel['name'] = this.role.name;
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
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
