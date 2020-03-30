import {Component, OnInit, TemplateRef, OnChanges, ViewChild, ElementRef} from '@angular/core';
import {CashForcastService} from './cashForcast.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';



@Component({
    templateUrl: './cashForcast.html',
    styles: [`
    :host{
        height: 100%;
    }
    `]
})
export class CashForcastComponent implements OnInit {
    @ViewChild('cashForcastIframe') cashForcastIframe: ElementRef;
    e= {
        devNo: '',
    };
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
        private cashForcastService: CashForcastService,
        private modal: NzModalService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, [Validators.required]],
        });
        this.vuelink = 'http://localhost:8080/#/cashForcast';
        this.userSession = {token: 'asdfdsfeewhiuffaikjf'};
        this.linkKey = 'cashForcast-link';
    }
    getCashData(e) {
        this.e = e;
        console.log('address');
        if ( e.code === 'ok' ) {
        }
    }
    cancel() {

    }

}
