import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {BusinessAnalysisService} from './businessAnalysis.service';
import {NzMessageService} from 'ng-zorro-antd';

@Component({
    templateUrl: './businessAnalysis.html',
})
export class BusinessAnalysisComponent implements OnInit {

    dataSet = [];

    constructor(
        private service: BusinessAnalysisService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.refreshData();
    }

    refreshData() {
        this.service.getTransCostTime().subscribe(
            data => {
                if (data.data) {
                    this.dataSet = data.data;
                }
            }, error => {
                this.message.error(error.body.retMsg);
            }
        );
    }

    cancel() {

    }


}
