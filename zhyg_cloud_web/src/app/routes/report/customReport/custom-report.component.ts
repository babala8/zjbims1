import {Component, OnInit, TemplateRef, OnChanges, SimpleChanges} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {NzModalService} from 'ng-zorro-antd';
import {SessionService} from '@core/session.service';

@Component({
    selector: 'customReport',
    templateUrl: './custom-report.html',
})
export class CustomReportComponent implements OnInit, OnChanges {

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
