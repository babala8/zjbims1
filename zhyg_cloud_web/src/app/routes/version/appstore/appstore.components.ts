import {Component, OnInit} from '@angular/core';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {AppCatalog} from '../../../models/appCatalog';
import {AppstoreService} from './appstore.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {AppInfo} from '../../../models/appInfo';
import {environment} from '@env/environment';
import {FileUploader} from 'ng2-file-upload';
import {SessionService} from '@core/session.service';
import {AppModifyComponent} from './component/app-modify.component';
import {AppAddComponent} from './component/app-add.component';
import {SysMenuService} from '../../system/menu/menu.service';

@Component({
    templateUrl: './appstore.html',
})
export class AppstoreComponent implements OnInit {

    formModel = {};
    loading = true;
    page = new Page();
    appCatalogs: AppCatalog[];
    appTypes;
    dataSet: AppInfo[] = [];
    uploadVisible = false;
    filePath;
    uploadDisable = true;
    fileName;
    devCatalogList;

    constructor(
        private appstoreService: AppstoreService,
        private message: NzMessageService,
        private session: SessionService,
        private modal: NzModalService,
        private menuService: SysMenuService
    ) {
    }

    ngOnInit() {
        this.appstoreService.getDevCatalogs({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            },
            error => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.appTypes = this.appstoreService.getTypeTransfer();
        this.refreshData(true);

        // 获取应用分类信息
        this.appstoreService.getAppCatalogs({}).subscribe(
            data => {
                console.log(data.data);
                this.appCatalogs = data.data;
            }, error => {
                console.log('appCatalogs err' + error);
                this.appCatalogs = [];
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            appName: this.formModel['appName'] || '',
            busiNo: this.formModel['busiNo'] || '',
            appCatalog: this.formModel['appCatalog'] || '',
            appType: this.formModel['appType'] || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            // 暂时先使用列表方式
            showType: 'list',
        };

        // 获取应用列表
        this.appstoreService.getApps(params)
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.page.totalRow = data.page['totalRow'];
                    // 默认化表格不展开
                    this.dataSet.map(x => x.expand = false);
                } else {
                    this.dataSet = [];
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 删除应用
     * @param appId
     */
    confirmDel(appId) {
        this.appstoreService.delApp({
            appId: appId
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除应用成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 不能删
     */
    cancel() {

    }

    /**
     * 获取应用类型名称
     * @param no
     */
    getTypeName(no: string): string {
        return this.appstoreService.getTypeName(no);
    }

    /**
     * 展开应用详情表格
     * @param appId
     */
    showDetail(appId: string) {
        // 折叠时直接返回
        const temp: AppInfo[] = this.dataSet.filter(x => x.appsId === appId && x.expand === true);
        if (temp && temp.length === 0) {
            return;
        }
        this.appstoreService.getVersions(appId)
            .subscribe(
                data => {
                    if (data.data) {
                        data.data.forEach(item => {
                            if (item.versionStatus === '1') {
                                item.versionStatus = '可用';
                            } else if (item.versionStatus === '2') {
                                item.versionStatus = '不可用';
                            } else if (item.versionStatus === '3') {
                                item.versionStatus = '已作废';
                            }
                        });
                        for (const i of this.dataSet) {
                            if (i.appsId === appId) {
                                i.versions = data.data;
                                break;
                            }
                        }
                    }
                }, error => {
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
    }

    /**
     * 显示文件上传模态框
     */
    showUpload() {
        this.uploadVisible = true;
    }

    /**
     * 取消文件上传
     */
    cancelUpload() {
        this.uploadVisible = false;
        this.resetUpload();
    }

    /**
     * 重置上传组件
     */
    resetUpload() {
        this.loading = false;
        this.uploader.cancelAll();
        this.uploader.clearQueue();
        this.fileName = '';
    }

    /**
     * 上传文件配置
     */
    uploader: FileUploader = new FileUploader({
        url: `${environment.SERVER_FILE_URL}` + '/content/appVersion/versionUpload',
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
            this.filePath = filepath;
            // 校验文件
            this.appstoreService.checkVersionFile({appVersionFile: this.filePath}).subscribe(
                data => {
                    this.loading = false;
                    this.message.success(data.retMsg);
                    this.uploadDisable = false;
                }, error => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                    this.resetUpload();
                }
            );
        };
        // 错误处理回调函数
        this.uploader.onErrorItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            this.message.error(result.retMsg);
            console.log(result);
            this.resetUpload();
        };
        this.uploader.uploadAll();
    }

    /**
     * 校验成功后版本入库
     */
    saveVersion() {
        this.appstoreService.saveVersionFile({
            appVersionFile: this.filePath,
            userId: this.session.getUserSession().account,
        }).subscribe(
            data => {
                this.loading = false;
                if (data.retCode.startsWith('ok')) {
                    this.message.success(data.retMsg);
                    this.uploadDisable = true;
                    this.uploadVisible = false;
                } else {
                    this.message.error(data.retMsg);
                }
            }, error => {
                this.loading = false;
                this.message.error(error.body.retMsg);
            }
        );
        this.resetUpload();
    }

    /**
     * 查询
     */
    search() {
        this.refreshData(true);
    }

    /**
     * 打开添加窗口
     * @param appName
     */
    addApp() {
        this.modal.open({
            title: '添加应用',
            maskClosable: false,
            footer: false,
            content: AppAddComponent,
            componentParams: {
                appCatalogList: this.appCatalogs,
                devCatalogList: this.devCatalogList
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    /**
     * 打开修改窗口
     * @param appName
     */
    modApp(appInfo: AppInfo) {
        this.modal.open({
            title: '修改应用',
            maskClosable: false,
            footer: false,
            content: AppModifyComponent,
            componentParams: {
                appInfo: appInfo,
                appCatalogs: this.appCatalogs,
                devCatalogList: this.devCatalogList
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        return this.menuService.checkBtn(menuName, btnName);
    }

}
