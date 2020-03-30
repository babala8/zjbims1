import {Component, OnInit} from '@angular/core';
import {DevStopService} from '../devStop.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {SessionService} from '@core/session.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {HttpResponse} from '@angular/common/http';


@Component({
    templateUrl: './devStop-add.html',
})

export class DevStopAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    devStop;
    stopDevStartTime;
    stopDevEndTime;
    datePicker = {startDate: null, endDate: null};
    stopType = [
        {no: '0', name: '放假'},
        {no: '1', name: '装修'},
        {no: '2', name: '停电'},
        {no: '3', name: '设备故障未修复'},
        {no: '4', name: '其他'},
    ];
    isAfter = [
        {no: '1', name: '事后停机'},
        {no: '0', name: '事前停机'},
    ];

    constructor(
        private fb: FormBuilder,
        private devStopService: DevStopService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
        private session: SessionService,
        private router: Router,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [this.devStop],
            stopReason: [null, [Validators.required, Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9]{2,80}$')]],
            stopDevType: [null, [Validators.required]],
            stopDevStartDate: [null, [Validators.required]],
            StartTime: [null, [Validators.required]],
            stopDevEndDate: [null, [Validators.required]],
            EndTime: [null, [Validators.required]],
            isAfter: [null, [Validators.required]],
        });
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

    time2String(date: Date): string {
        if (!date) {
            return '';
        }
        const _time = date.toTimeString().substring(0, 5);
        return _time;
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    _submitForm() {
        this.stopDevStartTime = this.date2String(this.validateForm.controls.stopDevStartDate.value) + ' ' +
            this.time2String(this.validateForm.controls.StartTime.value);
        this.stopDevEndTime = this.date2String(this.validateForm.controls.stopDevEndDate.value) + ' ' +
            this.time2String(this.validateForm.controls.EndTime.value);
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
                console.log('as');
            }
        }

        if (this.validateForm.invalid) {
            return;
        }
        console.log('ass');

        const params = {
            devNo: this.validateForm.controls.devNo.value,
            stopDevStartTime: this.stopDevStartTime,
            stopDevType: this.validateForm.controls.stopDevType.value,
            stopDevReason: this.validateForm.controls.stopReason.value,
            stopDevEndTime: this.stopDevEndTime,
            opNo: this.session.account,
            isAfter: this.validateForm.controls.isAfter.value,
        };
        const isafter = this.validateForm.controls.isAfter.value;
        if (!this.checkTimePicker(this.stopDevStartTime, this.stopDevEndTime, isafter)) {
            return;
        }
        this.loading = true;
        this.devStopService.addStopDev(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加设备停机成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/devStop']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {

                    this.message.error(error.body.retMsg);
                }
            });

    }

    str2Date(str: string): Date {
        return new Date(str);
    }

    checkTimePicker(start, end, param: string): boolean {
        let startDateTime: Date;
        let endDateTime: Date;
        startDateTime = this.str2Date(start);
        endDateTime = this.str2Date(end);
        let now: Date;
        now = new Date();
        if (startDateTime > endDateTime) {
            this.message.error('停机开始时间不能大于停机结束时间');
            return false;
        }
        if (param === '0') {
            if (startDateTime < now) {
                this.message.error('事前停机：停机开始时间不能小于当前时间');
                return false;
            }
            return true;
        }
        if (param === '1') {
            if (endDateTime > now) {
                this.message.error('事后停机：结束时间不能大于当前时间');
                return false;
            }
            return true;
        }
        return true;
    }
}
