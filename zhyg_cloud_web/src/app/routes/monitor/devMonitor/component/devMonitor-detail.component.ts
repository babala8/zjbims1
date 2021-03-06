import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {DevMonitorService} from '../devMonitor.service';
import {Page} from '../../../../models/page';
import {FaultQueryDetailComponent} from '../../../maintain/faultQuery/component/faultQuery-detail.component';
import {FaultQueryFollowComponent} from '../../../maintain/faultQuery/component/faultQuery-follow.component';
import {FaultQueryNoticeComponent} from '../../../maintain/faultQuery/component/faultQuery-notice.component';
import {FaultQueryService} from '../../../maintain/faultQuery/faultQuery.service';

@Component({
    templateUrl: './devMonitor-detail.html',
})
export class DevMonitorDetailComponent implements OnInit {
    matrixEventdata;
    loading = false;
    devNo: string;
    devip: string;
    address: string;
    devType: string;
    awayFlag: string;
    devService: string;
    workType: string;
    cashType: string;
    orgNo: string;
    orgName: string;
    devManager: string;
    devRunStatus: string;
    devModStatus: string;
    devCashboxStatus: string;
    devNetStatus: string;
    idcCaptureBinCount: string;
    // idcStatus: string;
    // cimStatus: string;
    // depStatus: string;
    // rprStatus: string;
    // jprStatus: string;
    // pinStatus: string;
    // siuStatus: string;
    // pbkStatus: string;
    statusList = [];
    system: string;
    version: string;
    patchVersion: string;
    serialNoInfoStatus: string;
    txtInfoStatus: string;
    memory: string;
    disk: string;
    cpu: string;

    dataSet = [];
    page = new Page();
    faultList = [];
    cBoxList = [];
    cBoxSize = 0;

    constructor(
        private nzModal: NzModalSubject,
        private serivce: DevMonitorService,
        private message: NzMessageService,
        private modal: NzModalService,
        private faultQueryService: FaultQueryService
    ) {

    }

