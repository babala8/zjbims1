import {Component, OnInit} from '@angular/core';
import {UserService} from '../user.service';
import {OrgService} from '../../org/org.service';
import {RoleService} from '../../role/role.service';
import {ActivatedRoute} from '@angular/router';
import {NzModalSubject} from 'ng-zorro-antd';

@Component({
    selector: 'user-detail',
    templateUrl: './user-detail-log.html',
})
export class UserDetailLogComponent implements OnInit {

    param;
    user;
    org;
    role;
    formModel = {};
    roleName;


    constructor(private userService: UserService,
                private route: ActivatedRoute,
                private nzModal: NzModalSubject,
                private orgService: OrgService,
                private roleService: RoleService) {
    }

    ngOnInit(): void {
        if (this.param !== null) {
            if (this.param.orgNo === null) {
                this.param.orgNo = this.param.org.no;
                this.param.roleNo = this.param.role.no;
            }
            if (this.param.devCatalog === 'all') {
                this.formModel['devCatalog'] = '全部设备';
            } else {
                this.formModel['devCatalog'] = this.param.devCatalog;
            }
            if (this.param.orgNo !== null) {
                this.orgService.getOrg(this.param.orgNo).subscribe(data => {
                    this.org = data.data;
                    this.formModel['org'] = this.org.name;
                });
            }
            let roleName = '';
            const roleNos = this.param.roleNo.split('|');
            console.log(roleNos);
            if (roleNos.length > 0) {
                for (let i = 0; i < roleNos.length; i++) {
                    this.roleService.qryRoleByNo(roleNos[i]).subscribe(data1 => {
                        this.role = data1.data;
                        console.log(this.role);
                        roleName = roleName + this.role.name + ' ';
                        console.log(roleName);
                        this.roleName = roleName;
                    });
                }
                this.formModel['no'] = this.param.no;
                this.formModel['name'] = this.param.name;
                this.formModel['phone'] = this.param.phone;
                this.formModel['mobile'] = this.param.mobile;
                this.formModel['email'] = this.param.email;
            }
        }

    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }


}

