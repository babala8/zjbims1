import {Component, OnInit} from '@angular/core';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Org} from '../../../../models/org';
import {OrgType} from '../../../../models/orgType';
import {OrgWorkTimeService} from '../OrgWorkTime.service';
import {HttpResponse} from '@angular/common/http';
import {Router} from '@angular/router';
import {weekdays} from 'moment';


@Component({
    templateUrl: './org-batchAdd.html',

})
export class OrgBatchAddComponent implements OnInit {

    isBusiness = 'false';

    businessList = [
        {no: 'Y', name: '营业'},
        {no: 'N', name: '不营业'}
    ];
    fields = [
        {key: '星期一   ', value: 'Monday', checked: false, disable: false},
        {key: '星期二   ', value: 'Tuesday', checked: false, disable: false},
        {key: '星期三   ', value: 'Wednesday', checked: false, disable: false},
        {key: '星期四   ', value: 'Thursday', checked: false, disable: false},
        {key: '星期五   ', value: 'Friday', checked: false, disable: false},
        {key: '星期六   ', value: 'Saturday', checked: false, disable: false},
        {key: '星期日   ', value: 'Sunday', checked: false, disable: false},
    ];
    switch = false;
    specialDatePicker = {startDate: null, endDate: null};
    datePicker = {startDate: null, endDate: null};
    validateForm: FormGroup;
    validateForm1: FormGroup;
    time: Date;
    orgs;
    org: Org;
    loading = false;
    showFlag = 0;
    tmp;
    upper = '';
    i = 0;
    orgTypeList: OrgType[] = [];
    formModel = {};
    noData = '';
    weekdata = '';

    constructor(
        private fb: FormBuilder,
        private orgService: OrgService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
        private orgWorkTimeService: OrgWorkTimeService,
        private router: Router
    ) {
    }

    ngOnInit() {

        this.validateForm = this.fb.group({
            endWorkTime: [null, [Validators.required, Validators.maxLength(256)]],
            startWorkTime: [null, [Validators.required, Validators.maxLength(256)]],
            zhang: [null, Validators.maxLength(256)],
        });

        this.validateForm1 = this.fb.group({
            specialStartDate: [null, [Validators.required, Validators.maxLength(256)]],
            specialEndDate: [null, [Validators.required, Validators.maxLength(256)]],
            specialStartWorkTime: [null, Validators.maxLength(256)],
            specialEndWorkTime: [null, Validators.maxLength(256)],
            businessStatus: [null, [Validators.required, Validators.maxLength(20)]],
        });
        this.tmp = [{no: '', name: ''}];
        // 获取机构详细信息
        this.loading = false;
    }


    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    getFormControl1(name) {
        return this.validateForm1.controls[name];
    }


    specialTime() {

        if (this.validateForm1.invalid) {
            return;
        }
        for (let i = 0; i < this.orgs.length; i++) {
            if (i == 0) {
                this.noData = this.orgs[i].no;
            } else {
                this.noData = this.noData + '-' + this.orgs[i].no;
            }
        }
        const specialStartWorkTime = this.validateForm1.controls.specialStartWorkTime.value;
        const specialEndWorkTime = this.validateForm1.controls.specialEndWorkTime.value;
        const businessStatus = this.validateForm1.controls.businessStatus.value;

        if (businessStatus === 'Y') {
            if (specialEndWorkTime === null || specialStartWorkTime === null) {
                this.message.error('请选择工作时间');
                return;
            }
            if (specialStartWorkTime > specialEndWorkTime) {
                this.message.error('开始时间不能大于结束时间');
                return;
            }
        }
        const params = {
            no: this.noData,
            specialStartDate: this.date2String(this.validateForm1.controls.specialStartDate.value).replace(/-/g, ''),
            specialEndDate: this.date2String(this.validateForm1.controls.specialEndDate.value).replace(/-/g, ''),
            specialStartWorkTime: this.time2String(specialStartWorkTime).replace(/-/g, ''),
            specialEndWorkTime: this.time2String(specialEndWorkTime).replace(/-/g, ''),
            businessStatus: businessStatus
        };
        if (this.validateForm1.controls.specialStartDate.value > this.validateForm1.controls.specialEndDate.value
            || this.validateForm1.controls.specialStartWorkTime.value > this.validateForm1.controls.specialEndWorkTime.value) {
            // alert("开始时间不能大于结束时间，请重新填写");
            this.message.error('开始时间不能大于结束时间，请重新填写');
        } else {
            console.log(params);
            this.loading = true;
            this.orgWorkTimeService.setBatchOrgWorkTime(params).subscribe(data => {
                this.loading = false;
                this.message.success('时间设置成功成功！');
                this.nzModal.destroy('onOk');

                this.router.navigate(['/system/orgWorkTime']);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/orgWorkTime']);

            }, (error) => {
                this.loading = false;

                this.message.error('设置失败');

                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        }

    }


    normalTime() {
        if (this.validateForm.invalid) {
            return;
        }

        for (let i = 0; i < this.orgs.length; i++) {
            if (i == 0) {
                this.noData = this.orgs[i].no;
            } else {
                this.noData = this.noData + '-' + this.orgs[i].no;
            }

        }

        for (let a = 0; a < this.fields.length; a++) {
            if (this.fields[a].checked === true) {
                if (this.weekdata == '') {
                    this.weekdata = this.fields[a].value;
                } else {
                    this.weekdata = this.weekdata + '-' + this.fields[a].value;
                }
            }
        }

        const params = {
            no: this.noData,
            startWorkTime: this.time2String(this.validateForm.controls.startWorkTime.value).replace(/-/g, ''),
            endWorkTime: this.time2String(this.validateForm.controls.endWorkTime.value).replace(/-/g, ''),
            weekDays: this.weekdata,
        };
        if (this.weekdata === '') {
            this.message.error('请选择星期');
            return;
        }
        if (this.validateForm.controls.startWorkTime.value === null || this.validateForm.controls.endWorkTime.value === null) {
            this.message.error('请选择时间');
            return;
        }
        if (this.validateForm.controls.startWorkTime.value > this.validateForm.controls.endWorkTime.value) {

            this.message.error('开始时间不能大于结束时间，请重新填写');

        } else {

            console.log(params);
            this.loading = true;
            this.orgWorkTimeService.SetNormalBatchOrgWorkTime(params).subscribe(data => {
                this.loading = false;
                this.message.success('时间设置成功成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/orgWorkTime']);

            }, (error) => {
                this.loading = false;
                this.message.error('设置失败');
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        }
        this.weekdata = '';
    }

    /**
     * 时间和字符串相互转换
     * @param date
     */
    time2String(date: Date): string {
        if (!date) {
            date = new Date();
        }
        date.setHours(date.getHours());
        const _time = date.toTimeString().substring(0, 5);
        return _time;
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
        return _date;
    }

    /****
     * 多选框数据初始化
     * */
    cancel() {
        this.nzModal.destroy('onCancel');
        this.weekdata = '';
    }


    changeType(evt: any) {
        if (evt == 'Y') {
            this.isBusiness = 'false';
        } else if (evt == 'N') {
            this.isBusiness = 'true';
        }
    }

}
