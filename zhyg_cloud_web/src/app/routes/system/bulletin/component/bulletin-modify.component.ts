import {Component, OnInit} from '@angular/core';
import {BulletinService} from '../bulletin.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './bulletin-modify.html'
})
export class BulletinModifyComponent implements OnInit {


    validateForm: FormGroup;
    bulletins;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;
    before;

    constructor(private fb: FormBuilder,
                private bulletinService: BulletinService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            bulletinId: [null, [Validators.required, Validators.maxLength(20)]],
            publisher: [null, [Validators.required, Validators.maxLength(20), Validators.minLength( 3)]],
            title: [null, [Validators.required, Validators.maxLength( 300)]],
            releaseDate: [null, [Validators.required, Validators.maxLength(10)]],
            expireDate: [null, [Validators.required, Validators.maxLength(10)]],
            content: [null, [Validators.required, Validators.maxLength(900)]]
        });


        this.loading = true;
        this.bulletinService.getBulletin(this.bulletins.bulletinId).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.bulletins = data.data;
                this.before = data.data;
                this.validateForm.controls.bulletinId.setValue(this.bulletins.bulletinId);
                this.validateForm.controls.publisher.setValue(this.bulletins.publisher);
                this.validateForm.controls.title.setValue(this.bulletins.title);
                this.validateForm.controls.content.setValue(this.bulletins.content);
                this.validateForm.controls.releaseDate.setValue(this.string2Date(this.bulletins.releaseDate));
                this.validateForm.controls.expireDate.setValue(this.string2Date(this.bulletins.expireDate));
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
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
            bulletinId: this.validateForm.controls.bulletinId.value,
            publisher: this.validateForm.controls.publisher.value,
            title: this.validateForm.controls.title.value,
            content: this.validateForm.controls.content.value,
            releaseDate: this.date2String(this.validateForm.controls.releaseDate.value),
            expireDate: this.date2String(this.validateForm.controls.expireDate.value)
        };
        this.loading = true;
        this.bulletinService.modBulletin(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改公告成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/bulletin']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
    /**
     * 日期转字符串
     * @param date
     */
    date2String(date: Date): string {
        if (!date) {
            return '';
        } else {
            return date.toISOString().substring(0, 10);
        }
    }

    /**
     * 字符串转日期
     * @param str
     */
    string2Date(str: string): Date {
        return new Date(str.replace(/-/g, '/'));
    }


    getFormControl(publisher) {
        return this.validateForm.controls[publisher];
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
