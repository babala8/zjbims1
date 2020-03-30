import {Component, OnInit} from '@angular/core';
import {FormGroup} from '@angular/forms';
import {Page} from '../../../models/page';
import {ModCatalogService} from './modCatalog.service';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService} from 'ng-zorro-antd';

@Component({
    templateUrl: './modCatalog.html',
})

export class ModCatalogComponent implements OnInit {
    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    loading = true;
    page = new Page(30);

    constructor(
        private modCatalogService: ModCatalogService,
        private service: ModCatalogService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        this.loading = true;
        this.service.getModCatalogs(params)
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.dataSet = [];
                    this.page.totalRow = 0;
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

}
