import {Component, OnInit} from '@angular/core';
import {OrgService} from '../org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';


@Component({
    templateUrl: './org-detail-log.html',
})
export class OrgDetailLogComponent implements OnInit {

    formModel = {};
    org;
    loading = false;
    param;
    parentOrg;
    orgType;
    orgNo;

    constructor(
        private orgService: OrgService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        if (this.orgNo != null) {
            this.orgService.getOrg(this.orgNo).subscribe(data => {
                this.org = data.data;
                this.formModel['upper'] = this.org.parentOrgName;
                this.formModel['orgType'] = this.org.orgType.type;
                this.setData();
            });
        }
        if (this.param != null && this.param != '') {
            this.org = this.param;
            if (this.org.parentOrgNo !== null && this.org.parentOrgNo !== '') {
                this.orgService.getOrg(this.org.parentOrgNo).subscribe(data => {
                    this.parentOrg = data.data;
                    if (this.org.orgTypeNo === null) {
                        this.org.orgTypeNo = this.org.orgType.no;
                    }
                    if (this.org.orgTypeNo !== null) {
                        this.orgService.getOrgType(this.org.orgTypeNo).subscribe(data1 => {
                            this.orgType = data1.data;
                            console.log(this.orgType);
                            this.formModel['upper'] = this.parentOrg.name;
                            this.formModel['orgType'] = this.orgType.type;
                            this.setData();

                        });
                    }

                });
            } else {
                this.formModel['upper'] = '';
                this.formModel['orgType'] = '总行';
                this.setData();
            }
        }
    }

    setData() {
        this.formModel['no'] = this.org.no;
        this.formModel['name'] = this.org.name;
        this.formModel['address'] = this.org.address;
        this.formModel['x'] = this.org.x;
        this.formModel['y'] = this.org.y;
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
