import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {FaultQueryService} from '../../maintain/faultQuery/faultQuery.service';
import {Page} from '../../../models/page';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {DevService} from '../../system/dev/dev.service';
import {FaultQueryDetailComponent} from '../faultQuery/component/faultQuery-detail.component';
import {FaultQueryFollowComponent} from '../faultQuery/component/faultQuery-follow.component';
import {FaultQueryNoticeComponent} from '../faultQuery/component/faultQuery-notice.component';
import {SessionService} from '@core/session.service';
import {forEach} from '@angular/router/src/utils/collection';

@Component({
    templateUrl: './faultQuery.html',
})
export class FaultQueryComponent implements OnInit, OnChanges {

    validateForm: FormGroup;
    loading = true;
    flag = true;
    dataSet = [];
    devVendorList = [];
    devTypeList = [];
    devList = [];
    devModuleList = [];
    caseCatalogList = [];
    caseStatusList = [];
    startTime = null;
    endTime = null;
    page = new Page();
    isDisabled = false;
    curOrg = {
        no: this.session.getUserSession().orgNo,
        name: this.session.getUserSession().orgName,
    };

    constructor(
        private faultQueryService: FaultQueryService,
        private fb: FormBuilder,
        private devService: DevService,
        private message: NzMessageService,
        private modal: NzModalService,
        private session: SessionService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            caseNo: [null, Validators.maxLength(36)],
            org: [
                {no: this.curOrg.no, name: this.curOrg.name}],
            devNo: [null, Validators.maxLength(20)],
            devVendor: [null, Validators.maxLength(5)],
            devType: [null, Validators.maxLength(5)],
            devInfo: [null, Validators.maxLength(40)],
            devModule: [null, Validators.maxLength(5)],
            catalogNo: [null, Validators.maxLength(5)],
            status: [null, Validators.maxLength(5)],
            startTime: [null, Validators.maxLength(5)],
            endTime: [null, Validators.maxLength(5)],
        });
        // 设备品牌下拉框初始数据
        this.devService.getDevVendorInfo({}).subscribe(
            _data => {
                this.devVendorList = [];
                const dataArr =  _data.data;
                this.devVendorList.push({no: '', name: '全部'});
                if (dataArr.length != 0) {
                  for (let i = 0; i < dataArr.length; i++) {
                      this.devVendorList.push({
                          no: dataArr[i].no,
                          name: dataArr[i].name
                      });
                  }
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 设备模块下拉框初始数据
        this.faultQueryService.getAllModCatalog({}).subscribe(
            _data => {
                this.devModuleList = [];
                const dataArr =  _data.data;
                this.devModuleList.push({no: '', name: '全部'});
                if (dataArr.length != 0) {
                    for (let i = 0; i < dataArr.length; i++) {
                        this.devModuleList.push({
                            no: dataArr[i].no,
                            name: dataArr[i].name
                        });
                    }
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 故障类型下拉框数据
        this.faultQueryService.getAllCaseCatalog({}).subscribe(
            _data => {
                this.caseCatalogList = [];
                const dataArr =  _data.data;
                this.caseCatalogList.push({catalogNo: '', catalogName: '全部'});
                if (dataArr.length != 0) {
                    for (let i = 0; i < dataArr.length; i++) {
                        this.caseCatalogList.push({
                            catalogNo: dataArr[i].catalogNo,
                            catalogName: dataArr[i].catalogName
                        });
                    }
                }
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        // 设备型号下拉框初始数据
        this.devService.getDevTypeByVendor({}).subscribe(_data => {
            this.devTypeList = [];
            const dataArr = _data.data;
            this.devTypeList.push({no: '', name: '全部'});
            if (dataArr.length != 0) {
                for (let i = 0; i < dataArr.length; i++) {
                    this.devTypeList.push({
                        no: dataArr[i].no,
                        name: dataArr[i].name
                    });
                }
            }
        }, error => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
        // 设备信息下拉框初始数据
        this.faultQueryService.getCaseDevs({orgNo: this.curOrg.no}).subscribe( _data => {
            this.devList = [];
            _data.data.forEach(data1 => {
                data1.devInfoName = data1.no + ' | ' + data1.orgName + ' | ' + data1.typeName + ' | ' + data1.address;
                data1.devInfoValue = data1.no + ',' + data1.orgNo + ',' + data1.typeNo;
            });
            const dataArr = _data.data;
            const length = dataArr.length;
            if (length != 0) {
                this.devList.push({no: '', name: '全部(' + dataArr.length + '台设备)'});
                for (let i = 0; i < length; i++) {
                    this.devList.push({
                        no: dataArr[i].devInfoValue,
                        name: dataArr[i].devInfoName
                    });
                }
            }else {
                this.devList.push({no: '', name: '全部'});
            }
        }, error => {
            if (error instanceof  HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
        // case状态下拉框数据
        this.caseStatusList = this.faultQueryService.getCaseStatus();
        // 页面下拉框设置默认选项
        this.validateForm.controls.status.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devModule.setValue('');
        this.validateForm.controls.catalogNo.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.validateForm.controls.devInfo.setValue('');
    }

    refreshData(reset = false) {

        this.loading = true;
        let orgNo = this.validateForm.controls.org.value.no;
        if (orgNo === '') {
            orgNo = this.session.getUserSession().orgNo;
        }
        const params = {
            caseNo: this.validateForm.controls.caseNo.value || '',
            orgNo: orgNo,
            devNo: this.validateForm.controls.devNo.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            devModule: this.validateForm.controls.devModule.value || '',
            catalogNo: this.validateForm.controls.catalogNo.value || '',
            status: this.validateForm.controls.status.value || '',
            startTime: this.date2String(this.validateForm.controls.startTime.value),
            endTime: this.date2String(this.validateForm.controls.endTime.value),
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            devInfo: this.validateForm.controls.devInfo.value || '',
        };
        console.log(params);
        // 获取当前页
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

    ngOnChanges() {

    }

    search() {
        this.refreshData(true);
        this.flag = false;
    }

    treeChange(evt: any) {
        console.log(evt);
        console.log('机构数值改变');
    }
    /**
     * 选择设备品牌后，查询用户可选的设备机型
     * @param evt
     */
    selectDevType(evt: any) {
        let params = {};
        if (evt) {
             params = {
                devVendor: evt || '',
            };
        }else {
            params = {
                devVendor: ''
            };
        }
            console.log(params);
            this.devService.getDevTypeByVendor(params).subscribe(
                _data => {
                    this.devTypeList = [];
                    const dataArr = _data.data;
                    this.devTypeList.push({no: '', name: '全部'});
                    this.validateForm.controls.devType.setValue('');
                    if (dataArr.length != 0) {
                        for (let i = 0; i < dataArr.length; i++) {
                            this.devTypeList.push({
                                no: dataArr[i].no,
                                name: dataArr[i].name
                            });
                        }
                    }
                }, error => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
        this.selectDevs(evt);
    }

    /**
     * 动态获取设备信息
     * @param evt
     */
    selectDevs(evt: any) {
        this.validateForm.controls.devInfo.setValue('');
            setTimeout(() => {
               const params = {
                    devType: this.validateForm.controls.devType.value || '',
                    devVendor: this.validateForm.controls.devVendor.value || '',
                    orgNo: this.validateForm.controls.org.value.no
                };
                console.log(params);
                this.faultQueryService.getCaseDevs(params).subscribe(
                    _data => {
                        this.devList = [];
                        _data.data.forEach(data1 => {
                            data1.devInfoName = data1.no + ' | ' + data1.orgName + ' | ' + data1.typeName + ' | ' + data1.address;
                            data1.devInfoValue = data1.no + ',' + data1.orgNo + ',' + data1.typeNo;                        });
                        const dataArr = _data.data;
                        const length = dataArr.length;
                        if (length != 0) {
                            this.devList.push({no: '', name: '全部(' + dataArr.length + '台设备)'});
                            for (let i = 0; i < length; i++) {
                                this.devList.push({
                                    no: dataArr[i].devInfoValue,
                                    name: dataArr[i].devInfoName
                                });
                            }
                        }else {
                            this.devList.push({no: '', name: '全部'});
                        }
                    }, error => {
                        console.log(error);
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    }
                );
            }, 0);
    }

    /**
     * 监听设备信息的变化
     * @param evt
     */
    devInfoChange(evt: any) {
        if (!evt) {
            this.isDisabled = false;
        }else {
           // this.validateForm.controls.caseNo.setValue('');
            this.validateForm.controls.devNo.setValue('');
            this.isDisabled = true;
        }
    }

    /**
     * 日期转字符串
     * @param date 时间对象
     * @param fmt 转换格式
     * @param flag 第一个参数是否为字符串型的date
     */
    formatDate(date: Date, fmt: string, flag: boolean) {
        if (date == null) {
            return '';
        }
        if (flag) {
            date = new Date(date);
        }
        if (!date) {
            date = new Date();
        }
        const o = {
            'M+' : date.getMonth() + 1, // 月份
            'd+' : date.getDate(), // 日
            'h+' : date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, // 小时
            'H+' : date.getHours(), // 小时
            'm+' : date.getMinutes(), // 分
            's+' : date.getSeconds(), // 秒
            'q+' : Math.floor((date.getMonth() + 3) / 3), // 季度
            'S' : date.getMilliseconds() // 毫秒
        };
        const week = {
            '0' : '/u65e5',
            '1' : '/u4e00',
            '2' : '/u4e8c',
            '3' : '/u4e09',
            '4' : '/u56db',
            '5' : '/u4e94',
            '6' : '/u516d'
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        if (/(E+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? '/u661f/u671f' : '/u5468') : '')
                + week[date.getDay() + '']);
        }
        for (const k in o) {
            if (new RegExp('(' + k + ')').test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
            }
        }
        return fmt;
    }
    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date: Date): string {
        if (!date) {
            return '';
        }
        date.setHours(date.getHours() + 8);
        const _date = date.toISOString().substring(0, 10);
        return _date;
    }
    /**
     * 限制开始时间
     * @param startValue
     * @private
     */
    _disabledStartDate = (startValue) => {
        const endValue = this.validateForm.controls.endTime.value;
        if (!startValue || !endValue) {
            return false;
        }
        return startValue.getTime() >= endValue.getTime();
    }
    /**
     * 限制结束时间
     * @param endValue
     * @private
     */
    _disabledEndDate = (endValue) => {
        const startValue = this.validateForm.controls.startTime.value;
        if (!endValue || !startValue) {
            return false;
        }
        return endValue.getTime() <= startValue.getTime();
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.caseNo.setValue('');
        this.validateForm.controls.org.setValue({no: this.curOrg.no, name: this.curOrg.name});
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.devVendor.setValue('');
        /*this.devTypeList = [];
        this.devList = [];*/
        this.validateForm.controls.devType.setValue('');
        this.validateForm.controls.devInfo.setValue('');
        this.validateForm.controls.devModule.setValue('');
        this.validateForm.controls.catalogNo.setValue('');
        this.validateForm.controls.status.setValue('');
        this.startTime = null;
        this.endTime = null;
        this.refreshData(true);
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
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
                this.refreshData(true);
            },
            onCancel: () => {
            },
            footer: false
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
            footer: false
        });
    }

    showNotice(cases) {
        const modal = this.modal.open({
            title: 'CASE通知',
            content: FaultQueryNoticeComponent,
            width: '80%',
            componentParams: {
                cases: cases
            },
            onOk: () => {
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    backModel() {
        this.flag = true;
    }
}
