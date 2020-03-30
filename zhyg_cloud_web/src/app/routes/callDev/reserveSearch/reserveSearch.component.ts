import {Component, OnInit, ElementRef, AfterViewInit, ViewChild} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
//预约查询
@Component({
    templateUrl: './reserveSearch.html',
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class ReserveSearchComponent implements OnInit {
    @ViewChild('reseveSearchiframe') reseveSearchiframe: ElementRef;
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
        this.vuelink = this.link + '/#/reserve';
        this.userSession = { userOrgNo: this.session.orgNo};
        this.linkKey = 'reserve-link';
        // this.refreshData(true);
    }

    getSonData(e) {

    }

}
