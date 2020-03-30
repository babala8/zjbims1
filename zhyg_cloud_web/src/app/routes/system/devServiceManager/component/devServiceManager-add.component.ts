import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {DevServiceManagerService} from '../devServiceManager.service';
import {NzMessageService, NzModalSubject, UploadFile} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';

@Component({
    templateUrl: './devServiceManager-add.html'
})
export class DevServiceManagerAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    i = 0;
    showFlag = 0;
    fileList: UploadFile[] = [];
    infoFilePath = '';


    constructor(private fb: FormBuilder,
                private devServiceManagerService: DevServiceManagerService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private router: Router) {
    }
    // 上传文件的回调函数
    handleChange(info): void {
        if (info.file.response) {
             console.log(info.file.response);
             // this.fileList[0].url = info.file.response.data;
            this.infoFilePath = info.file.response.data;
        }

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
        const params = {
            name: this.validateForm.controls.name.value,
            linkMan: this.validateForm.controls.linkMan.value,
            address: this.validateForm.controls.address.value,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            fax: this.validateForm.controls.fax.value,
            email: this.validateForm.controls.email.value,
            infoFilePath: this.infoFilePath
        };

        console.log(params);
        this.loading = true;
        this.devServiceManagerService.addDevServiceManager(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加设备维护商成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/devServiceManager']);
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
            name: [null, [Validators.required, Validators.maxLength(80), Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$') ]],
            linkMan: [null, [Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$'), Validators.maxLength(10),Validators.minLength(2)]],
            address: [null, [Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$'), Validators.maxLength(80)]],
            phone: [null, [Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
            mobile: [null, [Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
            fax: [null, [Validators.pattern('[0-9]{7,15}')]],
            email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            infoFilePath: [null],
        });
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
    uploadFile(e) {
        e.preventDefault();
    }

}

