import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {DevService} from '../dev.service';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Dev} from '../../../../models/dev';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {Org} from '../../../../models/org';
import {UserService} from '../../user/user.service';
import {RoleService} from '../../role/role.service';
import {DevServiceManagerService} from '../../devServiceManager/devServiceManager.service';
// @ts-ignore
// tslint:disable-next-line:import-spacing
import * as moment from 'moment';

@Component({
    templateUrl: './dev-add.html'
})
export class DevAddComponent implements OnInit {
    // @ts-ignore
    validateForm: FormGroup;
    loading = false;
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    isSelfBank = [];
    investmentInfo = [];
    orgNoList = [];
    awayFlagList = [];
    workTypeList = [];
    devServiceList = [];
    netTypeList = [];
    setupTypeList = [];
    cupAreaList = [];
    dev = new Dev();
    org = new Org();
    orgGrade;
    showFlag = 0;
    syn_startDate = null;
    syn_stopDate = null;
    syn_expireDate = null;
    syn_patrolPeriod = null;
    openTime = null;
    closeTime = null;
    // 检测是否需要审批，由父控件传参
    checkAudit: boolean;
    // 选择提交机构后，能供选择的角色列表
    commitRoles;
    // 选择提交角色后，能供选择的人员列表
    commitUsers;

    constructor(private fb: FormBuilder,
                private devService: DevService,
                private userService: UserService,
                private roleService: RoleService,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private devServiceManagerService: DevServiceManagerService,
                private router: Router) {
    }

    /**
     * 选择设备品牌后，查询用户可选的设备型号
     * @param evt
     */
    selectDevType(evt: any) {
        console.log(evt);
        if (evt) {
            setTimeout(() => {
                this.devTypeList = [{no: '', name: ''}];
                this.validateForm.controls.devType.setValue('');
                const params = {
                    devVendor: this.validateForm.controls.devVendor.value || '',
                    devCatalog: this.validateForm.controls.devCatalog.value || '',
                };
                console.log(params);
                this.devService.getDevTypeByVendor(params).subscribe(
                    data => {
                        this.devTypeList = data.data;
                        console.log(this.devTypeList);
                    }, error => {
                        console.log(error);
                        if (error instanceof HttpResponse) {
                            this.message.error(error.body.retMsg);
                        }
                    }
                );
            }, 0);
        }
    }

