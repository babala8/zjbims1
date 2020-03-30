import {Component, OnInit} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzMessageService} from 'ng-zorro-antd';

@Component({
    selector: 'header-user-info',
    templateUrl: './user.component.html',
    styleUrls: ['./user.component.less']
})
export class HeaderUserInfoComponent implements OnInit {
    // session: Session;
    userName = '';

    constructor(private sessionService: SessionService,
                private session: SessionService,
                public msgSrv: NzMessageService) {
        // this.session = this.sessionService.getUserSession();
    }
    ngOnInit() {
        this.userName = this.session.getUserSession().name;
    }
}
