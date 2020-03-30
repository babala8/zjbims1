import {Component, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {BenchmarkComponent} from '../benchmark.components';
import {BenchmarkService} from '../benchmark.service';
import {Page} from '../../../../models/page';

@Component({
    selector: 'benchmark-details',
    templateUrl: './benchmark-Details.html'
})
export class BenchmarkDetailsComponent implements OnInit {

    page = new Page();
    orgs: { no: string, name: string }[] = [];
    modelInfo: { name: string, type: string, desc: string, modelType: string, orgName: string }
        = {name: '', type: '', desc: '', modelType: '', orgName: ''};
    modelType = this.benchmarkService.getModelType();

    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private benchmarkService: BenchmarkService,
        public benchmarkComponent: BenchmarkComponent,
        private message: NzMessageService,
    ) {
    }

    /**
     * 初始化表单
     */
     ngOnInit() {
         this.qryModelById();
         this.qryDeployVersion();
    }

    qryModelById() {
        // const modelNo = this.route.snapshot.paramMap.get('no');
        const modelNo = this.benchmarkComponent.editModel.logicId;
        const param = {
            modelId: modelNo
        };
        this.benchmarkService.qryModelById(param).subscribe(info => {
            this.modelInfo.name = info.data.modelName + '(' + info.data.orgName + ')';
            this.modelInfo.modelType = info.data.modelType;
            for (let i = 0; i < this.modelType.length; i++) {
                if (this.modelType[i].no == this.modelInfo.modelType) {
                    this.modelInfo.type = this.modelType[i].name;
                    break;
                }
            }
            this.modelInfo.desc = info.data.description;
        });
    }

    qryDeployVersion() {
        // const modelNo = this.route.snapshot.paramMap.get('no');
        const modelNo = this.benchmarkComponent.editModel.logicId;
        const modelType = this.benchmarkComponent.editModel.modelType;
        const param = {
            modelId: modelNo
        };
        this.benchmarkComponent.upperVersion = [];
        // 基础标杆，还要查出上级机构下的基础标杆内的app
        if ('1' == modelType) {
            this.benchmarkService.qryModelApps(param)
                .subscribe(_data => {
                    if (_data.data) {
                        _data.data.forEach(data1 => {
                            this.benchmarkComponent.upperVersion.push({
                                appsId: data1.appsId,
                                versionNo: data1.versionNo,
                                appsName: data1.appsName,
                                modelName: data1.modelName,
                                versionBusNo: data1.versionBusNo,
                                description: data1.description,
                                selected: true,
                                versionInfo: data1.versionBusNo + '|' + data1.versionNo + '|' + data1.description
                            });
                        });
                    }
                }, (error) => {
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
        }
    }

    backModel() {
        this.benchmarkComponent.flag = true;
    }


}

