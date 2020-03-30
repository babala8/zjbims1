import {Component, OnChanges, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import {NzMessageService, NzModalService } from 'ng-zorro-antd';
import {SessionService} from '../../../../core/session.service';
import {HttpResponse} from '@angular/common/http';
import {BaseReportService} from '../../baseReport/base-report.service';
import {TransReportService} from '../trans-report.service';
import {start} from 'repl';

@Component({
    selector: 'atmCashInfo-factor',
    templateUrl: 'atm-cash-info.html'
})
export class AtmCashInfoComponent implements OnInit, OnChanges {


    validateForm: FormGroup;

    orgNo = '';
    orgNames = '';
    startTime= '';
    endTime= '';
    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private session: SessionService,
        private workReport: BaseReportService,
        private message: NzMessageService,
        private transreport: TransReportService,

    ) {
    }


    ngOnChanges(): void {
    }

    ngOnInit(): void {



        this.validateForm = this.fb.group({
            org: [{no: '', name: ''}],
        });
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }



    getDevExcel() {


        if (  this.validateForm.controls.org.value.no == '' || this.validateForm.controls.org.value.no == null ) {
            this.orgNo = this.session.getUserSession().orgNo;
        }else {
            this.orgNo = this.validateForm.controls.org.value.no;
        }
        if (  this.validateForm.controls.org.value.name == '' || this.validateForm.controls.org.value.name == null ) {
            this.orgNames = this.session.getUserSession().orgName;
        }else {
            this.orgNames = this.validateForm.controls.org.value.name;
        }
        const params = {
            token: this.session.token,
            userNo: this.session.getUserSession().account,
            orgNo: this.orgNo,
            orgName: this.orgNames,
        };

        if (  params.orgNo == '' || params.orgNo == null ) {
            this.message.error('请选择机构后再操作');
            return;
        }
        console.log('1111111111');
        console.log(params);
        this.transreport.atmCash(params);

        this.orgNo = '';
        this.orgNames = '';

    }

    date2String(date: Date): string {
        if (!date) {
            date = new Date();
        }
        date.setHours(date.getHours() + 8);
        const _date = date.toISOString().substring(0, 10);
        return _date;
    }
    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.org.value.name = this.session.getUserSession().orgName;
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }



}
