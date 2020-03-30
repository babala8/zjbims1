import {Component, OnInit, ElementRef, AfterViewInit, ViewChild} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
//叫号机业务配置
@Component({
    templateUrl: './business.html',
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class BusinessComponent implements OnInit {
    @ViewChild('businessiframe') businessiframe: ElementRef;
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
        this.vuelink = this.link + '/#/business';
        this.userSession = {userOrgNo: this.session.orgNo};
        this.linkKey = 'bus-link';
    }

    getSonData(e) {

    }

}
