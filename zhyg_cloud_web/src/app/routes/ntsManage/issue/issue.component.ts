import {Component, OnInit, TemplateRef, OnChanges, ViewChild, ElementRef} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {environment} from '@env/environment';



@Component({
    templateUrl: './issue.html',
    styles: [`
        :host{
            height: 100%;
        }
    `]
})
export class IssueComponent implements OnInit {
    @ViewChild('issueIframe') issueIframe: ElementRef;
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

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({

        });
        // this.vuelink = 'http://localhost:8080/#/nts/issue';
        this.vuelink = this.link + '/#/nts/issue';
        this.userSession = {
            userOrgNo: this.session.getUserSession().orgNo,
        };
        this.linkKey = 'issue-link';
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
