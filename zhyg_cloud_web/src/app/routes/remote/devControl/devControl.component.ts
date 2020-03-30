import {Component, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {OrgService} from '../../system/org/org.service';
import {Page} from '../../../models/page';
import {Org} from '../../../models/org';
import {OrgType} from '../../../models/orgType';
import {DevControlService} from './devControl.service';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DocumentFileList} from '../../../models/documentFileList';
import {FileUploader} from 'ng2-file-upload';
import {environment} from '@env/environment';
import {animate, state, style, transition, trigger} from '@angular/animations';
import {WebSocketService} from '../webSocketService';
import {Dev} from '../../../models/dev';
import {SysMenuService} from '../../system/menu/menu.service';
import {RET_CODE} from '@core/constant';
import {SoftwareInfoComponent} from './component/softwareInfo.component';
import {HardwareInfoComponent} from './component/hardwareInfo.component';
import {SystemInfoComponent} from './component/systemInfo.component';
import {ProcessInfoComponent} from './component/processInfo.component';
import {StatusInfoComponent} from './component/statusInfo.component';
import {LogInfoComponent} from './component/logInfo.component';


@Component({
    selector: 'nz-demo-popover-placement',

    templateUrl: './devControl.html',
    animations: [
        trigger('openClose', [
            state('open', style({
                transform: 'translateX(-600px)'
            })),
            state('close', style({
                transform: 'translateX(600px)'
            })),
            transition('open => closed', [
                animate('200ms ease-in')
            ]),
            transition('closed => open', [
                animate('200ms ease-out')
            ])
        ])
    ]
})
export class DevControlComponent implements OnInit, OnDestroy {
    loading = false;
    validateForm: FormGroup;
    /**
     * 设备类型列表
     */
    devCatalogList  = [];
    devVendorList = [];
    /**
     * 设备型号列表
     */
    devTypeList = [];
    /**
     * 可选设备型号列表
     */
    selectableDevTypeList = [];
    // 设备列表分页
    page = new Page();
    org: Org;
    orgTypeList: OrgType[] = [];
    // 设备列表
    devList: Dev[] = [];
    // 全选
    allChecked = false;
    // 半选
    indeterminate = false;
    // 0表示主屏幕，1表示副屏幕
    screenFlag = '1';
    // 是否展示设备列表
    showDevs = true;
    // 是否遮盖控制按钮
    coverControlBtn = false;
    // 是否展示屏幕选择
    showScreen = false;
    // 是否展示日志范围选择
    showLog = false;
    // 加载结果
    loadResult = false;
    // 电子日志日期范围
    logStartDate: Date = null;
    logEndDate: Date = null;
    // 远程控制结果
    controlResult = [];
    // 选择的设备数量
    selDevNum = 0;
    // 远程浏览文件显示模式
    viewMode = '0';
    // 是否有执行文件权限（远程浏览）
    chkExe = false;
    // 是否有删除文件权限（远程浏览）
    chkDel = false;
    // 当前设备号（远程浏览）
    devNo;
    // 当前浏览路径
    viewPath = '';
    // 文件列表（远程浏览）
    documentFileList: DocumentFileList[] = [];
    // 上传窗口是否可见
    uploadVisible = false;
    // 下载文件列表
    downloadFileList = [];
    // 下载文件列表分页
    page2 = new Page();
    // 是否展示下载列表
    listOpen = false;
    // 控制结果序号
    resultSerial = 1;
    currentCmdId;   // 当前操作标识
    // websocket session 标识
    sessionId;
    // 文件下载列表下载结果判断
    download_success = '成功';
    // 远程浏览文件上传url
    uploadUrl;
    // 预览图片弹出框是否打开
    previewVisible = false;
    // 要预览的抓屏图片
    selectedPic;
    // 要下载的抓屏图片
    downloadPic;

