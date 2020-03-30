import {Component, OnInit, ElementRef,  AfterViewInit, ViewChild} from '@angular/core';
import {SessionService} from '@core/session.service';
import {NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
// 总行业务配置
@Component({
    templateUrl: './businessConfig.html',
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class BusinessConfigComponent implements OnInit {
    @ViewChild('businessConfigiframe') businessConfigiframe: ElementRef;
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
        this.vuelink = this.link +  '/#/functionConfig';
        this.userSession = {userOrgNo: this.session.orgNo};
        this.linkKey = 'busConfig-link';
    }
    getSonData(e) {

    }

}
