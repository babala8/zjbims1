import {Component, OnInit} from '@angular/core';
import {User} from '../../../../models/user';
import {UserService} from '../user.service';
import {OrgService} from '../../org/org.service';
import {RoleService} from '../../role/role.service';
import {ActivatedRoute} from '@angular/router';
import {NzModalSubject} from 'ng-zorro-antd';

@Component({
    selector: 'user-detail',
    templateUrl: './user-detail.html',
})
export class UserDetailComponent implements OnInit {

    // 审批查看页面传递的数据
    param;
    user;
    org;
    role;
    userret;
    userInfo: User;
    nodes = [];
    roles;
    formModel = {};


    constructor(private userService: UserService,
                private nzModal: NzModalSubject,
                private orgService: OrgService,
                private roleService: RoleService) {
    }

    ngOnInit(): void {
        if (this.param != null ) {
            console.log(this.param);
            if (this.param.orgNo != null) {
                this.orgService.getOrg(this.param.orgNo).subscribe(data => {
                    this.org = data.data;
                    console.log(this.org);
                    this.formModel['org'] = this.org.name;
                });
            }
            if (this.param.roleNo != null) {
                this.roleService.qryRoleByNo(this.param.roleNo).subscribe(data => {
                    this.role = data.data;
                    console.log(this.role);
                    this.formModel['roleNo'] = this.role.name;
                    this.formModel['no'] = this.param.no;
                    this.formModel['name'] = this.param.name;
                    this.formModel['devCatalog'] = this.userInfo.devCatalog;
                    this.formModel['phone'] = this.param.phone;
                    this.formModel['mobile'] = this.param.mobile;
                    this.formModel['email'] = this.param.email;
                });
            }


        } else {
            console.log(this.user.no);
            this.userService.getUser(this.user.no).subscribe(data => {
                this.userInfo = data.data;
                console.log('bbbbbbbbbbbbbbbbbbbbbbbbbb');
                console.log(this.userInfo);
                if (this.userInfo.devCatalog == 'all') {
                    this.userInfo.devCatalog = '全部设备';
                }
                this.formModel['no'] = this.userInfo.no;
                this.formModel['name'] = this.userInfo.name;
                this.formModel['org'] = this.user.orgName;
                this.formModel['roleNo'] = this.user.roleName;
                this.formModel['devCatalog'] = this.userInfo.devCatalog;
                this.formModel['phone'] = this.userInfo.phone;
                this.formModel['mobile'] = this.userInfo.mobile;
                this.formModel['email'] = this.userInfo.email;
            });
        }
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }


}