    // 抓屏图片显示url
    screenImgUrl = `${environment.SERVER_URL}` + '/control/remote/getScreenImg?&userNo=' + this.session.getUserSession().account
        + '&token=' + this.session.token + '&type=result&fileName=';
    constructor(
        private fb: FormBuilder,
        private message: NzMessageService,
        private orgService: OrgService,
        private devControlService: DevControlService,
        private session: SessionService,
        private confirmService: NzModalService,
        private webSocketService: WebSocketService,
        private menuService: SysMenuService) {
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            devVendor: [null],
            devNo: [null, [ Validators.pattern('^[0-9a-zA-Z]{4,8}')]],
            upper: [{no: '', name: ''}],
            devType: [null],
            devCatalog: [null]
        });
        this.devControlService.qryDevCatalogs({}).subscribe(
            data => {
                 console.log('查询类型:', data.data);
                if (data.data) {
                    this.devCatalogList = data.data;
                }
            },
            error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devControlService.qryDevVendors({}).subscribe(
            data => {
                // console.log('查询品牌:', data.data);
                if (data.data) {
                    this.devVendorList = data.data;
                }
            },
            error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devControlService.qryDevTypes({}).subscribe(
            data => {
                // console.log('查询型号', data.data);
                if (data.data) {
                    this.devTypeList = data.data;
                    this.selectableDevTypeList = this.devTypeList;
                }
            },
            error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.refreshData(true);
        // 页面打开时就启动结果监听
        this._startWebSocket();
    }


    ngOnDestroy(): void {
        this.webSocketService.ws.close();
    }

    /**
     * 刷新设备列表
     * @param reset
     */
    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        this.devControlService.qryDevs({
            devNo: this.validateForm.controls.devNo.value || '',
            devType: this.validateForm.controls.devType.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devCatalog: this.validateForm.controls.devCatalog.value || '',
            orgNo: this.validateForm.controls.upper.value.no || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        }).subscribe(
            data => {
                // console.log('查询设备:', data.data);
                this.loading = false;
                if (data.data) {
                    this.devList = data.data;
                    this.page.totalRow = data.page.totalRow;
                } else {
                    this.devList = [];
                    this.page.totalRow = 0;
                }
            },
            error => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.refreshStatus();
    }

    /**
     * 重置整个页面
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.validateForm.controls.upper.setValue({});
        this.validateForm.controls.devCatalog.setValue('');
        this.coverControlBtn = false;
        document.getElementById('resultDiv').style.display = 'none';
        this.showDevs = true;
        this.uploadVisible = false;
        this.loadResult = false;
        document.getElementById('documentDiv').style.display = 'none';
        this.resultSerial = 1;
        this.selDevNum = 0;
        this.showScreen = false;
        this.showLog = false;
        this.controlResult = [];
        this.loading = false;
        this.chkExe = false;
        this.chkDel = false;
        this.page2 = new Page();
        this.viewPath = '';
        this.logStartDate = null;
        this.logEndDate = null;
        this.devNo = null;
        this.refreshData(true);
        this.allChecked = false;
        this.indeterminate = false;
    }

    cancel() {

    }

    /**
     * 刷新全选按钮状态
     * @private
     */
    refreshStatus() {
        if (this.devList.length > 0) {
            const allChecked = this.devList.every(value => value.checked === true);
            const allUnChecked = this.devList.every(value => !value.checked);
            this.allChecked = allChecked;
            this.indeterminate = (!allChecked) && (!allUnChecked);
        }
    }

    /**
     * 全选/全不选
     * @param value
     * @private
     */
    checkAll(value) {
        if (value) {
            this.devList.forEach(data => data.checked = true);
        } else {
            this.devList.forEach(data => data.checked = false);
        }
        this.refreshStatus();
    }

    /**
     * 显示屏幕选择窗口（远程抓屏）
     */
    toggleScreenSelect() {
        if (this.devList.filter(x => x.checked).length === 0) {
            this.message.error('请选择设备后再操作');
            return;
        }
        if (!this.screenFlag) {
            this.screenFlag = null;
        }
        this.showScreen = !this.showScreen;
    }

    /**
     * 显示选择日志日期范围（电子日志）
     */
    toggleLogRangeSelect() {
        if (this.devList.filter(x => x.checked).length === 0) {
            this.message.error('请选择设备后再操作');
            return;
        }
        if (!this.showLog) {
            this.logStartDate = null;
            this.logEndDate = null;
        }
        this.showLog = !this.showLog;
    }

    /**
     * 校验所选的开始日期（电子日志）
     */
    startDateChange() {
        if (this.logEndDate && this.logStartDate > this.logEndDate) {
            this.logEndDate = null;
            this.message.error('开始日期不能晚于结束日期');
        }
    }

    /**
     * 校验所选的结束日期（电子日志）
     */
    endDateChange() {
        if (this.logEndDate < this.logStartDate) {
            this.logStartDate = null;
            this.message.error('开始日期不能晚于结束日期');
        }
    }

    /**
     * 执行控制命令
     * @param cmdId
     */
    control(cmdId) {
        this.resultSerial = 1;
        // 获取选中的设备
        const selDevs = this.devList.filter(x => x.checked);
        // 未选择设备
        if (selDevs.length === 0) {
            this.message.error('请选择设备后再操作');
            return;
        }
        if (cmdId === '200007') {
            this.toggleScreenSelect();
        }
        let startDate, endDate;
        if (cmdId === '200003') {
            const now = new Date();
            if (!this.logStartDate || !this.logEndDate ) {
                this.message.error('请选择开始日期和结束日期');
                return;
            }
            if (this.logStartDate > now || this.logEndDate > now) {
                this.message.error('开始日期和结束日期不能晚于当前日期');
                return;
            }
            if (this.devControlService.diffDate(this.logStartDate, this.logEndDate) > 7) {
                this.message.error('最多选择七天');
                return;
            }
            this.toggleLogRangeSelect();
            this.logStartDate.setHours(this.logStartDate.getHours() + 8);
            startDate = this.logStartDate.toISOString();
            startDate = startDate.substring(0, 10);
            this.logEndDate.setHours(this.logEndDate.getHours() + 8);
            endDate = this.logEndDate.toISOString();
            endDate = endDate.substring(0, 10);
        }
        this.coverControlBtn = true;
        this.selDevNum = selDevs.length;
        const selDevNos = [];
        for (const dev of selDevs) {
            selDevNos.push(dev.devNo);
        }
        document.getElementById('documentDiv').style.display = 'none';
        this.controlResult = [];
        this.currentCmdId = cmdId;
        this.devControlService.remoteControl({
            cmdId: cmdId,
            devList: selDevNos,
            userNo: this.session.getUserSession().account,
            screenFlag: this.screenFlag,
            restartType: '1',
            shutdownType: '1',
            startDate: startDate,
            endDate: endDate,
            sessionId: this.sessionId,
            fileFlag: this.getFileFlag(cmdId)
        }).subscribe(
            data => {
                this.showDevs = false;
                document.getElementById('resultDiv').style.display = 'block';
                this.loadResult = true;
                this.message.info('请求已发送，请等待结果');
            }, error => {
                console.log(error);
                this.showDevs = false;
                this.coverControlBtn = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 获取文件标识
     * @param cmdId
     */
    private getFileFlag(cmdId: string): string {
        let fileFlag;
        switch (cmdId) {
            case '200007':
            case '200028':
            case '200003':
            case '200008':
            case '200016':
            case '200021':
            case '200022':
                fileFlag = '1';
                break;
            case '200024':
            case '200027':
            case '200026':
            case '200011':
            case '200014':
            case '200015':
                fileFlag = '0';
                break;
            default:
                fileFlag = '';
        }
        return fileFlag;
    }

    /**
     * 开启远程控制结果推送监听
     */
    _startWebSocket() {
        const ws = this.webSocketService.createObservableSocket(`${environment.WEBSOCKET_URL}` + '/control/websocket?token='
            + this.session.token + '&userNo=' + this.session.getUserSession().account)
            .subscribe(
                _data => {
                    this.loadResult = false;
                    const data = JSON.parse(_data);
                    console.log('websocket:', data);
                    if (data.sessionId && data.sessionId != '') {
                        this.sessionId = data.sessionId;
                    } else {
                        this._pushControlResult(data);
                    }
                }, error => {
                    this.loadResult = false;
                    console.log(error);
                    this.message.error('获取控制结果出错');
                }
            );
    }

    /**
     * 将推送的结果保存到表中
     * @param data
     */
    _pushControlResult(data) {
        console.log('push:', data);
        this.selDevNum--;
        // ngFor和ngIf都是完全移除元素，因此其中的节点无法通过原生js操作，故使用display属性来实现内容的隐藏
        // 使用innerHTML设置表格内容
        const downloadPath = `${environment.SERVER_URL}` + '/control/remote/download?type=result&fileName=' + data.localFile
            + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token + '&fileRealName='
            + data.fileName + data.fileProp;
        this.controlResult.push({
            no: data.no,
            ip: data.ip,
            localFile: data.localFile,
            token: this.session.token,
            result: data.result,
            resultContent: data.resultContent,
            serial: this.resultSerial++,
            fileName: data.fileName + data.fileProp,
            hasFile: data.fileFlag === '1',
            downloadPath: downloadPath
        });
        if (this.selDevNum === 0) {
            this.loadResult = false;
            this.coverControlBtn = false;
        }
    }
    // 点击查看详情弹出模态框
    clickOpenModel (data) {
        console.log('data:');
        // if (data.result !== '成功') { return false; }
        switch (this.currentCmdId) {
            case '200003':
                this.openLogInfo(data);
                break;
            case '200008':
                this.openProcess(data);
                break;
            case '200016':
                this.openSoftware(data);
                break;
            case '200021':
                this.openHardware(data);
                break;
            case '200022':
                this.openSystem(data);
                break;
            case '200028':
                this.openStutas(data);
                break;
            default:
                console.log('不正确!');
        }
    }
    // 打开模态框显示软件信息
    openSoftware(data) {
        this.confirmService.open({
            title: '软件信息',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: SoftwareInfoComponent,
            componentParams: {
                deviceInfo: data
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    // 打开模态框显示硬件信息
    openHardware(data) {
        this.confirmService.open({
            title: '硬件信息',
            maskClosable: false,
            footer: false,
            width: '540px',
            content: HardwareInfoComponent,
            componentParams: {
                deviceInfo: data
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    // 打开设备状态
    openStutas(data) {
        this.confirmService.open({
            title: '设备状态检测详情',
            maskClosable: false,
            footer: false,
            width: '540px',
            content: StatusInfoComponent,
            componentParams: {
                deviceInfo: data
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    // 打开模态框显示系统信息
    openSystem(data) {
        this.confirmService.open({
            title: '系统信息',
            maskClosable: false,
            footer: false,
            width: '540px',
            content: SystemInfoComponent,
            componentParams: {
                deviceInfo: data
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    // 打开模态框显示进程信息
    openProcess(data) {
        this.confirmService.open({
            title: '进程信息',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: ProcessInfoComponent,
            componentParams: {
                deviceInfo: data
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    // 打开模态框显示日志信息
    openLogInfo(data) {
        this.confirmService.open({
            title: '日志详情',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: LogInfoComponent,
            componentParams: {
                logInfo: data
            },
            onOk: () => {
            },
            onCancel: () => {
            },
        });
    }
    /**
     * 远程浏览
     */
    remoteView() {
        const selDevs = this.devList.filter(x => x.checked);
        if (selDevs.length === 0) {
            this.message.error('请选择设备后再操作');
            return;
        } else if (selDevs.length > 1) {
            this.message.error('远程浏览只能选择一台设备');
            return;
        }
        this.showDevs = false;
        document.getElementById('documentDiv').style.display = 'block';
        document.getElementById('viewTable').style.display = 'none';
        document.getElementById('resultDiv').style.display = 'none';
        this.loadResult = true;
        this.coverControlBtn = true;
        this.controlResult = [];
        this.devNo = selDevs[0].devNo;
        this._setPath('', 0);
        this.initDevDir();
    }

    /**
     * 显示当前设备和浏览目录
     * @param path
     * @param flag
     */
    _setPath(path, flag) {
        document.getElementById('currentPath').innerHTML = '';
        let text;
        if (flag === 1) {
            text = path;
        } else {
            text = '';
        }
        const textNode = document.createTextNode(text);
        document.getElementById('currentPath').appendChild(textNode);
    }

    /**
     * 远程浏览初始化文件列表
     */
    initDevDir() {
        const params = {
            devNo: this.devNo,
            upDoc: 0,
            userNo: this.session.getUserSession().account,
        };
        this.devControlService.remoteView(params)
            .subscribe(_data => {
                    const data = _data.data;
                    // 返回文件浏览页面
                    this.chkDel = this.checkBtn('设备控制', '删除文件');
                    this.chkExe = this.checkBtn('设备控制', '执行文件');
                    // 磁盘界面路径设置为空
                    this.viewPath = '';
                    this.documentFileList = data.documentFileList;
                    this.documentFileList.forEach(x => {
                        x.diskName = x.diskName.replace(/\|/g, '');
                    });
                    console.log(this.documentFileList);
                    document.getElementById('viewTable').style.display = 'block';
                    this.coverControlBtn = false;
                    this.loadResult = false;
                }, error => {
                    console.log(error);
                    this.loadResult = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
    }

    /**
     * 打开目录
     * @param path
     * @param filePath
     */
    openDir(path, filePath) {
        this.coverControlBtn = true;
        this.loadResult = true;
        document.getElementById('viewTable').style.display = 'none';
        const params = {
            devNo: this.devNo,
            upDoc: 0,
            viewPath: this.viewPath === 'DISK' ? '' : this.viewPath,
            docName: filePath,
            userNo: this.session.getUserSession().account,
        };
        this.devControlService.remoteView(params).subscribe(
            _data => {
                const data = _data.data;
                this.chkDel = this.checkBtn('设备控制', '删除文件');
                this.chkExe = this.checkBtn('设备控制', '执行文件');
                this.viewPath = data.viewPath;
                // 将\\替换为\
                this.viewPath = this.viewPath.replace('\\\\', '\\');
                this.documentFileList = data.documentFileList;
                this.coverControlBtn = false;
                this.loadResult = false;
                document.getElementById('viewTable').style.display = 'block';
                this._setPath(this.viewPath, 1);
            }, error => {
                console.log(error);
                this.loadResult = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 远程浏览下载文件
     * @param viewPath 当前浏览路径
     * @param fileName 文件名
     * @param fileType
     * @param fileSize
     */
    viewDownloadFile(viewPath, fileName, fileType, fileSize) {
        viewPath = viewPath.endsWith('\\') ? viewPath : viewPath + '\\';
        // const filePath = viewPath) + fileName);
        // 检测文件是否正在下载（感觉没必要）
        // this.devControlService.checkDownloadStatus({
        //     userNo: this.session.getUserSession().account,
        //     file: filePath
        // }).subscribe(
        //     data => {
        //         if (data.retCode == 'A0') {
        //             this.message.warning('文件正在下载，请从远程控制结果中查看下载详情');
        //         } else {
        if (fileSize.indexOf('G') !== -1) {
            this.message.error('文件超过100MB，无法下载！');
            return;
        } else if (fileSize.indexOf('M') !== -1) {
            if (parseInt(fileSize.split(' ')[0], 0) > 100) {
                alert('文件超过100MB，无法下载！');
                return;
            }
        }
        const params = {
            devNo: this.devNo,
            fileName: fileName,
            viewPath: viewPath,
            fileMode: fileType,
            fileSize: fileSize,
            userNo: this.session.getUserSession().account
        };
        this.devControlService.viewDownloadFile(params).subscribe(
            data2 => {
            }, error2 => {
                console.log(error2);
                if (error2 instanceof HttpResponse) {
                    this.message.error(error2.body.retMsg);
                }
            }
        );
        this.confirmService.info({
            title: '已添加到下载列表',
            okText: '查看',
            onOk: () => {
                if (!this.listOpen) {
                    this.listOpen = true;
                }
                this.getDownloadFileList();
            },
            cancelText: '关闭'
        });
        //         }
        //     }, error => {
        //         console.log(error);
        //         if (error instanceof HttpResponse) {
        //             this.message.error(error.body.retMsg);
        //         }
        //     }
        // );
    }

    /**
     * 远程浏览执行文件
     * @param viewPath
     * @param fileName
     */
    executeFile(viewPath, fileName) {
        let filePath;
        if (viewPath.length === 3) {
            filePath = viewPath + fileName;
        } else {
            filePath = viewPath + '\\' + fileName;
        }
        this.devControlService.executeFile({
            devNo: this.devNo,
            filePath: filePath,
            userNo: this.session.getUserSession().account
        }).subscribe(
            data => {
                if (data.retCode == RET_CODE.SUCCESS) {
                    this.message.success('执行成功');
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 远程浏览删除文件
     * @param viewPath
     * @param fileName
     */
    deleteFile(viewPath, fileName) {
        let filePath;
        if (viewPath.length === 3) {
            filePath = viewPath + fileName;
        } else {
            filePath = viewPath + '\\' + fileName;
        }
        this.devControlService.deleteFile({
            devNo: this.devNo,
            filePath: filePath,
            userNo: this.session.getUserSession().account
        }).subscribe(
            data => {
                if (data.retCode == RET_CODE.SUCCESS) {
                    this.message.success('删除成功');
                }
                // 删除成功后移除文件
                for (let i = 0; i < this.documentFileList.length; i++) {
                    if (this.documentFileList[i].fileName === fileName) {
                        this.documentFileList.splice(i, 1);
                        break;
                    }
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 远程浏览返回上一级目录
     */
    upIndex() {
        if (this.viewPath === '') {
            return;
        }
        this.coverControlBtn = true;
        this.loadResult = true;
        document.getElementById('viewTable').style.display = 'none';
        const params = {
            devNo: this.devNo,
            upDoc: 1,
            viewPath: this.viewPath === 'DISK' ? '' : this.viewPath,
            userNo: this.session.getUserSession().account,
        };
        this.devControlService.remoteView(params).subscribe(
            _data => {
                const data = _data.data;
                this.chkDel = this.checkBtn('设备控制', '删除文件');
                this.chkExe = this.checkBtn('设备控制', '执行文件');
                this.viewPath = data.viewPath;
                // 将\\替换为\
                this.viewPath = this.viewPath.replace('\\\\', '\\');
                this.documentFileList = data.documentFileList;
                this.coverControlBtn = false;
                this.loadResult = false;
                document.getElementById('viewTable').style.display = 'block';
                this._setPath(this.viewPath, 1);
            }, error => {
                this.loadResult = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 下载列表是否显示
     */
    toggleDownloadList() {
        if (!this.listOpen) {
            this.getDownloadFileList();
        }
        this.listOpen = !this.listOpen;
    }

    /**
     * 获取文件下载列表
     */
    getDownloadFileList() {
        const params = {
            pageSize: this.page2.pageSize,
            curPage: this.page2.curPage,
            devNo: this.devNo
        };
        this.devControlService.getDownloadFileList(params).subscribe(
            _data => {
                if (_data.data) {
                    this.downloadFileList = _data.data;
                    this.downloadFileList.forEach(x => {
                        const tmp = x.filePath.substring(x.filePath.lastIndexOf('/') + 1);
                        let realName = '';
                        let realSuffix = '';
                        // 获取文件路径中的文件后缀TraceLog.txt
                        if (x.fileName.lastIndexOf('.') == -1) {
                            // 文件没有后缀
                            realName = x.fileName.substring(x.fileName.lastIndexOf('\\') + 1);
                        }else {
                            realName = x.fileName.substring(x.fileName.lastIndexOf('\\') + 1, x.fileName.lastIndexOf('.'));
                            realSuffix = '.' + x.filePath.substring(x.filePath.lastIndexOf('.') + 1);
                        }
                        x.filePath = `${environment.SERVER_URL}` + '/control/remote/download?type=view&fileName=' + tmp
                            + '&fileRealName=' + realName + realSuffix
                            + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
                    });
                } else {
                    this.downloadFileList = [];
                }
                this.page2.totalRow = _data.page.totalRow;
                this.page2.totalPage = _data.page.totalPage;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 显示文件上传模态框
     */
    toggleUpload() {
        if (this.uploadVisible) {
            this.uploader.cancelAll();
            this.uploader.clearQueue();
            // @ts-ignore
            document.getElementById('fileUploadInput').value = '';
        }
        this.uploadVisible = !this.uploadVisible;
    }

    /**
     * 上传文件配置
     */
    uploader: FileUploader = new FileUploader({
        url: `${environment.SERVER_FILE_URL}` + '/control/remote/uploadFile',
        headers: [
            {name: 'userNo', value: this.session.getUserSession().account},
            {name: 'token', value: this.session.token}
        ],
        method: 'POST',
        itemAlias: 'file',
        autoUpload: false
    });

    /**
     * 远程浏览上传文件
     */
    uploadFile() {
        this.loading = true;
        // 上传成功回调函数
        this.uploader.onSuccessItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            if (result.retCode == RET_CODE.FAIL) {
                this.message.error(result.retMsg);
                return;
            }
            const filePath = result.data.filePath;
            const fileName = result.data.fileName;

            // 续传
            let uploadType = '0';
            for (let i = 0; i < this.documentFileList.length; i++) {
                if (fileName == this.documentFileList[i].fileName) {
                    uploadType = '1';
                    break;
                }
            }
            let viewPath = document.getElementById('currentPath').innerHTML;
            viewPath = viewPath.length == 3 ? viewPath.substring(0, 2) : viewPath;
            this.message.info('文件上传已开始');
            // 上传到c端
            this.devControlService.viewUploadFile({
                devNo: this.devNo,
                filePath: filePath,
                fileName: fileName,
                viewPath: viewPath,
                uploadType: uploadType,
                userNo: this.session.getUserSession().account
            }).subscribe(
                data => {
                    this.message.success(data.retMsg);
                    this.toggleUpload();
                    this.reloadFiles();
                    this.loading = false;
                }, error => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                    this.toggleUpload();
                    this.loading = false;
                }
            );
        };
        // 上传失败回调函数
        this.uploader.onErrorItem = (item, response, status, headers) => {
            const result = JSON.parse(response);
            console.log(result);
            this.message.error('上传文件失败');
            this.toggleUpload();
        };
        this.uploader.uploadAll();
    }

    /**
     * 刷新文件列表
     */
    reloadFiles() {
        this.coverControlBtn = true;
        this.loadResult = true;
        document.getElementById('viewTable').style.display = 'none';
        const params = {
            devNo: this.devNo,
            upDoc: 0,
            viewPath: this.viewPath === 'DISK' ? '' : this.viewPath,
            userNo: this.session.getUserSession().account,
        };
        this.devControlService.remoteView(params).subscribe(
            _data => {
                const data = _data.data;
                this.chkDel = this.checkBtn('设备控制', '删除文件');
                this.chkExe = this.checkBtn('设备控制', '执行文件');
                this.viewPath = data.viewPath;
                // 将\\替换为\
                this.viewPath = this.viewPath.replace('\\\\', '\\');
                this.documentFileList = data.documentFileList;
                this.coverControlBtn = false;
                this.loadResult = false;
                document.getElementById('viewTable').style.display = 'block';
                this._setPath(this.viewPath, 1);
            }, error => {
                this.loadResult = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 根据机构品牌刷新可选机构型号列表
     * @param event
     */
    refreshDevType(event) {
        if (event != '') {
            this.selectableDevTypeList = this.devTypeList.filter(x => x.devVendor == event);
        } else {
            this.selectableDevTypeList = this.devTypeList;
        }
    }

    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        return this.menuService.checkBtn(menuName, btnName);
    }

    // 显示抓屏弹出框
    previewRes(data) {
        this.selectedPic = this.screenImgUrl + data.localFile;
        this.downloadPic = data.downloadPath;
        this.previewVisible = true;
    }

}
