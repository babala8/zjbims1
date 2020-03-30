import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {UnelockTaskService} from '../unelockTask.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';

import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {BankManagerPersion} from '../../../../models/bankManagerPersion';



@Component({
    templateUrl: './unelockTask-add.html'
})
export class UnelockTaskAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    i = 0;
    showFlag = 0;

    bankManagerPersionList: BankManagerPersion[] = [];

    constructor(private fb: FormBuilder,
                private unelockTaskService: UnelockTaskService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private router: Router) {
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
            elockId: this.validateForm.controls.elockId.value,
            devNo: this.validateForm.controls.devNo.value,
            startTimeDate: this.date2String(this.validateForm.controls.startTimeDate.value),
            startTimeTime: this.time2String(this.validateForm.controls.startTimeTime.value),
            /*startTime: this.date2String(this.validateForm.controls.startTimeDate.value) +
                this.time2String(this.validateForm.controls.startTimeTime.value) ,*/
            endTimeDate: this.date2String(this.validateForm.controls.endTimeDate.value),
            endTimeTime: this.time2String(this.validateForm.controls.endTimeTime.value),
/*            endTime: this.date2String(this.validateForm.controls.endTimeDate.value) +
                this.time2String(this.validateForm.controls.endTimeTime.value) ,*/
            user1No: this.validateForm.controls.user1No.value || '',
            user2No: this.validateForm.controls.user2No.value || '',
            addUser: this.session.account,
        };


        this.loading = true;
        this.unelockTaskService.addUnelockTask(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加开锁任务成功！`);
                this.nzModal.destroy('onOk');

                /*页面跳转*/
                this.router.navigate(['/elock/unelockTaskManager']);
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
        this.validateForm = this.fb.group({
            elockId: [null, [Validators.required, Validators.minLength(1), Validators.maxLength(40)]],
            devNo: [null, [Validators.required, Validators.maxLength(20)]],
            startTimeDate: [null, [Validators.required]],
            startTimeTime: [null, [Validators.required]],
            endTimeDate: [null, [Validators.required]],
            endTimeTime: [null, [Validators.required]],
            user1No: [null],
            user2No: [null],
        });
        /*this.bankManagerPersionList = this.unelockTaskService.getBankManagerPersionList();*/
        this.unelockTaskService.getBankManagerPersionList().subscribe(
            _data1 => {
                const data = _data1.data;
                this.loading = false;
                console.log(data);
                this.bankManagerPersionList = data;
            },
            error => {
                this.loading = false;
                this.message.error(error.body.retMsg);
            }
        );
    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date: Date): string {
        /*if (!date) {
            date = new Date();
        }*/
        /*date.setHours(date.getHours() + 8);*/
        const _date = date.toISOString().substring(0, 10);
        /*const _time = date.toTimeString().substring(0, 8);*/
        return _date;
    }
    /**
     * 时间和字符串相互转换
     * @param date
     */
    time2String(date: Date): string {
        /*if (!date) {
            date = new Date();
        }*/
        date.setHours(date.getHours() + 8);
        /*const _date = date.toISOString().substring(0, 10);*/
        const _time = date.toTimeString().substring(0, 8);
        return _time;
    }


    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }
}
