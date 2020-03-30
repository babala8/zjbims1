import {Component, OnDestroy, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {IstMonitorService} from './istMonitor.service';
import {SessionService} from '@core/session.service';
import {Page} from '../../../models/page';
import {IstMonitorDetailComponent} from './component/istMonitor-detail.component';
import {style} from '@angular/animations';
import {CaseQueryComponent} from './component/caseQuery.component';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {isNumber} from 'util';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
    templateUrl: './istMonitor.html',
})
export class IstMonitorComponent implements OnInit, OnDestroy {
    validateForm: FormGroup;
    timeref: any;
    inputValue: 20;
    monitorData: {
        userNo: string,
        orgNo: string,
        monitorType: string,
        showType: string,
        monitorStatusType: string,
        statusRelationShip: string,
        monitorInterval: string
    } = {userNo: '', orgNo: '', monitorType: '', showType: '', monitorStatusType: '', statusRelationShip: '', monitorInterval: '20'};
    reqdevlistdata: {
        orgNo: string,
        userNo: string,
        showType: string,
        pageSize: any,
        curPage: any,
        groupNames: string,
        monitorType: string,
        groupMethod: string,
        curPageList: string,
        totalRowList: string,
        matrixColNum: string,
        monitorStatusType: string,
        statusRelationShip: string
    } = {
        orgNo: '',
        userNo: '',
        showType: '',
        pageSize: '',
        curPage: '',
        groupNames: '',
        monitorType: '',
        groupMethod: '',
        curPageList: '',
        totalRowList: '',
        matrixColNum: '',
        monitorStatusType: '',
        statusRelationShip: ''
    };
    formModel = {};
    loading = false;
    displayorgtree = false;
    displaystatus = false;
    displayselect = false;
    Ex_Monitor: string;
    Ex_ShowType: string;
    Ex_groupName: string;
    Ex_orgNo: string;
    Ex_orgName: string;
    Ex_monitorInterval: string;
    monitorInterval: number;
    Ex_totalCount: string;
    Ex_serviceCount: any;
    Ex_unserviceCount: any;
    style_DevMonitor: string;
    style_Exec: string;
    radioValue: string;
    allRunChecked = false;
    allModChecked = false;
    allCashChecked = false;
    allNetChecked = false;
    indeterminate_run = true;
    indeterminate_mod = true;
    indeterminate_cash = true;
    indeterminate_net = true;
    ShowTypeflag = true;
    definedMonitorSelect: string;
    statusRelationShip: string;
    DevStatusdata = [];
    mainstatus_color = [];
    runimg_Array = [];
    modimg_Array = [];
    cashimg_Array = [];
    netimg_Array = [];
    infoList4matrix: {
        mainstatus_color: string,
        devNo: string,
        orgName: string,
        address: string,
        devVendorName: string,
        runstatus_img: string,
        runstatus: string,
        modstatus_img: string,
        modstatus: string,
        cashstatus_img: string,
        cashstatus: string,
        netstatus_img: string,
        netstatus: string,
    }[] = [];
    page = new Page();
    arrayRunStatus = [];
    arrayModStatus = [];
    arrayCashStatus = [];
    arrayNetStatus = [];
    run1: number;
    run2: number;
    run3: number;
    run4: number;
    run5: number;
    run6: number;
    run7: number;
    run8: number;
    run9: number;
    mod1: number;
    mod2: number;
    mod3: number;
    mod4: number;
    cash1: number;
    cash2: number;
    cash3: number;
    cash4: number;
    cash5: number;
    net1: number;
    net2: number;
    net3: number;
    monitorStatus: '';

    runstatus = [
        {
            label: '正常', name: 'run1', value: 1, checked: true, img: 'assets/images/operate/allnormal.png'
        },
        {
            label: '停止服务', name: 'run2', value: 1, checked: true, img: 'assets/images/operate/Partynormal.png'
        },
        {
            label: '部分服务', name: 'run3', value: 1, checked: true, img: 'assets/images/operate/stopservice.png'
        },
        {
            label: '未知', name: 'run4', value: 1, checked: true, img: 'assets/images/operate/unknownstatus.png'
        },
        {
            label: 'P通讯故障', name: 'run5', value: 1, checked: true, img: 'assets/images/operate/communicationfail.png'
        },
        {label: '维护', name: 'run6', value: 1, checked: true, img: 'assets/images/operate/maintain.png'},
        {label: '关机', name: 'run7', value: 1, checked: true, img: 'assets/images/operate/shutdown.png'},
        {label: '停机', name: 'run8', value: 1, checked: true, img: 'assets/images/operate/outofservice.png'},
        {label: '疑似死机', name: 'run9', value: 0, checked: false, img: 'assets/images/operate/crash.png'}
    ];

