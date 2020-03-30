import {Component, OnInit, TemplateRef, OnChanges, ViewChild, ElementRef} from '@angular/core';
import {ReconcileService} from './reconcile.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';



@Component({
    templateUrl: './reconcile.html',
    styles: [`
    :host{
        height: 100%;
    }
    `]
})
export class ReconcileComponent implements OnInit {
    @ViewChild('reconcileIframe') reconcileIframe: ElementRef;
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
        private reconcileService: ReconcileService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            errorCode: [null, [Validators.required]],
            belongCwdOrDet: [null, [Validators.required]],
            checkinfoHostSucc: [null, [Validators.required]],
            checkinfoHostFail: [null, [Validators.required]],
            isreconciliation: [null, [Validators.required]],

        });
        this.vuelink = 'http://localhost:8080/#/reconcile';
        this.userSession = {token: 'asdfdsfeewhiuffaikjf'};
        this.linkKey = 'reconcile-link';
    }
    getReconcileData(e) {
        console.log('address');
        if ( e.code === 'ok' ) {
        }
    }
    cancel() {

    }

}
