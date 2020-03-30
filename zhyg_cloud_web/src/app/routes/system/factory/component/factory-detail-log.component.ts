import {Component, OnInit} from '@angular/core';
import {FormControl} from '@angular/forms';
import {FactoryService} from '../factory.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './factory-detail-log.html'
})
export class FactoryDetailLogComponent implements OnInit {


    validateForm: FormGroup;
    factorys;
    org: Org;
    loading = false;
    devServiceManagerList = [];
    statusList = [
        {no: '1', name: '启用'},
        {no: '2', name: '未启用'}
    ];
    showFlag = 0;
    tmp;
    upper = '';
    i = 0;
    param;

    constructor(private fb: FormBuilder,
                private factoryService: FactoryService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
               ) {

    }
    ngOnInit(): void {
        // 初始化表单
        this.validateForm = this.fb.group({
            no: [null],
            name: [null],
            devServiceManager: [null],
            status: [null],
            phone: [null],
            mobile: [null],
            email: [null],
            leader: [null]
        });
        // 获取机构详细信息
        if (this.param !== null) {
            this.factorys = this.param;
        }
        this.factoryService.getDevServiceManagers({}).subscribe(
            data => {
                this.devServiceManagerList = data.data;
                this.loading = false;
                this.validateForm.controls.no.setValue(this.factorys.no);
                this.validateForm.controls.name.setValue(this.factorys.name);
                this.validateForm.controls.devServiceManager.setValue(this.factorys.belongToNo || '');
                this.validateForm.controls.status.setValue(this.factorys.status || '');
                this.validateForm.controls.phone.setValue(this.factorys.phone || '');
                this.validateForm.controls.mobile.setValue(this.factorys.mobile || '');
                this.validateForm.controls.email.setValue(this.factorys.email || '');
                this.validateForm.controls.leader.setValue(this.factorys.leader || '');
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );


    }
    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
