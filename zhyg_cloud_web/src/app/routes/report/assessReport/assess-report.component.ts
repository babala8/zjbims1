import {Component, OnInit, TemplateRef, OnChanges, SimpleChanges} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';

@Component({
    templateUrl: './assess-report.html'
})
export class AssessReportComponent implements OnInit, OnChanges {

    validateForm: FormGroup;

    showCase = '';


    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
    ) {
    }


    ngOnChanges(changes: SimpleChanges): void {
    }

    ngOnInit(): void {
    }

    switchTabs(Case): void {
        this.showCase = Case;
    }
}
