import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ResourceManageService} from '../resourceManage.service';
import {FileUploader} from 'ng2-file-upload';
import {environment} from '@env/environment';

@Component({
    selector: 'resource-add',
    templateUrl: './resource-add.html',
})
export class ResourceAddComponent implements OnInit {
    validateForm: FormGroup;
    resourceTypes = [];
    loading = false;
    filePath = '';
    type = '';

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private service: ResourceManageService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
        private router: Router) {
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            name: [null, [Validators.required, Validators.maxLength(25)]],
            type: [null, [Validators.required]],
            description: [null, [Validators.maxLength(50)]],
            text: [null, [Validators.maxLength(512)]]
        });
        this.resourceTypes = this.service.getResourceTypes();
        // 配置资源上传回调函数
        this.uploader.onSuccessItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            if (!result.retCode.startsWith('ok')) {
                this.message.error(result.retMsg);
                return;
            }
            let filepath = result.data;
            while (filepath.indexOf('\\') > 0) {
                filepath = filepath.replace('\\', '/');
            }
            this.filePath = filepath;
            console.log(this.filePath);
            this.save();
        };
        // 错误处理回调函数
        this.uploader.onErrorItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            this.message.error(result.retMsg);
            this.resetUpload();
        };
    }

    /**
     * 保存之前先上传文件
     * @private
     */
    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }
        const type = this.validateForm.controls.type.value;
        if (type == '3') {
            this.save();
        } else {
            this.uploader.uploadAll();
        }
    }

    /**
     * 上传成功后回调
     */
    save() {
        const params = {
            resourceName: this.validateForm.controls.name.value,
            resourceType: this.validateForm.controls.type.value,
            description: this.validateForm.controls.description.value || '',
            resourcePath: this.filePath,
            text: this.validateForm.controls.text.value || '',
            adduser: this.session.getUserSession().account
        };
        if (params.resourceType == '3' && params.text == '') {
            this.loading = false;
            this.message.warning(`广告内容不能为空！`);
            return;
        }
        console.log(params);
        this.loading = true;
        this.service.addResource(params)
            .subscribe(() => {
                this.loading = false;
                this.message.success(`创建资源成功`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/content/resourceManage']);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    selectType(event) {
        this.type = event;
    }

    resetUpload() {
        this.loading = false;
        this.uploader.cancelAll();
        this.uploader.clearQueue();
    }

    /**
     * 上传文件配置
     */
    uploader: FileUploader = new FileUploader({
        url: `${environment.SERVER_FILE_URL}` + '/content/resource/upload',
        headers: [
            {name: 'userNo', value: this.session.getUserSession().account},
            {name: 'token', value: this.session.token}
        ],
        method: 'POST',
        itemAlias: 'file',
        autoUpload: false
    });

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
}
