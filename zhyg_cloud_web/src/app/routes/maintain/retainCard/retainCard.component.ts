import {Component, OnInit, TemplateRef, OnChanges, ViewChild, ElementRef, OnDestroy, NgZone} from '@angular/core';
import {RetainCardService} from './retainCard.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {IframeLinkService} from '@shared/component/page-iframe/iframe.link.service';
import {Router, NavigationEnd} from '@angular/router';
import {environment} from '@env/environment';

@Component({
    templateUrl: './retainCard.html',
    styles: [`
    :host{
        height: 100%;
    }
    `]
})
export class RetainCardComponent implements OnInit {
    @ViewChild('retainCardIframe') retainCardIframe: ElementRef;
    private link = `${environment.VUE_EXTEND_LINK}`;
    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    page = new Page();
    vuelink: any;
    linkKey: any;
    userSession: any;
    userOrgNo: string;
    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private modal: NzModalService,
        private message: NzMessageService,
        private router: Router,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({

        });
        this.userOrgNo = this.session.getUserSession().orgNo;
        this.vuelink = this.link + '/#/';
        this.userSession = {userOrgNo: this.userOrgNo};
        this.linkKey = 'retainCard-link';
        // this.iframeService.postMes(this.vuelink, this.userOrgNo);
    }
    getSonData(e) {
        console.log('父元素收到子元素传来的值', e);
        if ( e.code === 'ok' ) {
            console.log(e.action);
        }

    }
    cancel() {

    }

}
