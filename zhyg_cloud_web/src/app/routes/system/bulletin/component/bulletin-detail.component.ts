import {Component, OnInit} from '@angular/core';
import {BulletinService} from '../bulletin.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Org} from '../../../../models/org';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './bulletin-detail.html',
})
export class BulletinDetailComponent implements OnInit {

    formModel = {};
    bulletin;
    loading = false;

    constructor(
        private bulletinService: BulletinService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {

        this.bulletinService.getBulletin(this.bulletin.bulletinId).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.formModel['publisher'] = data.data.publisher;
                this.formModel['bulletinId'] = data.data.bulletinId;
                this.formModel['releaseDate'] = data.data.releaseDate;
                this.formModel['expireDate'] = data.data.expireDate;
                this.formModel['title'] = data.data.title;
                this.formModel['content'] = data.data.content;
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