    ngOnInit(): void {
        const params = {
            devNo: this.matrixEventdata,
        };
        this.serivce.getDevStatus(params).subscribe(
            _data => {
                if (_data) {
                    console.log(_data);
                    this.loading = false;
                    this.devNo = _data.data.devBaseInfo.no;
                    this.devip = _data.data.devBaseInfo.ip;
                    this.address = _data.data.devBaseInfo.address;
                    // this.devType = _data.data.devBaseInfo.devType;
                    this.devType = _data.data.devTypeName;
                    if (_data.data.devBaseInfo.awayFlag === '1') {
                        this.awayFlag = '在行';
                    } else if (_data.data.devBaseInfo.awayFlag === '2') {
                        this.awayFlag = '离行';
                    }
                    this.devService = _data.data.devBaseInfo.devService;
                    if (_data.data.devBaseInfo.workType === '1') {
                        this.workType = '自营';
                    } else if (_data.data.devBaseInfo.workType === '2') {
                        this.workType = '联营';
                    }
                    if (_data.data.devBaseInfo.cashType === '1') {
                        this.cashType = '现金';
                    } else if (_data.data.devBaseInfo.cashType === '2') {
                        this.cashType = '非现金';
                    }

                    this.orgNo = _data.data.devBaseInfo.orgNo;
                    this.orgName = _data.data.orgName;
                    this.devManager = _data.data.devManager;
                    this.devRunStatus = _data.data.devStatusInfo.devRunStatus;
                    this.devModStatus = _data.data.devStatusInfo.devModStatus;
                    this.devCashboxStatus = _data.data.devStatusInfo.devCashboxStatus;
                    this.devNetStatus = _data.data.devStatusInfo.devNetStatus;
                    const temp = _data.data.devStatusInfo.idcCaptureBinCount;
                    if ( temp == null || temp == '') {
                        this.idcCaptureBinCount = '0';
                    } else {
                        this.idcCaptureBinCount = temp;
                    }

                    const tmpList = [];
                    let tmp = _data.data.devStatusInfo.idcDeviceStatus;
                    if (tmp && tmp != '' && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('idc')});
                    }
                    tmp = _data.data.devStatusInfo.pinDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('pin')});
                    }
                    tmp = _data.data.devStatusInfo.siuDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('siu')});
                    }
                    tmp = _data.data.devStatusInfo.cimDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('cim')});
                    }

                    tmp = _data.data.devStatusInfo.cdmDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('cdm')});
                    }
                    tmp = _data.data.devStatusInfo.crdDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('crd')});
                    }
                    tmp = _data.data.devStatusInfo.rprDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('rpr')});
                    }
                    tmp = _data.data.devStatusInfo.jprDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('jpr')});
                    }
                    tmp = _data.data.devStatusInfo.depDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('dep')});
                    }
                    tmp = _data.data.devStatusInfo.pbkDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('pbk')});
                    }
                    tmp = _data.data.devStatusInfo.ircDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('irc')});
                    }
                    tmp = _data.data.devStatusInfo.sprDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('spr')});
                    }
                    tmp = _data.data.devStatusInfo.fpiDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('fpi')});
                    }
                    tmp = _data.data.devStatusInfo.iccDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('icc')});
                    }
                    tmp = _data.data.devStatusInfo.camDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('cam')});
                    }
                    tmp = _data.data.devStatusInfo.dprDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('dpr')});
                    }
                    tmp = _data.data.devStatusInfo.upsDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('ups')});
                    }
                    tmp = _data.data.devStatusInfo.chkDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('chk')});
                    }
                    tmp = _data.data.devStatusInfo.ttuDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('ttu')});
                    }
                    tmp = _data.data.devStatusInfo.bcrDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('bcr')});
                    }
                    tmp = _data.data.devStatusInfo.iscDeviceStatus;
                    if (tmp && tmp != ''  && tmp != 'NO') {
                        tmpList.push({status: tmp, name: this.serivce.convert('isc')});
                    }
                    console.log(tmpList);
                    const flag = tmpList.length % 2 == 1;
                    for (let i = 0; i < Math.floor(tmpList.length / 2); i++) {
                        this.statusList.push([tmpList[i * 2], tmpList[i * 2 + 1]]);
                    }
                    if (flag) {
                        this.statusList.push([tmpList[tmpList.length - 1]]);
                    }
                    console.log(' 模块状态：' + this.statusList);

                    if (_data.data.devSoftware === null) {
                        this.system = '';
                        this.version = '';
                        this.patchVersion = '';
                        this.serialNoInfoStatus = '';
                        this.memory = '';
                        this.disk = '';
                        this.cpu = '';
                    } else {
                        this.system = _data.data.devSoftware.operatingSys;
                        this.version = _data.data.devSoftware.operatingVersion;
                        this.patchVersion = _data.data.devSoftware.operatingPatchVersion;
                        if (_data.data.devBaseInfo.serialNoInfoStatus === '1') {
                            this.serialNoInfoStatus = '开启';
                        } else if (_data.data.devBaseInfo.serialNoInfoStatus === '2') {
                            this.serialNoInfoStatus = '关闭';
                        } else {
                             // this.serialNoInfoStatus = ' ';
                             this.serialNoInfoStatus = '未知';
                        }
                        if (_data.data.devBaseInfo.txtInfoStatus === '1') {
                            this.txtInfoStatus = '开启';
                        } else if (_data.data.devBaseInfo.txtInfoStatus === '2') {
                            this.txtInfoStatus = '关闭';
                        } else {
                            // this.txtInfoStatus = ' ';
                            this.txtInfoStatus = '未知';
                        }
                        this.memory = _data.data.devHardware.hardwareMemory;
                        this.disk = _data.data.devHardware.hardwareHardisk;
                        this.cpu = _data.data.devHardware.hardwareCpu;
                    }

                }
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    qryCase(reset = false) {
        console.log('case设备查询');
        this.loading = true;
        const params = {
            devNo: this.devNo,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            status: 'O'
        };
        this.faultQueryService.getCase(params)
            .subscribe(_data => {
                if (_data.data) {
                    _data.data.forEach(data1 => {
                        if (data1.currentstatus == 1) {
                            data1.currentstatus = '已创建';
                        }else if (data1.currentstatus == 2) {
                            data1.currentstatus = '已通知';
                        }else if (data1.currentstatus == 3) {
                            data1.currentstatus = '通知升级';
                        }else if (data1.currentstatus == 4) {
                            data1.currentstatus = '已确认';
                        }else if (data1.currentstatus == 5) {
                            data1.currentstatus = '响应升级';
                        }else if (data1.currentstatus == 6) {
                            data1.currentstatus = '已响应';
                        }else if (data1.currentstatus == 7) {
                            data1.currentstatus = '故障升级';
                        }else if (data1.currentstatus == 8) {
                            data1.currentstatus = '已挂起';
                        }else if (data1.currentstatus == 9) {
                            data1.currentstatus = '已关闭';
                        }
                    });
                    this.dataSet = _data.data;
                    console.log(_data.page);
                    this.page.totalRow = _data.page.totalRow;
                }else {
                    this.dataSet = [];
                    this.page.totalRow = 0;
                }
                this.loading = false;
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    showDetail(cases) {
        const modal = this.modal.open({
            title: 'CASE详情',
            content: FaultQueryDetailComponent,
            width: '80%',
            componentParams: {
                cases: cases
            },
            onOk: () => {
                this.qryCase();
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 1001
        });
    }

    showFollow(cases) {
        const modal = this.modal.open({
            title: 'CASE跟踪',
            content: FaultQueryFollowComponent,
            width: '80%',
            componentParams: {
                cases: cases
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 1001
        });
    }

    showNotice(cases) {
        const modal = this.modal.open({
            title: 'CASE通知',
            content: FaultQueryNoticeComponent,
            width: '80%',
            componentParams: {
                cases: cases,
                status: 'O'
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 1001
        });
    }

    qryFault() {
        console.log('设备故障查询');
        this.loading = true;
        const param = {
            devNo: this.devNo
        };
        this.serivce.getDevFaultInfo(param)
            .subscribe(data => {
                if (data.data) {
                    this.faultList = data.data;
                    this.loading = false;
                } else {
                    this.faultList = [];
                }
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    qryCashBoxInfo() {
        console.log('查询设备钞箱信息');
        this.loading = true;
        const params = {
            devNo: this.devNo
        };
        this.serivce.getCashBoxInfo(params)
            .subscribe(data => {
                if (data.data.cBoxSize != null && data.data.cBoxList != null ) {
                    this.cBoxSize = parseInt(data.data.cBoxSize, 10);
                    this.cBoxList = data.data.cBoxList;
                    console.log('数据是：' + this.cBoxList );
                    this.cBoxList.forEach( item => {
                        item[9] = this.serivce.parseCurrencyType(item[9]);

                    });
                    this.loading = false;
                }
            }, (error) => {
                console.log(error);
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
        });
    }
}
