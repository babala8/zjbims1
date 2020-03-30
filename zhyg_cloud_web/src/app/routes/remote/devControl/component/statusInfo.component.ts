import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevControlService} from '../devControl.service';
@Component({
    templateUrl: './statusInfo.html',
    styleUrls: ['./model-style.less']
})

export class StatusInfoComponent implements OnInit, OnDestroy {
    deviceInfo: {
        ip: '',
        no: '',
        localFile: '',
        token: ''
    };

    statusInfo = {
        // 读卡器模块
        idcMap: {
            idcDeviceStatus: '',
            idcMedia: '',
            idcRetainBin: '',
            idcCards: '',
        },
        // 身份证模块
        ircMap: {
            ircDeviceStatus: '',
            ircMedia: '',
        },
        // 密码键盘模块
        pinMap: {
            pinDeviceStatus: '',
        },
        // 凭条打印机模块
        rprMap: {
            rprDeviceStatus: '',
            rprMedia: '',
            rprSupplyLevel: '',
            rprRetractBin: '',
            rprPtrRetBinCounts: '',
            rprToner: '',
            rprInk: '',
        },
        // 日志打印机模块
        jprMap: {
            jprDeviceStatus: '',
            jprMedia: '',
            jprSupplyLevel: '',
            jprRetractBin: '',
            jprPtrRetBinCounts: '',
            jprToner: '',
            jprInk: '',
        },
        // 取款模块
        cdmMap: {
            cdmDeviceStatus: '',
            cdmSafeDoor: '',
            cdmCashUnits: '',
            cdmIntermediateStacker: '',
            cdmPosiList: [],
            cdmBinList: []
        },
        // 存款模块
        cimMap: {
            cimDeviceStatus: '',
            cimCashUnits: '',
            cimSafeDoor: '',
            cimIntermediateStacker: '',
            cimPosiList: [],
            cimBinList: []
        },
        // 信封模块
        depMap: {
            depDeviceStatus: '',
            depTransport: '',
            depContainer: '',
            depEnvelopeSupply: '',
            depEnvelopeDispenser: '',
            depPrinter: '',
            depToner: '',
            depShutter: '',
            depNumOfDeposits: '',
        },
        // 文本终端单元模块
        ttuMap: {
            ttuDeviceStatus: '',
        },
        // 传感器模块
        siuMap: {
            siuDeviceStatus: '',
            siuOperatorSwitch: '',
            siuCabinet: '',
            siuSafe: '',
            siuOpenClose: '',
        },
        // 照相机模块
        camMap: {
            camDeviceStatus: '',
            camList: [],

        },
        // pjc无纸化模块
        pjcMap: {
            pjcDeviceStatus: '',
            pjcSendtime: '',
            pjcEjdate: '',
            pjcServiceStatus: '',
            pjcNsend: '',
        },

    };
    constructor(
        private session: SessionService,
        private message: NzMessageService,
        private devControlService: DevControlService
    ) {}
    ngOnInit() {
        console.log(this.deviceInfo);
        this.devControlService.getStatusInfo({
            fileName: this.deviceInfo.localFile,
            token: this.deviceInfo.token,
            type: 'result'
        }).subscribe(
            data => {
                console.log(data);
                if (data.retCode == 'fail') {
                    this.message.error(data.retMsg);
                    return;
                }else {
                    this.message.success(data.retMsg);
                }
                this.statusInfo = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );

    }
    ngOnDestroy() {}
}
