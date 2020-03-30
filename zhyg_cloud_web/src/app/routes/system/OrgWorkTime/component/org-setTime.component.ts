import {Component, OnInit} from '@angular/core';
 import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Org} from '../../../../models/org';
import {OrgType} from '../../../../models/orgType';
import {OrgWorkTimeService} from '../OrgWorkTime.service';
import {HttpResponse} from '@angular/common/http';
import {Router} from '@angular/router';



@Component({
    templateUrl: './org-setTime.html',

})
export class OrgSetTimeComponent implements OnInit {

    fields = [
        {key: '星期一   ', value: 'Monday', checked: false, disable: false},
        {key: '星期二   ', value: 'Tuesday', checked: false, disable: false},
        {key: '星期三   ', value: 'Wednesday', checked: false, disable: false},
        {key: '星期四   ', value: 'Thursday', checked: false, disable: false},
        {key: '星期五   ', value: 'Friday', checked: false, disable: false},
        {key: '星期六   ', value: 'Saturday', checked: false, disable: false},
        {key: '星期日   ', value: 'Sunday', checked: false, disable: false},
    ];
    isBusiness = 'true';
    businessStatus = 'Y';
    businessList = [
        {no: 'Y' , name: '营业'},
        {no: 'N', naem: '不营业'}
    ];
    specialDatePicker= {startDate: null , endDate: null}; //特殊日期设定
     //加载时间
    datePicker = {startDate: null, endDate: null};
    validateForm: FormGroup;
    time: Date;
    defaultOpenValue = new Date(0, 0, 0, 0, 0, 0);
    orgs;
    org: Org;
    loading = false;
    showFlag = 0;
    tmp;
    upper = '';
    i = 0;
    orgTypeList: OrgType[] = [];
    formModel = {};
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
            no: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(20)]],
            name: [null, [Validators.required, Validators.maxLength(20)]],
            upper: [null],
            address: [null, Validators.maxLength(200)],
            orgType: [null],
            x: [null, Validators.maxLength(20)],
            y: [null, Validators.maxLength(20)],
            linkman: [null, Validators.maxLength(20)],
            telephone: [null, Validators.maxLength(20)],
            endWorkTime: [null, Validators.maxLength(256)],
            startWorkTime: [null, Validators.maxLength(256)],
            specialStartDate: [null, Validators.maxLength(256)],
            specialEndDate: [null, Validators.maxLength(256)],
            specialStartWorkTime: [null, Validators.maxLength(256)],
            specialEndWorkTime: [null, Validators.maxLength(256)],
            businessStatus : [null, Validators.maxLength(20)],
        });
        this.tmp = [{no: '', name: ''}];

        // 获取机构详细信息
        this.loading = true;
        this.orgService.getOrg(this.orgs.no).subscribe(
            _data => {
                const data = _data.data;
                this.loading = false;
                this.org = data;
                this.validateForm.controls.no.setValue(this.org.no);
                this.validateForm.controls.name.setValue(this.org.name);
                if (this.org.parentOrgNo) {

                    this.validateForm.controls.upper.setValue(data.parentOrgName || '');
                } else {
                    // 总行没有上级机构，因此上级机构为自己
                    this.validateForm.controls.upper.setValue('总行' || '');

                }
                this.validateForm.controls.orgType.setValue(this.org.orgType || '');
                this.validateForm.controls.address.setValue(this.org.address || '');
                this.validateForm.controls.linkman.setValue(this.org.linkman || '');
                this.validateForm.controls.telephone.setValue(this.org.telephone || '');
                // this.validateForm.controls.workTime.setValue(this.org.workTime || '');

            }, (error) => {
                console.log("orgsetTime加载失败");

            });


    }

    getFormControl(name) {
        return this.validateForm.controls[name];
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
    }


    /**
     * 获得多选框数据
     * */
    data() {
        for (let a = 0; a < this.fields.length; a++) {
            if (this.fields[a].checked === true) {
                alert(this.fields[a].value);
            }
        }

    }

    /**
     * 判断是标准时间还是特殊时间
     * */
    switch = false;
    switchEvent2() {
        this.switch = true;
    }

    switchEvent1() {
        this.switch = false;
    }



    specialTime() {


        if (this.validateForm.invalid) {
            return;
        }

        const params = {
            no: this.validateForm.controls.no.value,

            specialStartDate: this.date2String(this.validateForm.controls.specialStartDate.value).replace(/-/g, ''),

            specialEndDate: this.date2String(this.validateForm.controls.specialEndDate.value).replace(/-/g, ''),
            specialStartWorkTime: this.time2String(this.validateForm.controls. specialStartWorkTime.value).replace(/-/g, ''),
            specialEndWorkTime: this.time2String(this.validateForm.controls. specialEndWorkTime.value).replace(/-/g, ''),
            businessStatus: this.validateForm.controls.businessStatus.value
        };
        alert(params.specialStartDate + '~' + params.specialEndDate);
        if (this.validateForm.controls.specialStartDate.value > this.validateForm.controls.specialEndDate.value
            || this.validateForm.controls. specialStartWorkTime.value > this.validateForm.controls. specialEndWorkTime.value) {
            // alert("开始时间不能大于结束时间，请重新填写");
            this.message.error('开始时间不能大于结束时间，请重新填写');

        } else {
            // alert("时间"+params.workTime);
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
        alert("tijiao");

        if (this.validateForm.invalid) {
            return;
        }

        for (let a = 0; a < this.fields.length; a++) {
            if (this.fields[a].checked === true) {
                 alert(this.fields[a].value);
                if(this.weekdata==''){
                    this.weekdata=this.fields[a].value;
                }else {
                    this.weekdata=this.weekdata+"-"+this.fields[a].value;
                }

            }
        }


        const params = {

            no:this.validateForm.controls.no.value,
            startWorkTime:this.time2String(this.validateForm.controls.startWorkTime.value).replace(/-/g, ''),
            endWorkTime:this.time2String(this.validateForm.controls.endWorkTime.value).replace(/-/g, ''),
            weekDays:this.weekdata,
        };
        if (this.validateForm.controls.startWorkTime.value > this.validateForm.controls.endWorkTime.value) {
            // alert("开始时间不能大于结束时间，请重新填写");
            this.message.error('开始时间不能大于结束时间，请重新填写');

        } else {
            // alert("时间"+params.workTime);
            console.log(params);
            this.loading = true;
            this.orgWorkTimeService.SetNormalBatchOrgWorkTime(params).subscribe(data => {
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

    changeType(evt: any) {
        if (evt == 'Y') {
           this.isBusiness = 'true';
        } else if (evt == 'N') {
            this.isBusiness = 'false';
        }
    }
}
