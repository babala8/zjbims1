import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {NzModalSubject} from 'ng-zorro-antd';

@Component({
    templateUrl: './caseCatalog-detail-log.html'
})
export class CaseCatalogDetailLogComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    caseCatalog;
    responsorCatalog;
    notifyWay;
    param;
    catalogNo;

    constructor(
        private nzModal: NzModalSubject,
        private fb: FormBuilder,
    ) {

    }

    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            catalogName: [null],
            responsorCatalog: [null],
            onsiteInterval: [null],
            onsiteInterval1: [null],
            closeInterval: [null],
            closeInterval1: [null],
            sendMsgMethod: [null],
            maxGrade: [null],
            notifyWay: [null],
        });
        if (this.param !== null) {
            this.caseCatalog = this.param;
        }
        if (this.caseCatalog.responsorCatalog === 1) {
            this.caseCatalog.responsorCatalog = '管机员';
        }else if (this.caseCatalog.responsorCatalog === 2) {
            this.caseCatalog.responsorCatalog = '维护人员';
        }else if (this.caseCatalog.responsorCatalog === 3) {
            this.caseCatalog.responsorCatalog = '管机员和维护人员';
        }

        if (this.caseCatalog.notifyWay === 1) {
            this.caseCatalog.notifyWay = '短信';
        }else if (this.caseCatalog.notifyWay === 2) {
            this.caseCatalog.notifyWay = '邮件';
        }else if (this.caseCatalog.notifyWay === 3) {
            this.caseCatalog.notifyWay = '短信和邮件';
        }

        if (this.caseCatalog.sendMsgMethod === 0) {
            this.caseCatalog.sendMsgMethod = '逐级发送';
        }else if (this.caseCatalog.sendMsgMethod === 1) {
            this.caseCatalog.sendMsgMethod = '全部发送';
        }
        this.loading = false;
        this.validateForm.controls.catalogName.setValue(this.caseCatalog.catalogName);
        this.validateForm.controls.responsorCatalog.setValue(this.caseCatalog.responsorCatalog);
        this.validateForm.controls.onsiteInterval.setValue(this.caseCatalog.onsiteInterval);
        this.validateForm.controls.onsiteInterval1.setValue(this.caseCatalog.onsiteInterval1);
        this.validateForm.controls.closeInterval.setValue(this.caseCatalog.closeInterval);
        this.validateForm.controls.closeInterval1.setValue(this.caseCatalog.closeInterval1);
        this.validateForm.controls.maxGrade.setValue(this.caseCatalog.maxGrade);
        this.validateForm.controls.sendMsgMethod.setValue(this.caseCatalog.sendMsgMethod);
        this.validateForm.controls.notifyWay.setValue(this.caseCatalog.notifyWay);
    }
    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
