import {Component, OnInit} from '@angular/core';
import {DevServiceManagerService} from '../devServiceManager.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject, UploadFile} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './devServiceManager-detail-log.html'
})
export class DevServiceManagerDetailLogComponent implements OnInit {


    validateForm: FormGroup;
    devServiceManagers;
    loading = false;
    param;

    constructor(private fb: FormBuilder,
                private devServiceManagerService: DevServiceManagerService,
                private nzModal: NzModalSubject,
    ) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(80)]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*'), Validators.maxLength(80)]],
            linkMan: [null, [Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*'), Validators.maxLength(10)]],
            address: [null, [Validators.maxLength(80)]],
            phone: [null, [Validators.pattern('[0-9]{7,15}')]],
            mobile: [null, [Validators.pattern('[0-9]{11,20}')]],
            fax: [null, [Validators.pattern('[0-9]{7,15}')]],
            email: [null, [Validators.email]],
            infoFileName: [null],
            infoFilePath: [null],
        });

        // 获取设备维护商详细信息
        if (this.param !== null) {
            this.devServiceManagers = this.param;
        }
        this.validateForm.controls.no.setValue(this.devServiceManagers.no);
        this.validateForm.controls.name.setValue(this.devServiceManagers.name);
        this.validateForm.controls.linkMan.setValue(this.devServiceManagers.linkMan || '');
        this.validateForm.controls.address.setValue(this.devServiceManagers.address || '');
        this.validateForm.controls.phone.setValue(this.devServiceManagers.phone || '');
        this.validateForm.controls.mobile.setValue(this.devServiceManagers.mobile || '');
        this.validateForm.controls.fax.setValue(this.devServiceManagers.fax || '');
        this.validateForm.controls.email.setValue(this.devServiceManagers.email || '');
        this.validateForm.controls.infoFilePath.setValue(this.devServiceManagers.infoFilePath || '');
    }


    cancel() {
        this.nzModal.destroy('onCancel');

    }


}
