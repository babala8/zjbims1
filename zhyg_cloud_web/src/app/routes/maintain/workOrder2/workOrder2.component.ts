import {Component, OnInit, TemplateRef, OnChanges, ViewChild, ElementRef} from '@angular/core';
import {WorkOrder2Service} from './workOrder2.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {environment} from '@env/environment';


@Component({
    templateUrl: './workOrder2.html',
    styles: [`
        :host{
            height: 100%;
        }
    `]
})
export class WorkOrder2Component implements OnInit {
    @ViewChild('workOrder2Iframe') workOrder2Iframe: ElementRef;
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
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({

        });
        this.vuelink = this.link + '/#/workOrder2';
        this.userSession = {userOrgNo: this.session.getUserSession().orgNo};
        this.linkKey = 'workOrder2-link';
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
