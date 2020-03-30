import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {AtmFunctionDefService} from '../atmFunctionDef.service';
import {DevService} from '../../../system/dev/dev.service';

@Component({
    templateUrl: './atmFunctionDef-add.html'
})
export class AtmFunctionDefAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    devCatalogList = []; // 设备类型列表
    selectCatalog: string;
    transTypeList = [];  // 交易类别名称列表

    constructor(private fb: FormBuilder,
                private devService: DevService,
                private atmFunctioinDefService: AtmFunctionDefService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService) {
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
        const transTypeLevel = this.validateForm.controls.transType.value;
        const params = {
            devCatalog: this.validateForm.controls.devCatalog.value,
            transTypeLevel: transTypeLevel,
            transType: this.getTransType(transTypeLevel),
            transCode: this.validateForm.controls.transCode.value,
            transName: this.validateForm.controls.transName.value,
            transNo: this.validateForm.controls.transNo.value
        };
        console.log('设备功能添加');
        this.loading = true;
        this.atmFunctioinDefService.addAtmFunctionDef(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`设备功能添加成功！`);
                this.nzModal.destroy('onOk');
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            devCatalog: [null, [Validators.required]],
            transNo: [null, [Validators.required, Validators.pattern('^(12[0-7]|1[0-1]\\d|[1-9]\\d|[0-9]|000|0[0-9]{1,2})$')]],
            transType: [null, [Validators.required]],
            transCode: [null, [Validators.required, Validators.maxLength(100), Validators.pattern('[0-9a-zA-Z]{1,100}')]],
            transName: [null, [Validators.required, Validators.maxLength(20), Validators.pattern('^[\u4e00-\u9fa5]+$')]],
        });
        // 查询设备类型
        this.devService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
                this.selectCatalog = this.devCatalogList[0].no;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 获取交易类别
        this.transTypeList = this.atmFunctioinDefService.getTransTypeList();
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    getTransType(transTypeLevel) {
        switch (transTypeLevel) {
            case '0':
                return '普通交易';
            case '1':
                return '现金交易';
        }
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}

