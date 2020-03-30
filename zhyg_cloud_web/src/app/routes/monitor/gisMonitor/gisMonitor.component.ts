import {Component, OnInit, TemplateRef, OnChanges, ViewChild, ElementRef} from '@angular/core';
import {GisMonitorService} from './gisMonitor.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {environment} from '@env/environment';


@Component({
    templateUrl: './gisMonitor.html',
    styles: [`
    :host{
        height: 100%;
    }
    `]
})
export class GisMonitorComponent implements OnInit {
    @ViewChild('gisMonitorIframe') gisMonitorIframe: ElementRef;
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
        private gisMonitorService: GisMonitorService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({

        });
        // this.vuelink = 'http://localhost:8080/#/map';
        this.vuelink = this.link + '/#/map';
        this.linkKey = 'gisMonitor-link';
    }
    getSonData(e) {
        console.log('address');
        if ( e.code === 'ok' ) {
        }
    }
    cancel() {

    }

}
