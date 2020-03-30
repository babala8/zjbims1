import {Component, OnInit} from '@angular/core';
import {CatalogService} from '../catalog.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './catalog-detail-log.html'
})
export class CatalogDetailLogComponent implements OnInit {


    validateForm: FormGroup;
    catalog;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;
    param;

    constructor(private fb: FormBuilder,
                private catalogService: CatalogService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.maxLength(5)]],
            name: [null, [Validators.required, Validators.maxLength(30)]],
        });


        this.loading = true;
        if (this.param !== null) {
            this.catalog = this.param;
        }
        this.validateForm.controls.no.setValue(this.catalog.no);
        this.validateForm.controls.name.setValue(this.catalog.enname);
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
