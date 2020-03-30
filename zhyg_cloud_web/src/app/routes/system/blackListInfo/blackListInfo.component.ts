import {Component, OnInit, ElementRef, AfterViewInit, ViewChild} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
// 预约查询
@Component({
    templateUrl: './blackListInfo.html',
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class BlackListInfoComponent implements OnInit {
    @ViewChild('blackListIframe') blackListIframe: ElementRef;
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
        console.log('连接黑名单');
        this.vuelink = this.link + '/#/blackListInfo';
        this.userSession = {};
        this.linkKey = 'blacklist-link';
    }
    getSonData(e) {

    }

}
