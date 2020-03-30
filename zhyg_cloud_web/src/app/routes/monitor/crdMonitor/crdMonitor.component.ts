import {Component, OnDestroy, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Page} from '../../../models/page';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {DevMonitorService} from '../devMonitor/devMonitor.service';
import {CrdMonitorService} from './crdMonitor.service';
import {CaseQueryComponent} from '../devMonitor/component/caseQuery.component';
import {CrdMonitorDetailComponent} from './component/crdMonitor-detail.component';

@Component({
    templateUrl: './crdMonitor.html',
})
export class CrdMonitorComponent implements OnInit, OnDestroy {
    validateForm: FormGroup;
    timeref: any;
    monitorData: { // 监控数据
        userNo: string,
        orgNo: string,
        monitorType: string, // 监控类型
        showType: string, // 显示类型
        monitorStatusType: string, // 监控状态类型
        statusRelationShip: string, // 状态关系种类
        monitorInterval: string // 监控时间间隔
    } = {userNo: '', orgNo: '', monitorType: '', showType: '', monitorStatusType: '', statusRelationShip: '', monitorInterval: '20'};
    reqdevlistdata: { // 请求设备List数据
        orgNo: string,
        userNo: string,
        showType: string,
        pageSize: any, // 页面大小
        curPage: any,
        groupNames: string,
        monitorType: string, // 监控类型
        groupMethod: string, //
        curPageList: string,
        totalRowList: string,
        matrixColNum: string, // 矩阵
        monitorStatusType: string, // 监控状态类型
        statusRelationShip: string // 状态关系种类
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
    allCardChecked = false;
    allNetChecked = false;
    indeterminate_run = true;
    indeterminate_mod = true;
    indeterminate_card = true;
    indeterminate_net = true;
    ShowTypeflag = true;
    statusRelationShip: string;
    DevStatusdata = []; // 设备状态数据
    mainstatus_color = [];
    runimg_Array = [];
    modimg_Array = [];
    cardimg_Array = [];
    netimg_Array = [];
    infoList4matrix: {  // 信息矩阵列表
        mainstatus_color: string,
        devNo: string,
        orgName: string,
        address: string,
        devVendorName: string,
        runstatus_img: string,
        runstatus: string,
        modstatus_img: string,
        modstatus: string,
        cardstatus_img: string,
        cardstatus: string,
        netstatus_img: string,
        netstatus: string,
    }[] = [];
    page = new Page();
    arrayRunStatus = [];
    arrayModStatus = [];
    arrayCardStatus = [];
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
    card1: number;
    card2: number;
    card3: number;
    card4: number;
    net1: number;
    net2: number;
    net3: number;
    monitorStatus: '';

    runstatus = [  // 监控状态-运行状态
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

    modstatus = [ // 监控状态-模块状态
        {label: '正常', name: 'mod1', value: 1, checked: true, img: 'assets/images/operate/modnormal.png'},
        {label: '故障', name: 'mod2', value: 1, checked: true, img: 'assets/images/operate/modfault.png'},
        {label: '警告', name: 'mod3', value: 1, checked: true, img: 'assets/images/operate/modwarning.png'},
        {label: '未知', name: 'mod4', value: 0, checked: false, img: 'assets/images/operate/modunknown.png'}
    ];

    cardstatus = [  // 监控状态-卡箱状态
        {
            label: '正常', name: 'card1', value: 1, checked: true, img: 'assets/images/operate/cardok.png'
        },
        {
            label: '卡少', name: 'card2', value: 1, checked: true, img: 'assets/images/operate/cardlow.png'
        },
        {
            label: '卡空', name: 'card3', value: 1, checked: true, img: 'assets/images/operate/cardempty.png'
        },
        {
            label: '未知', name: 'card4', value: 1, checked: false, img: 'assets/images/operate/cardunknown.png'
        }
    ];

    netstatus = [ // 网络状态
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
    devVendorList = [{no: '0', name: '全部'}]; // 供应商list
    workTypeInfo = [{no: '0', name: '全部'}, {no: '1', name: '自营'}, {no: '2', name: '联营'}]; // 工作方式信息
    awayFlagInfo = [{no: '0', name: '全部'}, {no: '1', name: '在行'}, {no: '2', name: '离行'}];
    PageSizeSelectorValues = [20, 50, 100, 200];

    constructor(
        private fb: FormBuilder,
        private devMonitorService: DevMonitorService,
        private crdMonitorService: CrdMonitorService,
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
        this.monitorData.monitorType = '2'; // 监控类型为发卡机
        this.monitorData.showType = '1';    // 显示方式为矩阵方式
        this.monitorData.monitorStatusType = '1'; // 监控状态类型：1是标准模式
        this.monitorData.statusRelationShip = '1'; // 满足其一
        this.radioValue = 'Satisfyone'; // 满足其一

        this.reqdevlistdata.userNo = this.session.getUserSession().account;
        this.reqdevlistdata.orgNo = this.session.getUserSession().orgNo;
        this.reqdevlistdata.showType = '1';
        this.reqdevlistdata.monitorType = '2';
        this.reqdevlistdata.curPage = this.page.curPage + '';
        this.reqdevlistdata.pageSize = this.formModel['page'];
        this.reqdevlistdata.monitorStatusType = '0';
        this.reqdevlistdata.statusRelationShip = '1';

        this.vendorService.getVendors('')
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    data.data.forEach(vendor => {
                        this.devVendorList.push({no: vendor.no, name: vendor.name}); // 存供应商List
                    });
                }
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

        this.crdMonitorService.initCrdMonitor(this.monitorData)
            .subscribe(_data => {
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
                this.card1 = this.onString2Int(this.monitorStatus.substring(16, 17));
                this.card2 = this.onString2Int(this.monitorStatus.substring(17, 18));
                this.card3 = this.onString2Int(this.monitorStatus.substring(18, 19));
                this.card4 = this.onString2Int(this.monitorStatus.substring(19, 20));
                this.net1 = this.onString2Int(this.monitorStatus.substring(24, 25));
                this.net2 = this.onString2Int(this.monitorStatus.substring(25, 26));
                this.net3 = this.onString2Int(this.monitorStatus.substring(26, 27));
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
                this.cardstatus.forEach(ret => {
                    if (ret.name === 'card1') {
                        ret.value = this.card1;
                        ret.checked = this.onUserSelect(this.card1);
                    }
                    if (ret.name === 'card2') {
                        ret.value = this.card2;
                        ret.checked = this.onUserSelect(this.card2);
                    }
                    if (ret.name === 'card3') {
                        ret.value = this.card3;
                        ret.checked = this.onUserSelect(this.card3);
                    }
                    if (ret.name === 'card4') {
                        ret.value = this.card4;
                        ret.checked = this.onUserSelect(this.card4);
                    }
                });
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
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
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
            this.getDevListCom();
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
                this.reqdevlistdata.monitorType = '2';
                this.ShowTypeflag = false;
            } else {
                this.Ex_ShowType = '列表方式';
                this.reqdevlistdata.showType = '1'; // 1是矩阵方式
                this.reqdevlistdata.monitorType = '2';
                this.ShowTypeflag = true;
                console.log(this.reqdevlistdata);
            }
        }
    }

    onOrgConfirm() {
        if (this.formModel['org'].no === '') {
            this.displayorgtree = false;
        } else {
            const params = {
                orgNo: this.formModel['org'].no || '', // 使用
                userNo: this.session.getUserSession().account, // 使用
                monitorType: '2', // 使用
                filterNo: '', // 使用
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
            cards: this.arrayCardStatus,
            nets: this.arrayNetStatus,
            monitorType: '2',
            statusRelationShip: this.reqdevlistdata.statusRelationShip,
        };
        console.log('看状态====');
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
            monitorType: '2',
            filterNo: this.formModel['devNo'],
            cashType: '0',
            statusRelationShip: this.reqdevlistdata.statusRelationShip,
            monitorStatusType: '',
            filterVendor: this.formModel['devVendor'],
            filterWorkType: this.formModel['workType'],
            filterAwayFlag: this.formModel['awayFlag']
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

    updateAllCardChecked(): void {
        /*this.indeterminate_card = false;
        if (this.allCardChecked) {
            this.cardstatus.forEach(item => item.checked = true);
            this.cardstatus.forEach((val) => {
                const index: number = this.arrayCardStatus.indexOf(val);
                if (index < 0) {
                    this.arrayCardStatus.push(val);
                }
            });
        } else {
            this.cardstatus.forEach(item => item.checked = false);
        }*/
        this.indeterminate_card = false;
        if (this.allCardChecked) {
            this.cardstatus.forEach(item => item.checked = true);
        } else {
            this.cardstatus.forEach(item => item.checked = false);
        }
        this.cardstatus.forEach((val) => {
            const index: number = this.arrayCardStatus.indexOf(val);
            if (index < 0) {
                this.arrayCardStatus.push(val);
            }
        });
    }

    updateSingleCardChecked(check: boolean, value: string): void {
        /*const index: number = this.arrayCardStatus.indexOf(value);
        if (check) {
            if (index < 0) {
                this.arrayCardStatus.push(value);
            }
            this.allCardChecked = true;
            this.indeterminate_card = true;
        } else if (!check) {
            if (index < 0) {
                this.arrayCardStatus.push(value);
            }
            this.allCardChecked = false;
            this.indeterminate_card = false;
        }*/
        if (this.cardstatus.every(item => item.checked === false)) {
            this.allCardChecked = false;
            this.indeterminate_card = false;
        } else if (this.cardstatus.every(item => item.checked === true)) {
            this.allCardChecked = true;
            this.indeterminate_card = false;
        } else {
            this.indeterminate_card = true;
        }
        const index: number = this.arrayCardStatus.indexOf(value);
        if (index < 0) {
            this.arrayCardStatus.push(value);
        }
    }

    updateAllNetChecked(): void {
        /*this.indeterminate_net = false;
        if (this.allNetChecked) {
            this.netstatus.forEach(item => item.checked = true);
            this.modstatus.forEach(item => this.arrayNetStatus.push(item));
        } else {
            this.netstatus.forEach(item => item.checked = false);
        }
        console.log('看网络选中与否');
        console.log(this.allNetChecked + '' + this.indeterminate_net);*/
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
        /*const index: number = this.arrayNetStatus.indexOf(value);
        if (check) {
            if (index < 0) {
                this.arrayNetStatus.push(value);
            }
            this.allNetChecked = true;
            this.indeterminate_net = true;
        } else {
            if (index < 0) {
                this.arrayRunStatus.push(value);
            }
            this.allRunChecked = false;
            this.indeterminate_net = false;
        }*/
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
        this.crdMonitorService.getCrdList(this.reqdevlistdata)
            .subscribe(_data => {
                this.DevStatusdata = _data.data.monitorInfo.devMonitorGroups[0].devList; // 监控的设备信息
                this.Ex_totalCount = _data.data.monitorInfo.devMonitorGroups[0].totalCount; // 监控数量
                this.Ex_serviceCount = _data.data.monitorInfo.devMonitorGroups[0].serviceCount;
                this.Ex_unserviceCount = _data.data.monitorInfo.devMonitorGroups[0].totalCount -
                    _data.data.monitorInfo.devMonitorGroups[0].serviceCount;
                this.page.totalRow = _data.page.totalRow;
                this.loading = false;

                console.log('2222222222222222222222');
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

                this.cardimg_Array = [];
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devCardStatus === '正常') {
                        this.cardimg_Array.push('assets/images/operate/cardok.png');
                    } else if (data1.devCardStatus === '卡少') {
                        this.cardimg_Array.push('assets/images/operate/cardlow.png');
                    } else if (data1.devCardStatus === '卡空') {
                        this.cardimg_Array.push('assets/images/operate/cardempty.png');
                    } else if (data1.devCardStatus === '未知') {
                        this.cardimg_Array.push('assets/images/operate/cardunknown.png');
                    }
                });

                this.netimg_Array = [];
                this.DevStatusdata.forEach(data1 => {
                    if (data1.devNetStatus === '正常') {
                        this.netimg_Array.push('assets/images/operate/normalnetwork.png');
                    } else if (data1.devNetStatus === '故障') {
                        this.netimg_Array.push('assets/images/operate/networkfailure.png');
                    } else if (data1.devNetStatus === '未知') {
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
                        cardstatus_img: this.cardimg_Array[i],
                        cardstatus: this.DevStatusdata[i].devCardStatus,
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
            content: CrdMonitorDetailComponent,
            width: '80%',
            componentParams: {
                matrixEventdata: matrixEventdata
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false,
            zIndex: 1000
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
            zIndex: 1
        });
    }

    onChange(): void {
        const value = this.validateForm.controls.monitorInterval.value;
        const reg = /^[1-9][0-9]?$/;
        if (!value.match(reg)) {
            this.message.error('请输入大于5且小于100的数字');
            this.validateForm.controls.monitorInterval.setValue(this.Ex_monitorInterval);
            return;
        }
        const interval = parseInt(value, 10);
        if (interval < 5 || interval > 99) {
            this.message.error('请输入大于5且小于100的数字');
            this.validateForm.controls.monitorInterval.setValue(this.Ex_monitorInterval);
            return;
        }
        if (interval == this.monitorInterval) {
            return;
        }
        this.monitorInterval = interval;
        const params = {
            userNo: this.session.getUserSession().account,
            monitorType: '2',
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
