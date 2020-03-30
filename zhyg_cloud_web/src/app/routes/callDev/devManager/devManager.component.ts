import {Component, OnInit, ElementRef,  AfterViewInit, ViewChild} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
//设备信息管理
@Component({
    templateUrl: './devManager.html',
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class DevManagerComponent implements OnInit {
    @ViewChild('devManageriframe') devManageriframe: ElementRef;
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
        this.vuelink = this.link + '/#/devManager';
        this.userSession = { userOrgNo: this.session.orgNo};
        this.linkKey = 'dev-link';
        // this.refreshData(true);
    }
    getSonData(e) {

    }

}