    modstatus = [
        {label: '正常', name: 'mod1', value: 1, checked: true, img: 'assets/images/operate/modnormal.png'},
        {label: '故障', name: 'mod2', value: 1, checked: true, img: 'assets/images/operate/modfault.png'},
        {label: '警告', name: 'mod3', value: 1, checked: true, img: 'assets/images/operate/modwarning.png'},
        {label: '未知', name: 'mod4', value: 0, checked: false, img: 'assets/images/operate/modunknown.png'}
    ];

    cashstatus = [
        {
            label: '正常', name: 'cash1', value: 1, checked: true, img: 'assets/images/operate/cashnormal.png'
        },
        {
            label: '缺钞', name: 'cash2', value: 1, checked: true, img: 'assets/images/operate/lackofcash.png'
        },
        {
            label: '满钞', name: 'cash3', value: 1, checked: true, img: 'assets/images/operate/fullofcash.png'
        },
        {
            label: '不足', name: 'cash4', value: 0, checked: false, img: 'assets/images/operate/nullofcash.png'
        },
        {
            label: '未知', name: 'cash5', value: 0, checked: false, img: 'assets/images/operate/unknownofcash.png'
        }
    ];

    netstatus = [
        {
            label: '正常', name: 'net1', value: 1, checked: true,
            img: 'assets/images/operate/normalnetwork.png'
        },
        {
            label: '故障', name: 'net2', value: 1, checked: true,
            img: 'assets/images/operate/networkfailure.png'
        },
        {
            label: '未知', name: 'net3', value: 0, checked: false,
            img: 'assets/images/operate/unknownnetwork.png'
        }
    ];
    devVendorList = [{no: '0', name: '全部'}];
    workTypeInfo = [{no: '0', name: '全部'}, {no: '1', name: '自营'}, {no: '2', name: '联营'}];
    awayFlagInfo = [{no: '0', name: '全部'}, {no: '1', name: '在行'}, {no: '2', name: '离行'}];
    PageSizeSelectorValues = [20, 50, 100, 200];

