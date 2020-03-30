import {Component, OnInit} from '@angular/core';
import {OrgService} from '../org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';

@Component({
    templateUrl: './org-detail.html',
})
export class OrgDetailComponent implements OnInit {

    formModel = {};
    org;
    loading = false;
    param;

    constructor(
        private orgService: OrgService,
        private nzModal: NzModalSubject,
    ) {
    }

    ngOnInit() {
        if (this.param != null) {
            this.org = this.param;
        }
        console.log(this.org);
        this.formModel['no'] = this.org.no;
        this.formModel['name'] = this.org.name;
        this.formModel['upper'] = this.org.parentOrgName;
        this.formModel['orgType'] = this.org.orgTypeName;
        this.formModel['address'] = this.org.address;
        this.formModel['x'] = this.org.x;
        this.formModel['y'] = this.org.y;
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
