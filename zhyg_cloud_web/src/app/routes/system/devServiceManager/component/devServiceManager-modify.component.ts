import {Component, OnInit} from '@angular/core';
import {DevServiceManagerService} from '../devServiceManager.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject, UploadFile} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './devServiceManager-modify.html'
})
export class DevServiceManagerModifyComponent implements OnInit {


    validateForm: FormGroup;
    devServiceManagers;
    loading = false;
    fileList = [];
    before;

    constructor(private fb: FormBuilder,
                private devServiceManagerService: DevServiceManagerService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required]],
            name: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*'), Validators.maxLength(80)]],
            linkMan: [null, [Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*'), Validators.maxLength(10),Validators.minLength(2)]],
            address: [null, [Validators.maxLength(80)]],
            phone: [null, [Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
            mobile: [null, [Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
            fax: [null, [Validators.pattern('[0-9]{7,15}')]],
            email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            infoFileName: [null],
            infoFilePath: [null],
        });

        // 获取设备维护商详细信息
        this.loading = true;
        this.devServiceManagerService.getDevServiceManager(this.devServiceManagers.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.devServiceManagers = data.data;
                this.before = data.data;
                this.validateForm.controls.no.setValue(this.devServiceManagers.no);
                this.validateForm.controls.name.setValue(this.devServiceManagers.name);
                this.validateForm.controls.linkMan.setValue(this.devServiceManagers.linkMan || '');
                this.validateForm.controls.address.setValue(this.devServiceManagers.address || '');
                this.validateForm.controls.phone.setValue(this.devServiceManagers.phone || '');
                this.validateForm.controls.mobile.setValue(this.devServiceManagers.mobile || '');
                this.validateForm.controls.fax.setValue(this.devServiceManagers.fax || '');
                this.validateForm.controls.email.setValue(this.devServiceManagers.email || '');
                this.validateForm.controls.infoFilePath.setValue(this.devServiceManagers.infoFilePath || '');
                if (this.devServiceManagers.infoFileName != null) {
                    this.fileList = [{
                        uid: this.devServiceManagers.no,
                        name: this.devServiceManagers.infoFileName,
                        status: 'done'
                    }];
                }
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
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
            no: this.validateForm.controls.no.value,
            name: this.validateForm.controls.name.value,
            linkMan: this.validateForm.controls.linkMan.value,
            address: this.validateForm.controls.address.value,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            fax: this.validateForm.controls.fax.value,
            email: this.validateForm.controls.email.value,
            infoFilePath: this.validateForm.controls.infoFilePath.value,
        };
        this.loading = true;
        console.log(params);
        this.devServiceManagerService.modDevServiceManager(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改设备维护商成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/devServiceManager']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    // 上传文件的回调函数
    changeFile(info): void {
        if (info.file.response) {
            console.log(info.file.response);
            // this.infoFilePath = info.file.response.data;
            // this.infoFileName = '重新赋值';
            this.validateForm.controls.infoFilePath.setValue(info.file.response.data || '');
           // console.log(this.infoFileName);
        }

    }
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
    }

    /**
     * 移除文件时回调
     */
    removeFile= (file: UploadFile) => {
        console.log(file.uid);
        this.fileList = [];
        this.validateForm.controls.infoFilePath.setValue( '');
    }

    cancel() {
        this.nzModal.destroy('onCancel');

    }
    uploadFile(e) {
        e.preventDefault();
    }

}
