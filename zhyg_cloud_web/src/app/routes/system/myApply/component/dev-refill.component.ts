import {Component, OnInit} from '@angular/core';
import {DevService} from '../../dev/dev.service';
import {OrgService} from '../../org/org.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {UserService} from '../../user/user.service';
import {RoleService} from '../../role/role.service';
import {DevServiceManagerService} from '../../devServiceManager/devServiceManager.service';
import * as moment from 'moment';

@Component({
    templateUrl: './dev-refill.html'
})
export class DevRefillComponent implements OnInit {

    validateForm: FormGroup;
    devTypeList = [];
    devCatalogList = [];
    devVendorList = [];
    awayFlagList = [];
    workTypeList = [];
    devServiceList = [];
    spList = [];
    netTypeList = [];
    setupTypeList = [];
    isSelfBank = [];
    investmentList = [];
    cupAreaList = [];
    dev;
    devs;
    org = new Org();
    loading = false;
    syn_startDate = null;
    syn_stopDate = null;
    syn_expireDate = null;
    syn_patrolPeriod = null;
    // 检测是否需要审批，由父控件传参
    checkAudit: boolean;
    // 选择提交机构后，能供选择的角色列表
    commitRoles;
    // 选择提交角色后，能供选择的人员列表
    commitUsers;
    // 为了记录修改前的数据，所有先存储起来
    before;
    // 设备审批时，重新填写需要数据回显
    param;
    // 校验重填是否修改
    isMod: boolean;

    constructor(private fb: FormBuilder,
                private devService: DevService,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private userService: UserService,
                private roleService: RoleService,
                private router: Router,
                private devServiceManagerService: DevServiceManagerService) {

    }


    ngOnInit(): void {
        this.initValidateForm();

        this.initSelectList();

        this.initPageData();
    }

    initPageData() {

        if (this.param != null) {
            console.log(this.param);
            this.loading = true;
            this.orgService.getOrg(this.param.orgNo).subscribe(data => {
                this.loading = false;
                this.validateForm.controls.upper.setValue({
                    no: this.param.orgNo,
                    name: data.data.name
                } || {});
                this.validateForm.controls.devCatalog.setValue(this.param.devCatalogNo);
                this.validateForm.controls.devVendor.setValue(this.param.devVendorNo);
                this.validateForm.controls.devType.setValue(this.param.devTypeNo);
                this.validateForm.controls.devNo.setValue(this.param.no);
                this.validateForm.controls.ip.setValue(this.param.ip);
                this.validateForm.controls.address.setValue(this.param.address || '');
                this.validateForm.controls.awayFlag.setValue(this.param.awayFlag || '');
                this.validateForm.controls.workType.setValue(this.param.workType || '');
                this.validateForm.controls.devService.setValue(this.param.devService || '');
                this.validateForm.controls.atmpArea.setValue(this.param.atmpArea || '');
                this.validateForm.controls.virtualTellerNo.setValue(this.param.virtualTellerNo);
                this.validateForm.controls.serial.setValue(this.param.serial);
                this.validateForm.controls.syn_startDate.setValue(this.string2Date(this.param.startDate) || '');
                this.validateForm.controls.syn_stopDate.setValue(this.string2Date(this.param.stopDate) || '');
                this.validateForm.controls.syn_expireDate.setValue(this.string2Date(this.param.expireDate) || '');
                this.validateForm.controls.syn_patrolPeriod.setValue(this.string2Date(this.param.patrolPeriod) || '');
                this.validateForm.controls.cashboxLimit.setValue(this.param.cashboxLimit || '');
                this.validateForm.controls.netType.setValue(this.param.netType || '');
                this.validateForm.controls.commPacket.setValue(this.param.commPacket || '');
                this.validateForm.controls.setupType.setValue(this.param.setupType || '');
                this.validateForm.controls.selfBank.setValue(this.param.selfBank || '');
                this.validateForm.controls.investment.setValue(this.param.investment || '');
                this.validateForm.controls.openTime.setValue(this.time2Date(this.param.openTime));
                this.validateForm.controls.closeTime.setValue(this.time2Date(this.param.closeTime));
                this.validateForm.controls.quarterLeaseAmount.setValue(this.param.quarterLeaseAmount || '');
                this.validateForm.controls.accountOrgNo.setValue(this.param.accountOrgNo || '');
            });
            if (this.param.no !== null) {
                this.loading = true;
                this.devService.getDev(this.param.no).subscribe(data => {
                    this.loading = false;
                    this.before = data.data;
                });
            }


        }

    }

