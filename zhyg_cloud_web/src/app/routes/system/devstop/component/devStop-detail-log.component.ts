import {Component, OnInit} from '@angular/core';
import {DevStopService} from '../devStop.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {SessionService} from '@core/session.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {HttpResponse} from '@angular/common/http';


@Component({
    templateUrl: './devStop-detail-log.html',
})

export class DevStopDetailLogComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    devStop;
    logicId;
    item;
    param;
    stopType = [
        {no: '0', name: '放假'},
        {no: '1', name: '装修'},
        {no: '2', name: '停电'},
        {no: '3', name: '设备故障未修复'},
        {no: '4', name: '其他'},
    ];
    operateStatus = [
        {no: '1', name: '启用'},
        {no: '2', name: '停机'},
    ];
    isAfter = [
        {no: '1', name: '是'},
        {no: '0', name: '否'},
    ];



    constructor(
        private fb: FormBuilder,
        private devStopService: DevStopService,
        private nzModal: NzModalSubject,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null],
            stopReason: [null],
            stopDevType: [null],
            stopDevStartTime: [null],
            stopDevEndTime: [null],
            isAfter: [null],
        });
        // 获取设备详细信息
        if (this.param != null) {
            this.devStop = this.param;
        }
        this.validateForm.controls.devNo.setValue(this.devStop.devNo);
        this.validateForm.controls.stopReason.setValue(this.devStop.stopDevReason || '');
        this.validateForm.controls.stopDevType.setValue(this.devStop.stopDevType || '');
        this.validateForm.controls.stopDevStartTime.setValue(this.devStop.stopDevStartTime);
        this.validateForm.controls.stopDevEndTime.setValue(this.devStop.stopDevEndTime);
        this.validateForm.controls.isAfter.setValue(this.devStop.isAfter.toString() || '');

    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
