import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {SysParamService} from '../sysParam.service';
import {HttpResponse} from '@angular/common/http';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
    templateUrl: './caseCatalog-modify.html'
})
export class CaseCatalogModifyComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    caseCatalog;
    sendMsgMethod;
    caseCataloglist = [];
    maxGradeList = [];
    notifyWayList = [];
    responsorCatalog;
    notifyWay;
    before;

    catalogNo;

    constructor(
        private nzModal: NzModalSubject,
        private fb: FormBuilder,
        private sysParamService: SysParamService,
        private message: NzMessageService,
        private router: Router,
    ) {

    }

    ngOnInit(): void {
        // 初始化表单
        this.caseCataloglist = this.sysParamService.getcaseCataloglist();
        this.notifyWayList = this.sysParamService.getnotifyWayList();
        this.sysParamService.getGradle({}).subscribe(
            data => {
                this.loading = false;
                this.maxGradeList = data.data;
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        if (this.caseCatalog.responsorCatalog === '管机员') {
            this.responsorCatalog = 1;
        } else if (this.caseCatalog.responsorCatalog === '维护人员') {
            this.responsorCatalog = 2;
        } else {
            this.responsorCatalog = 3;
        }
        if (this.caseCatalog.notifyWay === '短信') {
            this.notifyWay = 1;
        } else if (this.caseCatalog.notifyWay === '邮件') {
            this.notifyWay = 2;
        } else if (this.caseCatalog.notifyWay === '短信和邮件') {
            this.notifyWay = 3;
        } else {
            this.notifyWay = 4;
        }

        this.validateForm = this.fb.group({
            catalogName: [null],
            responsorCatalog: [null],
            onsiteInterval: [null, [Validators.required, Validators.maxLength(4),
                Validators.pattern('^1[0-3][0-9]{2}$|^[1-9][0-9]{0,2}$|^14[0-3][0-9]$|^1440$')]],
            onsiteInterval1: [null, [Validators.required, Validators.maxLength(4),
                Validators.pattern('^1[0-3][0-9]{2}$|^[1-9][0-9]{0,2}$|^14[0-3][0-9]$|^1440$')]],
            closeInterval: [null, [Validators.required, Validators.maxLength(4),
                Validators.pattern('^1[0-3][0-9]{2}$|^[1-9][0-9]{0,2}$|^14[0-3][0-9]$|^1440$')]],
            closeInterval1: [null, [Validators.required, Validators.maxLength(4),
                Validators.pattern('^1[0-3][0-9]{2}$|^[1-9][0-9]{0,2}$|^14[0-3][0-9]$|^1440$')]],
            sendMsgMethod: [null],
            maxGrade: [null],
            notifyWay: [null],
        });

        // 获取设备详细信息
        this.loading = true;
        this.before = this.caseCatalog;
        this.validateForm.controls.catalogName.setValue(this.caseCatalog.catalogName);
        this.validateForm.controls.responsorCatalog.setValue(this.responsorCatalog);
        this.validateForm.controls.onsiteInterval.setValue(this.caseCatalog.onsiteInterval);
        this.validateForm.controls.onsiteInterval1.setValue(this.caseCatalog.onsiteInterval1);
        this.validateForm.controls.closeInterval.setValue(this.caseCatalog.closeInterval);
        this.validateForm.controls.closeInterval1.setValue(this.caseCatalog.closeInterval1);
        this.validateForm.controls.maxGrade.setValue(this.caseCatalog.maxGrade);
        if (this.caseCatalog.sendMsgMethod === '逐级放送') {
            this.sendMsgMethod = 0;
        } else {
            this.sendMsgMethod = 1;
        }
        this.validateForm.controls.notifyWay.setValue(this.notifyWay);
    }

    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }

        if (this.validateForm.invalid) {
            return;
        }
        const onsiteInterval = Number(this.validateForm.controls.onsiteInterval.value);
        const onsiteInterval1 = Number(this.validateForm.controls.onsiteInterval1.value);
        const closeInterval = Number(this.validateForm.controls.closeInterval.value);
        const closeInterval1 = Number(this.validateForm.controls.closeInterval1.value);
        console.log(onsiteInterval);
        if (isNaN(onsiteInterval)) {
            this.message.info('在行响应时间输入错误');
            return;
        }
        if (isNaN(onsiteInterval1)) {
            this.message.info('在行关闭时间输入错误');
            return;
        }
        if (isNaN(closeInterval)) {
            this.message.info('离行响应时间输入错误');
            return;
        }
        if (isNaN(closeInterval1)) {
            this.message.info('离行响应时间输入错误');
            return;
        }
        if (onsiteInterval1 < onsiteInterval) {
            this.message.info('在行关闭时间不能小于在行响应时间');
            return;
        }
        if (closeInterval1 < closeInterval) {
            this.message.info('离行关闭时间不能小于在行响应时间');
            return;
        }
        const params = {
            orgNo: this.caseCatalog.orgNo,
            catalogNo: this.caseCatalog.catalogNo,
            catalogName: this.validateForm.controls.catalogName.value,
            responsorCatalog: this.validateForm.controls.responsorCatalog.value,
            onsiteInterval: this.validateForm.controls.onsiteInterval.value,
            onsiteInterval1: this.validateForm.controls.onsiteInterval1.value,
            closeInterval: this.validateForm.controls.closeInterval.value,
            closeInterval1: this.validateForm.controls.closeInterval1.value,
            sendMsgMethod: this.sendMsgMethod,
            maxGrade: this.validateForm.controls.maxGrade.value,
            notifyWay: this.validateForm.controls.notifyWay.value,
        };
        this.loading = true;
        this.sysParamService.modSysParam(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改故障响应设定成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/sysParam']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}
