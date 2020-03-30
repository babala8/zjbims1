import {Component, OnInit} from '@angular/core';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Org} from '../../../../models/org';
import {HttpResponse} from '@angular/common/http';

@Component({
     templateUrl: './org-detail-log.html',
    // templateUrl: './iframe-Card.html',
})
export class OrgWorkTimeDetailLogComponent implements OnInit {

    formModel = {};
    orgs;
    loading = false;
    param;

    constructor(
        private orgService: OrgService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
                this.loading = false;
                this.formModel['no'] = this.param.no;
                this.formModel['name'] = this.param.name;
                this.formModel['upper'] = this.param.parentOrgName;
                this.formModel['orgType'] = this.param.orgType.type;
                this.formModel['address'] = this.param.address;
                this.formModel['linkman'] = this.param.linkman;
                this.formModel['telephone'] = this.param.telephone;
                this.formModel['workTime'] = this.param.workTime;
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
