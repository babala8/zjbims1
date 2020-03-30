import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {BulletinService} from '../bulletin.service';
import {NzMessageService, NzModalSubject,  NzNotificationService} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '../../../../core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';

@Component({
    templateUrl: './bulletin-add.html'
})
export class BulletinAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    regions = REGIONS;
    cities = [];
    i = 0;
    showFlag = 0;

    constructor(private fb: FormBuilder,
                private bulletinService: BulletinService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private notificationService: NzNotificationService,
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
            publisher: this.validateForm.controls.publisher.value,
            title: this.validateForm.controls.title.value,
            releaseDate: this.date2String(this.validateForm.controls.releaseDate.value, 'yyyy-MM-dd'),
            expireDate:  this.date2String(this.validateForm.controls.expireDate.value, 'yyyy-MM-dd'),
            content: this.validateForm.controls.content.value
        };

        console.log(params);
        this.loading = true;
        this.bulletinService.addBulletin(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/bulletin']);
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
            publisher: [null, [Validators.required, Validators.maxLength(20), Validators.minLength( 2)]],
            title: [null, [Validators.required, Validators.maxLength( 300)]],
            releaseDate: [null, [Validators.required, Validators.maxLength(10)]],
            expireDate: [null, [Validators.required, Validators.maxLength(10)]],
            content: [null, [Validators.required, Validators.maxLength(900)]]
        });
    }

    /**
     * 根据字段名获取表单字段值
     * @param publisher
     */
    getFormControl(publisher) {
        return this.validateForm.controls[publisher];
    }

    /**
     * 日期转字符串
     * @param date
     */
    date2String(date: Date, fmt: string): string {
        if (!date) {
            return '';
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


    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['publisher'].updateValueAndValidity();
        });
    }

    /**
     * 限制开始时间
     * @param startValue
     * @private
     */
    _disabledStartDate = (startValue) => {
        const endValue = this.validateForm.controls.expireDate.value;
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
        const startValue = this.validateForm.controls.releaseDate.value;
        if (!endValue || !startValue) {
            return false;
        }
        return endValue.getTime() <= startValue.getTime();
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

}

