import {Component, OnInit} from '@angular/core';
import {BulletinService} from '../bulletin.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';

@Component({
    templateUrl: './bulletin-detail-log.html',
})
export class BulletinDetailLogComponent implements OnInit {

    formModel = {};
    bulletin;
    loading = false;
    param;

    constructor(
        private bulletinService: BulletinService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
                this.loading = false;

                this.formModel['publisher'] = this.param.publisher;
                this.formModel['bulletinId'] = this.param.bulletinId;
                this.formModel['releaseDate'] = this.param.releaseDate;
                this.formModel['expireDate'] = this.param.expireDate;
                this.formModel['title'] = this.param.title;
                this.formModel['content'] = this.param.content;

    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
