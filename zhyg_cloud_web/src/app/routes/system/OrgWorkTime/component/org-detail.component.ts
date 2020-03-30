import {Component, OnInit} from '@angular/core';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Org} from '../../../../models/org';
import {HttpResponse} from '@angular/common/http';

@Component({
     templateUrl: './org-detail.html',
    // templateUrl: './iframe-Card.html',
})
export class OrgDetailComponent implements OnInit {

    formModel = {};
    orgs;
    loading = false;

    constructor(
        private orgService: OrgService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {

        this.orgService.getOrg(this.orgs.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.formModel['no'] = data.data.no;
                this.formModel['name'] = data.data.name;
                this.formModel['upper'] = data.data.parentOrgName;
                this.formModel['orgType'] = data.data.orgType.type;
                this.formModel['address'] = data.data.address;
                this.formModel['linkman'] = data.data.linkman;
                this.formModel['telephone'] = data.data.telephone;
                this.formModel['workTime'] = data.data.workTime;
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
