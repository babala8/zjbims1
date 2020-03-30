import {Component, OnInit, ElementRef, AfterViewInit, ViewChild} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
//回单卡领入功能
@Component({
    templateUrl: './associatedAccount.html',
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class AssociatedAccountComponent implements OnInit {
    @ViewChild('associatedAccountIframe') associatedAccountIframe: ElementRef;
    vuelink: any;
    linkKey: any;
    userSession: any;
    private link = `${environment.VUE_EXTEND_LINK}`;

    constructor(
        private session: SessionService,
        private modal: NzModalService,
    ) {
    }

    ngOnInit() {
        console.log('连接回单卡绑定账户');
        this.vuelink = this.link + '/#/associated';
        this.userSession = {
            userOrgNo: this.session.orgNo,
            orgName : this.session.getUserSession().orgName,
            userName : this.session.getUserSession().name,
        };
        this.linkKey = 'associated-link';
    }

    getSonData(e) {

    }

}
