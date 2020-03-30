import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {OrgService} from '../../org/org.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Dev} from '../../../../models/dev';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {DevWorkTimeService} from '../devWorkTime.service';

@Component({
    templateUrl: './devWorkTime-modify.html'
})
export class DevWorkTimeModifyComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    dev = new Dev();
    showFlag = 0;
    selectedValue = 'Monday';
    devs;
    switch = false;
    standTimePicker: any = [{startTime: null , endTime: null}];
    specialTimePicker: any = [{startTime: null , endTime: null}];
    weeks = [
        {chName: '星期一' , enName: 'Monday'},
        {chName: '星期二' , enName: 'Tuesday'},
        {chName: '星期三' , enName: 'Wednesday'},
        {chName: '星期四' , enName: 'Thursday'},
        {chName: '星期五' , enName: 'Friday'},
        {chName: '星期六' , enName: 'Saturday'},
        {chName: '星期日' , enName: 'Sunday'}];

    constructor(private fb: FormBuilder,
                private devWorkTimeService: DevWorkTimeService,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService) {
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            datesType: [null],
            startTime: [null, [Validators.required]],
            endTime: [null, [Validators.required]],
            dates: [null],
        });
    }

    _submitForm() {
        let params;
        const selDevNos = [];
        for (const dev of this.devs) {
            selDevNos.push(dev.no);
        }
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }

        if (!this.switch) {
            if (!this.checkTimePicker(this.standTimePicker)) {
                return;
            }
            const startTime = this.standTimePicker.map(x => x.startTime);
            const startTimeString = [];
            for (let i = 0; i < startTime.length; i++) {
                startTimeString.push(this.time2String(startTime[i]).replace(':', ''));
            }
            const endTime = this.standTimePicker.map(x => x.endTime);
            const endTimeString = [];
            for (let i = 0; i < endTime.length; i++) {
                endTimeString.push(this.time2String(endTime[i]).replace(':', ''));
            }
            params = {
                dates: '',
                datesType: this.selectedValue,
                datesTypeStatement: this.weekEn2Ch(this.selectedValue),
                devNos: selDevNos,
                startTime: startTimeString.join('|'),
                endTime: endTimeString.join('|')
            };
        } else {
            if (!this.checkTimePicker(this.specialTimePicker)) {
                return;
            }
            const startTime = this.specialTimePicker.map(x => x.startTime);
            const startTimeString = [];
            for (let i = 0; i < startTime.length; i++) {
                startTimeString.push(this.time2String(startTime[i]).replace(':', ''));
            }
            const endTime = this.specialTimePicker.map(x => x.endTime);
            const endTimeString = [];
            for (let i = 0; i < endTime.length; i++) {
                endTimeString.push(this.time2String(endTime[i]).replace(':', ''));
            }
            params = {
                dates: this.date2String(this.validateForm.controls.dates.value).replace(/-/g, ''),
                datesType: 'Special',
                datesTypeStatement: '特殊日期',
                devNos: selDevNos,
                endTime: endTimeString.join('|'),
                startTime: startTimeString.join('|')
            };
        }
        console.log(params);
        this.loading = true;
        this.devWorkTimeService.SetDevWorkTime(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`设备工作时间添加成功！`);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
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
        return _date;
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
     * 英文星期转成中文
     * @param date
     */
    weekEn2Ch(weekday): string {
        switch (weekday) {
            case 'Monday':
                return '星期一';
            case 'Tuesday':
                return '星期二';
            case 'Wednesday':
                return '星期三';
            case 'Thursday':
                return '星期四';
            case 'Friday':
                return '星期五';
            case 'Saturday':
                return '星期六';
            case 'Sunday':
                return '星期日';
        }
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    /**
     * 添加时间选择器
     */
    addTimePicker(arr) {
        const i = arr.length;
        if (i < 5) {
            arr.push({startTime: null , endTime: null});
        }else {
            this.message.warning('最多添加五个工作时段');
        }
    }

    /**
     * 删除时间选择器
     */
    delTimePicker(arr, index) {
        if (arr.length == 1) {
            this.message.warning('至少添加一个工作时段');
            return;
        }
        arr.splice(index, 1);
    }

    /**
     * 校验时间段的合法性
     */
    checkTimePicker(timePicker): boolean {
        const timeArr = timePicker;
        for (let i = 0 ; i < timeArr.length ; i++) {
            if (timeArr[i].startTime === null || timeArr[i].endTime === null) {
                this.message.error( '第' + (i + 1) + '个时间段没有选择时间');
                return false;
            }
            if (timeArr[i].startTime >= timeArr[i].endTime) {
                this.message.error( '第' + (i + 1) + '个时间段结束时间不能小于开始时间');
                return false;
            }
            for (let j = i + 1; j < timeArr.length; j++) {
                if (( timeArr[i].startTime <= timeArr[j].startTime && timeArr[i].endTime <= timeArr[j].startTime ) ||
                    ( timeArr[i].startTime >= timeArr[j].endTime && timeArr[i].endTime >= timeArr[j].endTime)) {
                    continue;
                } else {
                    this.message.error( '第' + (i + 1) + '个时间段与第' + (j + 1) + '个时间段相交！');
                    return false;
                }
            }
        }
        return true;
    }

}
