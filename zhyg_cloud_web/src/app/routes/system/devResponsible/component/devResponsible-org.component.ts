import {Component, OnInit} from '@angular/core';
import {DevResponsibleService} from '../devResponsible.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Org} from '../../../../models/org';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './devResponsible-org.html',
})
export class DevResponsibleOrgComponent implements OnInit {

    formModel = {};
    orgs;
    loading = false;

    constructor(
        private devResponsibleService: DevResponsibleService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {

        this.devResponsibleService.getOrg(this.orgs.orgNo).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.formModel['no'] = data.data.no;
                this.formModel['name'] = data.data.name;
                this.formModel['upper'] = data.data.parentOrgName;
                this.formModel['orgType'] = data.data.orgType.type;
                this.formModel['address'] = data.data.address;
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
