import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject, UploadFile} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {AppstoreService} from '../appstore.service';
import {AppInfo} from '../../../../models/appInfo';
import {environment} from '@env/environment';
import {FileUploader} from 'ng2-file-upload';

@Component({
    templateUrl: './app-modify.html',
    styleUrls: ['./app-modify.scss']
})
export class AppModifyComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    showFlag = 0;
    app: AppInfo;
    avatarUrl: string;
    logoPath;
    appName;
    appInfo;
    limitOrgs: {
       no: any,
       name: any
    }[] = [];
    appCatalogs = [];
    devCatalogList = [];

    constructor(
        private fb: FormBuilder,
        private service: AppstoreService,
        private nzModal: NzModalSubject,
        private session: SessionService,
        private message: NzMessageService,
        private route: ActivatedRoute,
        private router: Router
    ) {

    }


    ngOnInit(): void {
        this.validateForm = this.fb.group({
            appId: [null],
            appCatalog: [null, [Validators.required]],
            devCatalog: [null, [Validators.required]],
            limitOrg: [null, [Validators.required]],
            description: [null],
        });

        this.loading = true;
        // 获取应用详情
        // this.appstoreService.getApps({appName: this.appName, showType: 'list', pageSize: 1, curPage: 1}).subscribe(
        //     data => {
        //         this.loading = false;
        //         this.app = data.data[0];
        //         this.validateForm.controls.appId.setValue(this.app.appsId);
        //         this.logoPath = this.app.logoPath;
        //         this.setLogoUrl(this.app.logoPath);
        //         this.validateForm.controls.appCatalog.setValue(this.app.appsCatalog);
        //
        //         this.validateForm.controls.devCatalog.setValue(this.app.limitCatalog.split('|'));
        //         this.validateForm.controls.description.setValue(this.app.description);
        //     },
        //     error => {
        //         this.loading = false;
        //         if (error instanceof HttpResponse) {
        //             this.message.error(error.body.retMsg);
        //         }
        //     });

        this.loading = false;
        this.app = this.appInfo;
        if (this.app.limitOrg) {
            let temp1: any[];
            temp1 = (<string>this.app.limitOrg).split('|');
            if (temp1.length > 0) {
                for (const i in temp1) {
                    this.limitOrgs.push({no: temp1[i], name: temp1[i]});
                }
            }
        }
        this.validateForm.controls.appId.setValue(this.app.appsId);
        this.logoPath = this.app.logoPath;
        this.setLogoUrl(this.app.logoPath);
        this.validateForm.controls.appCatalog.setValue(this.app.appsCatalog);
        this.validateForm.controls.devCatalog.setValue(this.app.limitCatalog.split(','));
        this.validateForm.controls.limitOrg.setValue([this.limitOrgs]);
        this.validateForm.controls.description.setValue(this.app.description);
    }

    submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }

        let tmpOrgNo = '';
        if (this.limitOrgs.length > 0) {
            for (let j = 0; j < this.limitOrgs.length; j++) {
                tmpOrgNo += '|' + this.limitOrgs[j].no;
            }
            tmpOrgNo = tmpOrgNo.substring(1);
        }
        const params = {
            appId: this.validateForm.controls.appId.value,
            appLogo: this.logoPath || '',
            description: this.validateForm.controls.description.value || '',
            limitCatalog: this.setDevCatalog(this.validateForm.controls.devCatalog.value),
            limitOrg: tmpOrgNo,
            appCatalog: this.validateForm.controls.appCatalog.value,
        };
        this.loading = true;
        this.service.modApp(params).subscribe(
            data => {
                this.loading = false;
                this.message.success('修改应用信息成功！');
                this.nzModal.destroy('onOk');
                this.router.navigateByUrl('/version/appstore');
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 处理设备类型入库的值
     * @param list
     */
    private setDevCatalog(list: string[]): string {
        if (list.length === 0) {
            return '';
        }
        console.log(list);
        list = list.sort((a: string, b: string) => a > b ? 1 : -1);
        let temp = '';
        for (const i of list) {
            temp += ',' + i;
        }
        return temp.substring(1);
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

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
                console.log(img);
            });
        }
    }

    private setLogoUrl(url: string) {
        if (url && url != '') {
            const name = url.substring(url.lastIndexOf('/') + 1);
            // 暂时先用这里的图片
            this.avatarUrl = 'assets/images/businessIntelligence/' + name;
        } else {
            return '';
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
     * 选择机构
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
