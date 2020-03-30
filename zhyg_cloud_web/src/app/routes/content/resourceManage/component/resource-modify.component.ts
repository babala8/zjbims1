import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ResourceManageService} from '../resourceManage.service';
import {FileUploader} from 'ng2-file-upload';
import {environment} from '@env/environment';

@Component({
    selector: 'resource-modify',
    templateUrl: './resource-modify.html',
})
export class ResourceModifyComponent implements OnInit {
    validateForm: FormGroup;
    resourceTypes = [];
    loading = false;
    filePath = '';
    type = '';
    resource;

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
            name: [this.resource.name],
            type: [this.resource.type],
            description: [this.resource.description],
            text: [this.resource.text]
        });
        this.filePath = this.resource.path;
        if (this.filePath) {
            while (this.filePath.indexOf('\\') > 0) {
                this.filePath = this.filePath.replace('\\', '/');
            }
        }
        this.type = this.resource.type;
        console.log(this.type);
        this.resourceTypes = this.service.getResourceTypes();
        // 配置资源上传回调函数
        this.uploader.onSuccessItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            if (!result.retCode.startsWith('ok')) {
                this.message.error(result.retMsg);
                return;
            }
            this.filePath = result.data;
            this.save();
        };
        // 错误处理回调函数
        this.uploader.onErrorItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            this.message.error(result.retMsg);
            this.resetUpload();
        };
    }

    _submitForm() {
        if (this.uploader.queue.length > 0) {
            this.uploader.uploadAll();
        } else {
            this.save();
        }
    }

    save() {
        const params = {
            resourceName: this.validateForm.controls.name.value || '',
            resourceType: this.validateForm.controls.type.value || '',
            description: this.validateForm.controls.description.value || '',
            resourcePath: this.filePath,
            text: this.validateForm.controls.text.value || '',
            adduser: this.session.getUserSession().account,
            resourceNo: this.resource.no
        };
        this.loading = true;
        this.service.modResource(params)
            .subscribe(() => {
                this.loading = false;
                this.message.success(`修改资源成功`);
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

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}
