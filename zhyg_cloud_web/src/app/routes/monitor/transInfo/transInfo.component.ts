import {Component, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {NzMessageService, NzModalService, NzNotificationService} from 'ng-zorro-antd';
import {OrgService} from '../../system/org/org.service';
import {TransInfoService} from './transInfo.service';
import {SessionService} from '@core/session.service';
import {SysMenuService} from '../../system/menu/menu.service';
import {DevService} from '../../system/dev/dev.service';
import {Page} from '../../../models/page';

@Component({
    templateUrl: './transInfo.html',
})
export class TransInfoComponent implements OnInit {
    loading = false;
    validateForm: FormGroup;
    devVendorList: { no: string, name: string }[] = [];
    devTypeList: { no: string, name: string }[] = [];
    transTypeList: { no: string, name: string }[] = [];
    transStatusList = [];
    // 最小金额条件是否可填
    minCashSwitch = true;
    // 最大金额条件是否可填
    maxCashSwitch = true;
    page = new Page();
    transInfoList = [];

    constructor(
        private fb: FormBuilder,
        private message: NzMessageService,
        private orgService: OrgService,
        private transInfoService: TransInfoService,
        private session: SessionService,
        private confirmService: NzModalService,
        private menuService: SysMenuService,
        private devService: DevService) {

    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            devVendor: [null],
            devNo: [null],
            upper: [{no: '', name: ''}],
            devType: [null],
            minCash: [null],
            maxCash: [null],
            transType: [null],
            transStatus: [null],
        });
        this.devService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                this.message.error(error.body.retMsg);
            }
        );
        this.devService.getDevTypeByVendor({}).subscribe(
            data => {
                this.devTypeList = data.data;
            }, error => {
                console.log(error);
                this.message.error(error.body.retMsg);
            }
        );
        this.transInfoService.qryTransType().subscribe(
            data => {
                this.transTypeList = data.data;
            }, error => {
                console.log(error);
                this.message.error(error.body.retMsg);
            }
        );
        this.transStatusList = this.transInfoService.qryTransStatus();
        this.queryDev();
    }

    /**
     * 选择设备品牌后刷新设备型号列表
     */
    qryDevType(devVendor) {
        this.devService.getDevTypeByVendor({devVendor: devVendor}).subscribe(
            data => {
                console.log(data.data);
                if (data.data) {
                    this.devTypeList = data.data;
                }
            }, error => {
                this.message.error(error.body.retMsg);
                console.log(error);
            }
        );
    }

    /**
     * 是否显示交易金额筛选条件
     */
    showTransCash(transType) {
        console.log('transType:' + transType);
        if (transType === 'CWD' || transType === 'TFR' || transType === 'CDP' || transType === 'CWC'
            || transType === 'YDP' || transType === 'LTP' || transType === 'DXP') {
            console.log('im here');
            this.minCashSwitch = false;
            this.validateForm.controls.minCash.setValue('');
            this.maxCashSwitch = false;
            this.validateForm.controls.maxCash.setValue('');
        } else {
            this.minCashSwitch = true;
            this.validateForm.controls.minCash.setValue('');
            this.maxCashSwitch = true;
            this.validateForm.controls.maxCash.setValue('');
        }
    }

    queryDev(refresh = false) {
        if (refresh) {
            this.page.curPage = 1;
        }
        const minCash = this.validateForm.controls.minCash.value;
        const maxCash = this.validateForm.controls.maxCash.value;
        if (minCash !== '' && maxCash !== '' && parseInt(minCash, 0) > parseInt(maxCash, 0)) {
            this.message.error('交易金额输入错误');
            this.validateForm.controls.minCash.setValue('');
            this.validateForm.controls.maxCash.setValue('');
        }
        this.loading = true;
        const params = {
            transType: this.validateForm.controls.transType.value || '',
            orgNo: this.validateForm.controls.upper.value.no || '',
            devNo: this.validateForm.controls.devNo.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            transStatus: this.validateForm.controls.transStatus.value || '',
            minCash: this.validateForm.controls.minCash.value || '',
            maxCash: this.validateForm.controls.maxCash.value || '',
            userNo: this.session.getUserSession().account,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        console.log(params);
        this.transInfoService.qryTransInfo(params).subscribe(
            data => {
                // 显示列表
                this.loading = false;
                if (data.data) {
                    console.log(data.data);
                    this.transInfoList = data.data;
                    this.page.totalRow = data.page.totalRow;
                    this.transInfoList.forEach(item => {
                        if (item.fileflag == '1') {
                            item.pdfUrl = this.transInfoService.getMonitorUrl() + '/download?transSerialNum=' + item.transserialnum
                                + '&transTime=' + item.transtime + '&devNo=' + item.devno
                                + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
                        }
                    });
                } else {
                    this.transInfoList = [];
                    this.page.totalRow = 0;
                }
            }, error => {
                this.loading = false;
                this.message.error(error.body.retMsg);
                console.log(error);
            }
        );
    }

    downloadPdf(serverPath: string) {
        this.transInfoService.downloadPdf(serverPath);
    }

    getPdf(txId: string) {
        this.transInfoService.getPdf(txId);
    }

}