    initSelectList() {
        // 初始化表单
        this.devService.getDevTypeByVendor({}).subscribe(
            data => {
                this.devTypeList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
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
        this.devServiceManagerService.getDevServiceManagers({}).subscribe(
            _data => {
                _data.data.forEach(item => {
                    this.devServiceList.push({no: item.no, name: item.name});
                });
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
        this.investmentList = this.devService.getInvestmentInfo();
        this.isSelfBank = this.devService.getSelfBankInfo();
        this.awayFlagList = this.devService.getAwayFlagInfo();
        this.workTypeList = this.devService.getWorkTypeInfo();
        this.spList = this.devService.getSpInfo();
        this.netTypeList = this.devService.getNetTypeInfo();
        this.setupTypeList = this.devService.getSetupTypeInfo();
    }

    initValidateForm() {
        // 验证判断
        this.validateForm = this.fb.group({
            devNo: [null, [Validators.required, Validators.pattern('^[0-9a-zA-Z]{4,8}')]],
            ip: [null, [Validators.required, Validators.pattern(
                '^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])(\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)){3}$')]],
            upper: [null, [Validators.required, Validators.maxLength(20)]],
            devType: [null, [Validators.required, Validators.maxLength(5)]],
            devCatalog: [null, [Validators.required, Validators.maxLength(5)]],
            devVendor: [null, [Validators.required, Validators.maxLength(5)]],
            address: [null, [Validators.required, Validators.maxLength(80)]],
            awayFlag: [null, [Validators.required]],
            workType: [null, [Validators.required]],
            devService: [null, [Validators.required]],
            atmpArea: [null, [Validators.required]],
            virtualTellerNo: [null, [Validators.required, Validators.pattern('^[0-9a-zA-Z]{1,8}')]],
            setupType: [null, [Validators.required]],
            serial: [null, [Validators.maxLength(40), Validators.pattern('^[A-Za-z0-9]+$')]],
            cashboxLimit: [null, [Validators.maxLength(7), Validators.pattern('^([1-9][0-9]*)$')]],
            netType: [null],
            commPacket: [null, [Validators.maxLength(5), Validators.pattern('^([1-9][0-9]*)$')]],
            syn_startDate: [null],
            syn_stopDate: [null],
            syn_expireDate: [null],
            syn_patrolPeriod: [null],
            commitOrg: [null, [Validators.required]],
            commitRole: [null, [Validators.required]],
            commitUser: [null],
            commitNote: [null],
            // 重庆银行所需的三个字段
            investment: [null],
            selfBank: [null],
            openTime: [null, [Validators.required]],
            closeTime: [null, [Validators.required]],
            accountOrgNo: [null, [Validators.required]],
            quarterLeaseAmount: [null, [Validators.required]],
        });
    }

    /**
     * 选择设备品牌后，查询用户可选的设备类型
     * @param evt
     */
    selectDevType(evt: any) {
        console.log(evt);
        if (evt) {
            const params = {
                devVendor: evt || '',
                devCatalog: '',
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
        }
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

    selectCommitRole($event) {
        this.validateForm.controls.commitRole.setValue(null);
        const param = {
            orgNo: $event.no
        };
        this.roleService.qryAvailableRoleByOrgNo(param).subscribe(data => {
            this.commitRoles = data.data;
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
            addUser: this.session.getUserSession().account,
            no: this.validateForm.controls.devNo.value,
            ip: this.validateForm.controls.ip.value,
            orgNo: this.validateForm.controls.upper.value.no,
            devCatalogNo: this.validateForm.controls.devCatalog.value,
            devVendorNo: this.validateForm.controls.devVendor.value,
            devTypeNo: this.validateForm.controls.devType.value,
            address: this.validateForm.controls.address.value || '',
            awayFlag: this.validateForm.controls.awayFlag.value || '',
            workType: this.validateForm.controls.workType.value || '',
            devService: this.validateForm.controls.devService.value || '',
            atmpArea: this.validateForm.controls.atmpArea.value || '',
            virtualTellerNo: this.validateForm.controls.virtualTellerNo.value,
            serial: this.validateForm.controls.serial.value,
            startDate: this.date2String(this.validateForm.controls.syn_startDate.value) || '',
            stopDate: this.date2String(this.validateForm.controls.syn_stopDate.value) || '',
            expireDate: this.date2String(this.validateForm.controls.syn_expireDate.value) || '',
            patrolPeriod: this.date2String(this.validateForm.controls.syn_patrolPeriod.value) || '',
            cashboxLimit: this.validateForm.controls.cashboxLimit.value || '',
            netType: this.validateForm.controls.netType.value || '',
            commPacket: this.validateForm.controls.commPacket.value || '',
            setupType: this.validateForm.controls.setupType.value || '',
            selfBank: this.validateForm.controls.selfBank.value || '',
            investment: this.validateForm.controls.investment.value || '',
            openTime: this.time2String(this.validateForm.controls.openTime.value),
            closeTime: this.time2String(this.validateForm.controls.closeTime.value),
            accountOrgNo: this.validateForm.controls.accountOrgNo.value || '',
            quarterLeaseAmount: this.validateForm.controls.quarterLeaseAmount.value || '',
            sp: 'sp',
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
            };
        }

        this.loading = true;
        if (this.isMod) {
            this.devService.modDev(this.before, params, auditParams)
                .subscribe(data => {
                    this.loading = false;
                    this.message.success('修改设备申请成功！');
                    this.nzModal.destroy('onOk');
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
        } else {
            this.devService.addDev(params, auditParams)
                .subscribe(data => {
                    this.loading = false;
                    this.message.success('添加设备申请成功！');
                    this.nzModal.destroy('onOk');
                }, (error) => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
        }

    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
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
        return date.toISOString().substring(0, 10);
    }

    time2Date(str: string) {
        if (str == null) {
            return ;
        }
        const d = new Date();
        const arr = str.split(':');
        d.setHours(Number(arr[0]));
        d.setMinutes(Number(arr[1]));
        d.setSeconds(Number(arr[0]));
        console.log(d);
        return d;
    }

    string2Date(str: string): Date {
        if (str == null) {
            return ;
        }
        return new Date(str.replace(/-/g, '/'));
    }

    time2String (date: Date) {
        // @ts-ignore
        console.log(new moment(date).format( 'HH:mm:ss'));
        // @ts-ignore
        return new moment(date).format( 'HH:mm:ss');
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
