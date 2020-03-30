import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject, UploadFile} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {AppstoreService} from '../appstore.service';
import {DevCatalog} from '../../../../models/devCatalog';
import {environment} from '@env/environment';
import {FileItem, FileUploader, ParsedResponseHeaders} from 'ng2-file-upload';

@Component({
    templateUrl: './app-add.html',
    styleUrls: ['./app-add.scss']
})
export class AppAddComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    showFlag = 0;
    appTypeList = [];
    appCatalogList = [];
    devCatalogList: DevCatalog[];
    avatarUrl: string;
    logoPath;
    limitOrgs: {
        no: any,
        name: any
    }[] = [];
    constructor(
        private fb: FormBuilder,
        private appstoreService: AppstoreService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
        private router: Router,
        private session: SessionService,
    ) {
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.appTypeList = this.appstoreService.getTypeTransfer();
        this.validateForm = this.fb.group({
            appId: [null, [Validators.required, Validators.maxLength(40)]],
            appName: [null, [Validators.required, Validators.maxLength(50)]],
            appType: [null, Validators.required],
            appCatalog: [null, [Validators.required]],
            devCatalog: [null],
            versionPath: [null],
            description: [null]
        });
    }

    submitForm() {
        // 执行表单校验
        for (const i in this.validateForm.controls) {
            this.validateForm.controls[i].markAsDirty();
        }

        if (this.validateForm.invalid) {
            return;
        }

        const params = {
            appId: this.validateForm.controls.appId.value,
            appName: this.validateForm.controls.appName.value,
            appType: this.validateForm.controls.appType.value,
            appCatalog: this.validateForm.controls.appCatalog.value,
            limitCatalog: this.setDevCatalog(this.validateForm.controls.devCatalog.value),
            versionPath: this.validateForm.controls.versionPath.value || '',
            appLogo: this.logoPath || '',
            description: this.validateForm.controls.description.value || '',
            userId: this.session.getUserSession().account,
        };

        console.log(params);
        this.loading = true;
        this.appstoreService.addApp(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success(`添加应用成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigateByUrl('/version/appstore');
            }, (error) => {
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
     * 处理设备类型入库的值
     * @param list
     */
    private setDevCatalog(list: string[]): string {
        if (list == null) {
            return '';
        }
        if (list.length === 0) {
            return '';
        }
        list = list.sort((a: string, b: string) => a > b ? 1 : -1);
        let temp = '';
        for (const i of list) {
            temp += '|' + i;
        }
        return temp.substring(1);
    }

    /**
     * 校验图片格式和大小
     * @param file
     */
    beforeUpload = (file: File) => {
        this.logoPath = file.name;
        const checkType = file.type === 'image/jpeg' || file.type === 'image/png';
        if (!checkType) {
            this.message.error('只能上传jpg或png格式的图片！');
        }
        const checkSize = file.size / 1024 / 1024 < 2;
        if (!checkSize) {
            this.message.error('图片必须小于2M！');
        }
        return checkType && checkSize;
    }

    private getBase64(img: File, callback: (img: any) => void) {
        const reader = new FileReader();
        reader.addEventListener('load', () => callback(reader.result));
        reader.readAsDataURL(img);
    }

    handleChange(info: { file: UploadFile }) {
        if (info.file.status === 'uploading') {
            this.loading = true;
            return;
        }
        if (info.file.status === 'done') {
            this.getBase64(info.file.originFileObj, (img: any) => {
                this.loading = false;
                this.avatarUrl = img;
            });
        }
    }


    /**
     * 上传文件配置
     */
    uploader: FileUploader = new FileUploader({
        url: `${environment.SERVER_FILE_URL}` + '/content/appBaseInfo/logoUpload',
        headers: [
            {name: 'userNo', value: this.session.getUserSession().account},
            {name: 'token', value: this.session.token}
        ],
        method: 'POST',
        itemAlias: 'file',
        autoUpload: false
    });

    /**
     * 选择文件后立即执行校验
     */
    checkFile(event) {
        if (!event.target.value) {
            return;
        }
        this.loading = true;
        // 成功处理回调函数
        this.uploader.onSuccessItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            console.log(result);
            if (!result.retCode.startsWith('ok')) {
                this.message.error(result.retMsg);
                return;
            }
            // 获取ucp端的文件路径
            let filepath = result.data.filePath;
            while (filepath.indexOf('\\') > 0) {
                filepath = filepath.replace('\\', '/');
            }
            this.logoPath = filepath;
            this.loading = false;
        };
        // 错误处理回调函数
        this.uploader.onErrorItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            this.message.error(result.retMsg);
            console.log(result);
        };
        this.uploader.uploadAll();
    }

    /**
     * 选择上级机构后，查询用户可选的机构类型列表
     * @param evt
     */
    selectOrg(evt: any) {
        const orgNo = evt.no;
        if (orgNo) {
            this.limitOrgs.push({no: evt.no, name: evt.name});
        }
    }

    /**
     * 机构多选框移除机构
     * @param i
     */
    onClose(i) {
        this.limitOrgs.splice(i, 1);
        console.log(this.limitOrgs);
    }
}