    selectCommitRole($event) {
        this.validateForm.controls.commitRole.setValue(null);
        const param = {
            orgNo: $event.no
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            this.commitRoles = data.data;
        });
    }

    getUserByRole($event) {
        this.validateForm.controls.commitUser.setValue(null);
        const param = {
            roleNo: $event,
            orgNo: this.validateForm.controls.commitOrg.value.no,
        };
        this.userService.getUserByPage(param).subscribe(data => {
            this.commitUsers = data.data;
        });
    }


    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }
        const params = {
            addUser: this.session.getUserSession().account, // 添加设备人员
            no: this.validateForm.controls.devNo.value,
            ip: this.validateForm.controls.ip.value,
            devCatalogNo: this.validateForm.controls.devCatalog.value,
            devVendorNo: this.validateForm.controls.devVendor.value,
            orgNo: this.validateForm.controls.orgNo.value.no,
            devTypeNo: this.validateForm.controls.devType.value,
            address: this.validateForm.controls.address.value,
            awayFlag: this.validateForm.controls.awayFlag.value || '',
            workType: this.validateForm.controls.workType.value || '',
            devService: this.validateForm.controls.devService.value || '',
            atmpArea: this.validateForm.controls.atmpArea.value,
            areaNo: this.validateForm.controls.areaNo.value,
            virtualTellerNo: this.validateForm.controls.virtualTellerNo.value || '',
            serial: this.validateForm.controls.serial.value || '',
            startDate: this.date2String(this.validateForm.controls.syn_startDate.value) || '',
            stopDate: this.date2String(this.validateForm.controls.syn_stopDate.value) || '',
            expireDate: this.date2String(this.validateForm.controls.syn_expireDate.value) || '',
            patrolPeriod: this.date2String(this.validateForm.controls.syn_patrolPeriod.value) || '',
            cashboxLimit: this.validateForm.controls.cashboxLimit.value || '',
            netType: this.validateForm.controls.netType.value || '',
            commPacket: this.validateForm.controls.commPacket.value || '',
            setupType: this.validateForm.controls.setupType.value || '',
            status: '1',
            selfBank: this.validateForm.controls.selfBank.value || '',
            sp: 'sp',
            investment: this.validateForm.controls.investment.value || '',
            openTime: this.time2String(this.validateForm.controls.openTime.value, 'HH:mm:ss'),
            closeTime: this.time2String(this.validateForm.controls.closeTime.value, 'HH:mm:ss'),
            accountOrgNo: this.validateForm.controls.coreOrgNo.value || '',
            quarterLeaseAmount: this.validateForm.controls.quarterAmount.value || '',

        };

        let auditParams = {};
        if (this.checkAudit) {
            let note = this.validateForm.controls.commitNote.value || '';
            if (note != null && note != '') {
                // 请求头不能允许中文，前端要编码，后端要解码
                note = encodeURIComponent(note);
            }
            auditParams = {
                // 审批相关数据
                auditFlag: String(this.checkAudit) || '',
                commitOrg: this.validateForm.controls.commitOrg.value.no || '',
                commitRole: this.validateForm.controls.commitRole.value || '',
                commitUser: this.validateForm.controls.commitUser.value || '',
                commitNote: note || '',
                // commitNote:'123321',
            };
        }

        console.log(params);
        this.loading = true;
        this.devService.addDev(params, auditParams)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加设备信息成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/dev']);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        // @ts-ignore
        this.openTime = new moment().startOf( 'day');
        // @ts-ignore
        this.closeTime = new moment().endOf('day');
        this.devService.getDevCatalogInfo({}).subscribe(
            data => {
                this.devCatalogList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.devService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.orgService.getCupAreaList({}).subscribe(
            data => {
                if (data.data) {
                    this.cupAreaList = [];
                    console.log(data.data);
                    data.data.forEach(
                        item => {
                            this.cupAreaList.push({no: item.codeId, name: item.areaName});
                        }
                    );
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        this.devServiceManagerService.getDevServiceManagers({}).subscribe(
            _data => {
                _data.data.forEach( item => {
                   this.devServiceList.push({no: item.no, name: item.name});
                });
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.investmentInfo = this.devService.getInvestmentInfo();
        this.awayFlagList = this.devService.getAwayFlagInfo();
        this.workTypeList = this.devService.getWorkTypeInfo();
        this.netTypeList = this.devService.getNetTypeInfo();
        this.setupTypeList = this.devService.getSetupTypeInfo();
        this.isSelfBank = this.devService.getSelfBankInfo();
        if (this.checkAudit) {
            this.validateForm = this.fb.group({
                devNo: [null, [Validators.required, Validators.pattern('^[0-9a-zA-Z]{4,8}')]],
                ip: [null, [Validators.required, Validators.pattern(
                    '^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])(\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)){3}$')]],
                orgNo: [null, [Validators.required, Validators.maxLength(20)]],
                devType: [null, [Validators.required, Validators.maxLength(5)]],
                devCatalog: [null, [Validators.required, Validators.maxLength(5)]],
                devVendor: [null, [Validators.required, Validators.maxLength(5)]],
                address: [null, [Validators.required, Validators.maxLength(80)]],
                awayFlag: [null, [Validators.required]],
                atmpArea: [null],
                areaNo: ['04593451', [Validators.required, Validators.pattern('^[\\d]{8}$')]],
                workType: [null, [Validators.required]],
                devService: [null, [Validators.required]],
                virtualTellerNo: [null, [Validators.required, Validators.pattern('^[0-9a-zA-Z]{1,8}')]],
                setupType: [null, [Validators.required]],
                serial: [null, [Validators.maxLength(40), Validators.pattern('^[A-Za-z0-9]+$')]],
                cashboxLimit: [null, [Validators.maxLength(7), Validators.pattern('^([1-9][0-9]*)$')]],
                netType: [null],
                commPacket: ['8092', [Validators.maxLength(5), Validators.pattern('^([1-9][0-9]*)$')]],
                syn_startDate: [null],
                syn_stopDate: [null],
                syn_expireDate: [null],
                syn_patrolPeriod: [null],
                commitOrg: [null, [Validators.required]],
                commitRole: [null, [Validators.required]],
                commitUser: [null],
                commitNote: [null],
                investment: [null],
                selfBank: [null],
                openTime: [null, [Validators.required]],
                closeTime: [null, [Validators.required]],
                coreOrgNo: [null],
                quarterAmount: [null],
            });
        }else {
            this.validateForm = this.fb.group({
                devNo: [null, [Validators.required, Validators.pattern('^[0-9a-zA-Z]{4,8}')]],
                ip: [null, [Validators.required, Validators.pattern(
                    '^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])(\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)){3}$')]],
                orgNo: [null, [Validators.required, Validators.maxLength(20)]],
                devType: [null, [Validators.required, Validators.maxLength(5)]],
                devCatalog: [null, [Validators.required, Validators.maxLength(5)]],
                devVendor: [null, [Validators.required, Validators.maxLength(5)]],
                address: [null, [Validators.required, Validators.maxLength(80)]],
                awayFlag: [null, [Validators.required]],
                workType: [null, [Validators.required]],
                devService: [null, [Validators.required]],
                atmpArea: [null],
                areaNo: ['04593451', [Validators.required, Validators.pattern('^[\\d]{8}$')]],
                virtualTellerNo: [null, [Validators.required, Validators.pattern('^[0-9a-zA-Z]{1,8}')]],
                setupType: [null, [Validators.required]],
                serial: [null, [Validators.maxLength(40), Validators.pattern('^[A-Za-z0-9]+$')]],
                cashboxLimit: [null, [Validators.maxLength(7), Validators.pattern('^([1-9][0-9]*)$')]],
                netType: [null],
                commPacket: ['8092', [Validators.maxLength(5), Validators.pattern('^([1-9][0-9]*)$')]],
                syn_startDate: [null],
                syn_stopDate: [null],
                syn_expireDate: [null],
                syn_patrolPeriod: [null],
                investment: [null],
                selfBank: [null],
                openTime: [null, [Validators.required]],
                closeTime: [null, [Validators.required]],
                coreOrgNo: [null],
                quarterAmount: [null]
            });
        }
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date: Date): string {
        if (!date) {
            date = new Date();
        }
        date.setHours(date.getHours() + 8);
        const _date = date.toISOString().substring(0, 10);
        const _time = date.toTimeString().substring(0, 8);
        return _date;
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    /**
     * 时间转字符串
     * @param value
     */
    time2String(date: Date, fmt: string) {
        // @ts-ignore
        return new moment(date).format(fmt);
    }
}

