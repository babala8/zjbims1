import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FaultQueryService} from '../faultQuery.service';
import {SessionService} from '@core/session.service';

@Component({
    selector: 'faultQuery-detail',
    templateUrl: './faultQuery-detail.html',
})
export class FaultQueryDetailComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    cases;
    caseStatus;

    constructor(
                private fb: FormBuilder,
                private nzModal: NzModalSubject,
                private faultQueryService: FaultQueryService,
                private message: NzMessageService,
                private session: SessionService
    ) {
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            caseNo: [null],
            devNo: [null],
            devVendor: [null],
            devType: [null],
            orgName: [null],
            address: [null],
            caseCatalogName: [null],
            status: [null],
            modCatalogName: [null],
            grade: [null],
            openTime: [null],
            notifyTime: [null],
            precloseTime: [null],
            closeTime: [null],
            faultCode: [null],
            vendorCode: [null],
            description: [null],
            solution: [null],
        });

        // 获取设备详细信息
        this.loading = true;
        const params = {
            caseNo: this.cases.caseNo
        };
        console.log(params);
        this.faultQueryService.getCaseDetail(params).subscribe(
            _data => {
                this.loading = false;
                console.log(_data.data);
                if (_data.data.currentStatus == 1) {
                    _data.data.currentStatus = '已创建';
                }else if (_data.data.currentStatus == 2) {
                    _data.data.currentStatus = '已通知';
                }else if (_data.data.currentStatus == 3) {
                    _data.data.currentStatus = '通知升级';
                }else if (_data.data.currentStatus == 4) {
                    _data.data.currentStatus = '已确认';
                }else if (_data.data.currentStatus == 5) {
                    _data.data.currentStatus = '响应升级';
                }else if (_data.data.currentStatus == 6) {
                    _data.data.currentStatus = '已响应';
                }else if (_data.data.currentStatus == 7) {
                    _data.data.currentStatus = '故障升级';
                }else if (_data.data.currentStatus == 8) {
                    _data.data.currentStatus = '已挂起';
                }else if (_data.data.status == 9) {
                    _data.data.currentStatus = '已关闭';
                }
                this.validateForm.controls.caseNo.setValue(_data.data.caseNo);
                this.validateForm.controls.devNo.setValue(_data.data.devNo);
                this.validateForm.controls.devVendor.setValue(_data.data.devvendorname);
                this.validateForm.controls.devType.setValue(_data.data.devtypename);
                this.validateForm.controls.orgName.setValue(_data.data.orgname + '(' + _data.data.orgNo + ')');
                this.validateForm.controls.address.setValue(_data.data.address);
                this.validateForm.controls.caseCatalogName.setValue(_data.data.catalogName);
                this.validateForm.controls.status.setValue(_data.data.currentStatus);
                this.validateForm.controls.modCatalogName.setValue(_data.data.modcatalogname);
                this.validateForm.controls.grade.setValue(this.cases.grade);
                this.validateForm.controls.openTime.setValue(_data.data.openTime);
                this.validateForm.controls.notifyTime.setValue(_data.data.notifyTime);
                this.validateForm.controls.precloseTime.setValue(_data.data.preCloseTime);
                this.validateForm.controls.closeTime.setValue(_data.data.closeTime);
                this.validateForm.controls.faultCode.setValue(_data.data.faultCode);
                this.validateForm.controls.vendorCode.setValue(_data.data.vendorCode);
                this.validateForm.controls.description.setValue(_data.data.description);
                this.validateForm.controls.solution.setValue(_data.data.solution);
                this.caseStatus = _data.data.status;
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    /**
     * 关闭当前CASE
     */
    closeCase() {
        const params = {
            caseNo: this.cases.caseNo,
            userNo: this.session.getUserSession().account
        };
        this.faultQueryService.closeCase(params)
            .subscribe(_data => {
                this.message.success(`关闭CASE成功，关闭人员：` + this.session.getUserSession().account);
                this.nzModal.destroy('onOk');
                // this.router.navigate(['/maintain/faultQuery']);
            }, (error) => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
}