    constructor(
        private fb: FormBuilder,
        private devMonitorService: IstMonitorService,
        private session: SessionService,
        private modal: NzModalService,
        private message: NzMessageService,
        private vendorService: VendorService,
        private orgService: OrgService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            monitorInterval: [null, [Validators.pattern('^[1-9][0-9]?'), Validators.maxLength(2)]]
        });
        this.inputValue = 20;
        this.formModel['org'] = {
            no: '',
            name: ''
        };
        this.formModel['devVendor'] = '0';
        this.formModel['workType'] = '0';
        this.formModel['awayFlag'] = '0';
        this.formModel['page'] = 20;
        this.Ex_Monitor = '停止监控';
        this.Ex_ShowType = '列表方式';
        this.style_DevMonitor = 'red';
        this.style_Exec = 'black';

        this.monitorData.userNo = this.session.getUserSession().account;
        this.monitorData.orgNo = this.session.getUserSession().orgNo;
        this.monitorData.monitorType = '5';
        this.monitorData.showType = '1';
        this.monitorData.monitorStatusType = '1';
        this.monitorData.statusRelationShip = '1';
        this.radioValue = 'Satisfyone';

        this.reqdevlistdata.userNo = this.session.getUserSession().account;
        this.reqdevlistdata.orgNo = this.session.getUserSession().orgNo;
        this.reqdevlistdata.showType = '1';
        this.reqdevlistdata.monitorType = '5';
        this.reqdevlistdata.curPage = this.page.curPage + '';
        this.reqdevlistdata.pageSize = this.formModel['page'];
        this.reqdevlistdata.monitorStatusType = '0';
        this.reqdevlistdata.statusRelationShip = '1';

        this.vendorService.getVendors('')
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    data.data.forEach(vendor => {
                        this.devVendorList.push({no: vendor.no, name: vendor.name});
                    });
                }
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

        this.devMonitorService.initDevMonitor(this.monitorData)
            .subscribe(_data => {
                // this.definedMonitorSelect = _data.data.userMonitorSelect.definedMonitorStatus;
                this.loading = false;
                this.Ex_orgNo = _data.data.userMonitorSelect.orgNo;
                this.Ex_monitorInterval = _data.data.userMonitorSelect.monitorInterval;
                this.validateForm.controls.monitorInterval.setValue(this.Ex_monitorInterval);
                this.monitorInterval = parseInt(this.Ex_monitorInterval, 10);
                this.orgService.getOrg(_data.data.userMonitorSelect.orgNo)
                    .subscribe( orgData => {
                        this.Ex_orgName = orgData.data.name;
                    });
                this.formModel['devNo'] = _data.data.userMonitorSelect.devNo;
                this.formModel['devVendor'] =  _data.data.userMonitorSelect.devVendor;
                this.formModel['workType'] = _data.data.userMonitorSelect.devWorkType + '';
                this.formModel['awayFlag'] = _data.data.userMonitorSelect.devAwayFlag + '';
                this.monitorStatus = _data.data.userMonitorSelect.monitorStatus;
                this.run1 = this.onString2Int(this.monitorStatus.substring(1, 2));
                this.run2 = this.onString2Int(this.monitorStatus.substring(2, 3));
                this.run3 = this.onString2Int(this.monitorStatus.substring(3, 4));
                this.run4 = this.onString2Int(this.monitorStatus.substring(4, 5));
                this.run5 = this.onString2Int(this.monitorStatus.substring(5, 6));
                this.run6 = this.onString2Int(this.monitorStatus.substring(6, 7));
                this.run7 = this.onString2Int(this.monitorStatus.substring(7, 8));
                this.run8 = this.onString2Int(this.monitorStatus.substring(8, 9));
                this.run9 = this.onString2Int(this.monitorStatus.substring(9, 10));
                this.mod1 = this.onString2Int(this.monitorStatus.substring(11, 12));
                this.mod2 = this.onString2Int(this.monitorStatus.substring(12, 13));
                this.mod3 = this.onString2Int(this.monitorStatus.substring(13, 14));
                this.mod4 = this.onString2Int(this.monitorStatus.substring(14, 15));
                this.cash1 = this.onString2Int(this.monitorStatus.substring(16, 17));
                this.cash2 = this.onString2Int(this.monitorStatus.substring(17, 18));
                this.cash3 = this.onString2Int(this.monitorStatus.substring(18, 19));
                this.cash4 = this.onString2Int(this.monitorStatus.substring(19, 20));
                this.cash5 = this.onString2Int(this.monitorStatus.substring(20, 21));
                this.net1 = this.onString2Int(this.monitorStatus.substring(22, 23));
                this.net2 = this.onString2Int(this.monitorStatus.substring(23, 24));
                this.net3 = this.onString2Int(this.monitorStatus.substring(24, 25));
                this.runstatus.forEach(ret => {
                    if (ret.name === 'run1') {
                        ret.value = this.run1;
                        ret.checked = this.onUserSelect(this.run1);
                    }
                    if (ret.name === 'run2') {
                        ret.value = this.run2;
                        ret.checked = this.onUserSelect(this.run2);
                    }
                    if (ret.name === 'run3') {
                        ret.value = this.run3;
                        ret.checked = this.onUserSelect(this.run3);
                    }
                    if (ret.name === 'run4') {
                        ret.value = this.run4;
                        ret.checked = this.onUserSelect(this.run4);
                    }
                    if (ret.name === 'run5') {
                        ret.value = this.run5;
                        ret.checked = this.onUserSelect(this.run5);
                    }
                    if (ret.name === 'run6') {
                        ret.value = this.run6;
                        ret.checked = this.onUserSelect(this.run6);
                    }
                    if (ret.name === 'run7') {
                        ret.value = this.run7;
                        ret.checked = this.onUserSelect(this.run7);
                    }
                    if (ret.name === 'run8') {
                        ret.value = this.run8;
                        ret.checked = this.onUserSelect(this.run8);
                    }
                    if (ret.name === 'run9') {
                        ret.value = this.run9;
                        ret.checked = this.onUserSelect(this.run9);
                    }
                });
                this.modstatus.forEach(ret => {
                    if (ret.name === 'mod1') {
                        ret.value = this.mod1;
                        ret.checked = this.onUserSelect(this.mod1);
                    }
                    if (ret.name === 'mod2') {
                        ret.value = this.mod2;
                        ret.checked = this.onUserSelect(this.mod2);
                    }
                    if (ret.name === 'mod3') {
                        ret.value = this.mod3;
                        ret.checked = this.onUserSelect(this.mod3);
                    }
                    if (ret.name === 'mod4') {
                        ret.value = this.mod4;
                        ret.checked = this.onUserSelect(this.mod4);
                    }
                });

                // ---------------------------------------------------
                this.cashstatus.forEach(ret => {
                    if (ret.name === 'cash1') {
                        ret.value = this.cash1;
                        ret.checked = this.onUserSelect(this.cash1);
                    }
                    if (ret.name === 'cash2') {
                        ret.value = this.cash2;
                        ret.checked = this.onUserSelect(this.cash2);
                    }
                    if (ret.name === 'cash3') {
                        ret.value = this.cash3;
                        ret.checked = this.onUserSelect(this.cash3);
                    }
                    if (ret.name === 'cash4') {
                        ret.value = this.cash4;
                        ret.checked = this.onUserSelect(this.cash4);
                    }
                    if (ret.name === 'cash5') {
                        ret.value = this.cash5;
                        ret.checked = this.onUserSelect(this.cash5);
                    }
                });
                // ---------------------------------------------------------

                this.netstatus.forEach(ret => {
                    if (ret.name === 'net1') {
                        ret.value = this.net1;
                        ret.checked = this.onUserSelect(this.net1);
                    }
                    if (ret.name === 'net2') {
                        ret.value = this.net2;
                        ret.checked = this.onUserSelect(this.net2);
                    }
                    if (ret.name === 'net3') {
                        ret.value = this.net3;
                        ret.checked = this.onUserSelect(this.net3);
                    }
                });
                this.getDevListCom();
                this.timeref = setInterval(() => {
                    console.log('interval');
                    this.getDevListCom();
                }, this.monitorInterval * 1000);
            }, (error) => {
                console.log(error);
                console.log('初始化智能自助终端监控用户数据失败');
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
                return ;
            });
    }

    ngOnDestroy(): void {
        window.clearInterval(this.timeref);
    }

    onString2Int(value: string) {
        const defaultValue = 0;
        if (value === '' || value === null) {
            return 0;
        } else {
            return parseInt(value, defaultValue);
        }
    }


    onDevMonitor() {
        if (this.style_DevMonitor === 'green') {
            this.Ex_Monitor = '停止监控';
            this.style_DevMonitor = 'red';
            this.style_Exec = 'black';
            this.getDevListCom(); // 新添加
            this.timeref = setInterval(() => {
                console.log('interval');
                this.getDevListCom();
            }, this.monitorInterval * 1000);
        } else {
            this.Ex_Monitor = '开始监控';
            this.style_DevMonitor = 'green';
            this.style_Exec = 'gray';
            window.clearInterval(this.timeref);
        }
    }

    onOrgNavi() {
        if (this.style_Exec === 'black') {
            this.displayorgtree = true;
        }
    }

    onUserSelect(value: number) {

        if (value === 1) {
            return true;
        } else {
            return false;
        }
    }

    onMonitorStatus() {
        if (this.style_Exec === 'black') {
            this.displaystatus = true;
        }
    }

    onMonitorSelect() {
        if (this.style_Exec === 'black') {
            this.displayselect = true;
        }
    }

    onShowType() {
        if (this.style_Exec === 'black') {
            if (this.Ex_ShowType === '列表方式') {
                this.Ex_ShowType = '矩阵方式';
                this.reqdevlistdata.showType = '0';
                this.reqdevlistdata.monitorType = '5';
                this.ShowTypeflag = false;
            } else {
                this.Ex_ShowType = '列表方式';
                this.reqdevlistdata.showType = '1';
                this.reqdevlistdata.monitorType = '5';
                this.ShowTypeflag = true;
                console.log('列表方式');
                console.log(this.reqdevlistdata);
            }
        }
    }

    onOrgConfirm() {
        if (this.formModel['org'].no === '') {
            this.displayorgtree = false;
        } else {
            const params = {
                orgNo: this.formModel['org'].no || '',
                userNo: this.session.getUserSession().account,
                monitorType: '5',
                filterNo: '',
                statusRelationShip: this.reqdevlistdata.statusRelationShip,
            };
            this.devMonitorService.updateUserMonitorSelect(params)
                .subscribe(data => {
                    this.Ex_orgNo = this.formModel['org'].no;
                    this.Ex_orgName = this.formModel['org'].name;
                    this.getDevListCom();
                }, (error) => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
            this.displayorgtree = false;
        }
    }

    onStatusConfirm() {
        this.displaystatus = false;
        const params = {
            userNo: this.session.getUserSession().account,
            runs: this.arrayRunStatus,
            mods: this.arrayModStatus,
            cashs: this.arrayCashStatus,
            nets: this.arrayNetStatus,
            monitorType: '5',
            statusRelationShip: this.reqdevlistdata.statusRelationShip,
        };
        console.log('00000000000000000');
        console.log(params);
        this.devMonitorService.updateUserMonitorSelect(params).subscribe(_data => {
            this.getDevListCom();
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
        this.displayorgtree = false;
    }

    onSelectConfirm() {
        this.displayselect = false;
        const params = {
            userNo: this.session.getUserSession().account,
            monitorType: '5',
            filterNo: this.formModel['devNo'],
            cashType: '0',
            statusRelationShip: this.reqdevlistdata.statusRelationShip,
            monitorStatusType: '',
            filterVendor: this.formModel['devVendor'],
            filterWorkType: this.formModel['workType'],
            filterAwayFlag: this.formModel['awayFlag'],
        };
        this.reqdevlistdata.pageSize = this.formModel['page'];
        console.log('测试筛选条件');
        console.log(params);
        this.devMonitorService.updateUserMonitorSelect(params).subscribe(_data => {
            this.getDevListCom();
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    updateAllRunChecked(): void {
        this.indeterminate_run = false;
        if (this.allRunChecked) {
            this.runstatus.forEach(item => item.checked = true);
        } else {
            this.runstatus.forEach(item => item.checked = false);
        }
        this.runstatus.forEach((val) => {
            const index: number = this.arrayRunStatus.indexOf(val);
            if (index < 0) {
                this.arrayRunStatus.push(val);
            }
        });

    }

    updateSingleRunChecked(check: boolean, value: string): void {
        if (this.runstatus.every(item => item.checked === false)) {
            this.allRunChecked = false;
            this.indeterminate_run = false;
        } else if (this.runstatus.every(item => item.checked === true)) {
            this.allRunChecked = true;
            this.indeterminate_run = false;
        } else {
            this.indeterminate_run = true;
        }
        const index: number = this.arrayRunStatus.indexOf(value);
        if (index < 0) {
            this.arrayRunStatus.push(value);
        }
    }

    updateAllModChecked(): void {
        this.indeterminate_mod = false;
        if (this.allModChecked) {
            this.modstatus.forEach(item => item.checked = true);
        } else {
            this.modstatus.forEach(item => item.checked = false);
        }
        this.modstatus.forEach((val) => {
            const index: number = this.arrayModStatus.indexOf(val);
            if (index < 0) {
                this.arrayModStatus.push(val);
            }
        });
    }

    updateSingleModChecked(check: boolean, value: string): void {
        if (this.modstatus.every(item => item.checked === false)) {
            this.allModChecked = false;
            this.indeterminate_mod = false;
        } else if (this.runstatus.every(item => item.checked === true)) {
            this.allModChecked = true;
            this.indeterminate_mod = false;
        } else {
            this.indeterminate_mod = true;
        }
        const index: number = this.arrayModStatus.indexOf(value);
        if (index < 0) {
            this.arrayModStatus.push(value);
        }
    }

    updateAllCashChecked(): void {
        this.indeterminate_cash = false;
        if (this.allCashChecked) {
            this.cashstatus.forEach(item => item.checked = true);
        } else {
            this.cashstatus.forEach(item => item.checked = false);
        }
        this.cashstatus.forEach((val) => {
            const index: number = this.arrayCashStatus.indexOf(val);
            if (index < 0) {
                this.arrayCashStatus.push(val);
            }
        });
    }

    updateSingleCashChecked(check: boolean, value: string): void {
        if (this.cashstatus.every(item => item.checked === false)) {
            this.allCashChecked = false;
            this.indeterminate_cash = false;
        } else if (this.cashstatus.every(item => item.checked === true)) {
            this.allCashChecked = true;
            this.indeterminate_cash = false;
        } else {
            this.indeterminate_cash = true;
        }
        const index: number = this.arrayCashStatus.indexOf(value);
        if (index < 0) {
            this.arrayCashStatus.push(value);
        }
    }

    updateAllNetChecked(): void {
        this.indeterminate_net = false;
        if (this.allNetChecked) {
            this.netstatus.forEach(item => item.checked = true);
        } else {
            this.netstatus.forEach(item => item.checked = false);
        }
        this.netstatus.forEach((val) => {
            const index: number = this.arrayNetStatus.indexOf(val);
            if (index < 0) {
                this.arrayNetStatus.push(val);
            }
        });
    }

    updateSingleNetChecked(check: boolean, value: string): void {
        if (this.netstatus.every(item => item.checked === false)) {
            this.allNetChecked = false;
            this.indeterminate_net = false;
        } else if (this.netstatus.every(item => item.checked === true)) {
            this.allNetChecked = true;
            this.indeterminate_net = false;
        } else {
            this.indeterminate_net = true;
        }
        const index: number = this.arrayNetStatus.indexOf(value);
        if (index < 0) {
            this.arrayNetStatus.push(value);
        }
    }

    getDevListCom(): void {
        this.DevStatusdata = [];
        this.devMonitorService.getDevList(this.reqdevlistdata)
            .subscribe(_data => {
                this.DevStatusdata = _data.data.monitorInfo.devMonitorGroups[0].devList;
                this.Ex_totalCount = _data.data.monitorInfo.devMonitorGroups[0].totalCount;
                this.Ex_serviceCount = _data.data.monitorInfo.devMonitorGroups[0].serviceCount;
                this.Ex_unserviceCount = _data.data.monitorInfo.devMonitorGroups[0].totalCount -
                    _data.data.monitorInfo.devMonitorGroups[0].serviceCount;
                this.page.totalRow = _data.page.totalRow;
                this.loading = false;

                console.log('1111111111111111111111');
                console.log(this.DevStatusdata);
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devRunStatus == '正常') {
                        data1.color = 'dodgerblue';
                    } else if (data1.devRunStatus == '部分服务') {
                        data1.color = '#dd3b26';
                    } else {
                        data1.color = 'gray';
                    }
                });

                this.runimg_Array = [];
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devRunStatus === '正常') {
                        this.runimg_Array.push('assets/images/operate/allnormal.png');
                    } else if (data1.devRunStatus === '停止服务') {
                        this.runimg_Array.push('assets/images/operate/Partynormal.png');
                    } else if (data1.devRunStatus === '部分服务') {
                        this.runimg_Array.push('assets/images/operate/stopservice.png');
                    }  else if (data1.devRunStatus === 'P通讯故障') {
                        this.runimg_Array.push('assets/images/operate/communicationfail.png');
                    } else if (data1.devRunStatus === '维护') {
                        this.runimg_Array.push('assets/images/operate/maintain.png');
                    } else if (data1.devRunStatus === '关机') {
                        this.runimg_Array.push('assets/images/operate/shutdown.png');
                    } else if (data1.devRunStatus === '停用') {
                        this.runimg_Array.push('assets/images/operate/outofservice.png');
                    } else if (data1.devRunStatus === '疑似死机') {
                        this.runimg_Array.push('assets/images/operate/crash.png');
                    } else  {
                        this.runimg_Array.push('assets/images/operate/unknownstatus.png');
                    }
                });

                this.modimg_Array = [];
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devModStatus === '正常') {
                        this.modimg_Array.push('assets/images/operate/modnormal.png');
                    } else if (data1.devModStatus === '故障') {
                        this.modimg_Array.push('assets/images/operate/modfault.png');
                    } else if (data1.devModStatus === '警告') {
                        this.modimg_Array.push('assets/images/operate/modwarning.png');
                    } else {
                        this.modimg_Array.push('assets/images/operate/modunknown.png');
                    }
                });

                this.cashimg_Array = [];
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devCashStatus === '正常') {
                        this.cashimg_Array.push('assets/images/operate/cashnormal.png');
                    } else if (data1.devCashStatus === '缺钞') {
                        this.cashimg_Array.push('assets/images/operate/lackofcash.png');
                    } else if (data1.devCashStatus === '满钞') {
                        this.cashimg_Array.push('assets/images/operate/fullofcash.png');
                    } else if (data1.devCashStatus === '不足') {
                        this.cashimg_Array.push('assets/images/operate/nullofcash.png');
                    } else  {
                        this.cashimg_Array.push('assets/images/operate/unknownofcash.png');
                    }
                });

                this.netimg_Array = [];
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devNetStatus === '正常') {
                        this.netimg_Array.push('assets/images/operate/normalnetwork.png');
                    } else if (data1.devNetStatus === '故障') {
                        this.netimg_Array.push('assets/images/operate/networkfailure.png');
                    } else  {
                        this.netimg_Array.push('assets/images/operate/unknownnetwork.png');
                    }
                });

                this.infoList4matrix = [];
                const j = parseInt(this.Ex_totalCount, 10);
                for (let i = 0; i < j; i++) {
                    this.infoList4matrix.push({
                        mainstatus_color: this.DevStatusdata[i].color,
                        devNo: this.DevStatusdata[i].no,
                        orgName: this.DevStatusdata[i].orgName,
                        address: this.DevStatusdata[i].address,
                        devVendorName: this.DevStatusdata[i].devVendorName,
                        runstatus_img: this.runimg_Array[i],
                        runstatus: this.DevStatusdata[i].devRunStatus,
                        modstatus_img: this.modimg_Array[i],
                        modstatus: this.DevStatusdata[i].devModStatus,
                        cashstatus_img: this.cashimg_Array[i],
                        cashstatus: this.DevStatusdata[i].devCashStatus,
                        netstatus_img: this.netimg_Array[i],
                        netstatus: this.DevStatusdata[i].devNetStatus,
                    });
                }
                console.log(this.infoList4matrix);
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    onMatrixEvent(matrixEventdata) {
        const modal = this.modal.open({
            title: '设备详细信息',
            content: IstMonitorDetailComponent,
            width: '80%',
            componentParams: {
                matrixEventdata: matrixEventdata
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 1
        });
    }

    onOrgCancel() {
        this.displayorgtree = false;
    }

    onStatusCancel() {
        this.displaystatus = false;
    }

    onSelectCancel() {
        this.displayselect = false;
    }

    onstatusRelationShip(value) {
        console.log('77777777');
        console.log(value);
        if (value === 'Allsatisfied') {
            this.monitorData.statusRelationShip = '0';
            this.reqdevlistdata.statusRelationShip = '0';
        } else if (value === 'Satisfyone') {
            this.monitorData.statusRelationShip = '1';
            this.reqdevlistdata.statusRelationShip = '1';
        }
    }

    qryCase(devNo) {
        const modal = this.modal.open({
            title: '设备故障信息',
            content: CaseQueryComponent,
            width: '80%',
            componentParams: {
                devNo: devNo,
                status: 'O'
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 1000
        });
    }

    onChange(): void {
        // const value = this.validateForm.controls.monitorInterval.value;
        // const reg = /^[1-9][0-9]?$/;
        // if (!value.match(reg)) {
        //     this.message.error('请输入大于5且小于100的数字');
        //     this.validateForm.controls.monitorInterval.setValue(this.Ex_monitorInterval);
        //     return;
        // }
        // const interval = parseInt(value, 10);
        // if (interval < 5 || interval > 99) {
        //     this.message.error('请输入大于5且小于100的数字');
        //     this.validateForm.controls.monitorInterval.setValue(this.Ex_monitorInterval);
        //     return;
        // }
        if (this.inputValue < 5 || this.inputValue > 99) {
            this.inputValue = 20;
        }else {
            this.inputValue = this.validateForm.controls.monitorInterval.value;
        }
        const interval = this.inputValue;

        if (interval == this.monitorInterval) {
            return;
        }
        this.monitorInterval = interval;
        const params = {
            userNo: this.session.getUserSession().account,
            monitorType: '5',
            filterNo: this.formModel['devNo'],
            monitorInterval: this.monitorInterval,
            statusRelationShip: this.reqdevlistdata.statusRelationShip,
        };
        this.devMonitorService.updateUserMonitorSelect(params).subscribe(_data => {
            console.log('刷新频率改变：' + this.monitorInterval);
            if (this.style_DevMonitor === 'red') {
                window.clearInterval(this.timeref);
                this.timeref = setInterval(() => {
                    console.log('interval');
                    this.getDevListCom();
                }, this.monitorInterval * 1000);
            }
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });

    }
}
