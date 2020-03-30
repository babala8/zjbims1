import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {CITIES, REGIONS} from '@core/constant';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {DynamicIndService} from '../dynamicInd.service';

@Component({
    templateUrl: './dynamicInd-add.html'
})
export class DynamicIndAddComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    itemTypes = [];
    showDateSelect = false;
    showTimeSelect = false;
    /**
     * 日期范围的指标类型
     */
    dateItem = '13';
    /**
     * 时间范围的指标类型
     */
    timeItem = '14';

    constructor(private fb: FormBuilder,
                private dynamicIndService: DynamicIndService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private router: Router) {
    }

    selectType(event) {
        if (event === this.dateItem) {
            this.showDateSelect = true;
            const dateRange: string = this.validateForm.controls.content.value;
            if (dateRange && dateRange.length > 0) {
                const index = dateRange.indexOf('~');
                this.validateForm.controls.startDate.setValue(dateRange.substring(0, index));
                this.validateForm.controls.endDate.setValue(dateRange.substring(index + 1));
            }
            this.showTimeSelect = false;
        } else if (event === this.timeItem) {
            this.showTimeSelect = true;
            const timeRange: string = this.validateForm.controls.content.value;
            if (timeRange && timeRange.length > 0) {
                // 把时间字符串转换为完整日期对象后才能赋值给表单
                const index = timeRange.indexOf('~');
                const startTime = timeRange.substring(0, index);
                this.validateForm.controls.startTime.setValue(new Date(new Date().setHours(parseInt(startTime.substring(0, 2), 0),
                    parseInt(startTime.substring(3, 5), 0), parseInt(startTime.substring(6, 8), 0))));
                const endTime = timeRange.substring(index + 1);
                this.validateForm.controls.endTime.setValue(new Date(new Date().setHours(parseInt(endTime.substring(0, 2), 0),
                    parseInt(endTime.substring(3, 5), 0), parseInt(endTime.substring(6, 8), 0))));
            }
            this.showDateSelect = false;
        } else {
            this.showDateSelect = false;
            this.showTimeSelect = false;
        }
    }

    _submitForm() {
        // 校验日期范围
        if (this.validateForm.controls.itemType.value === this.dateItem) {
            if (this.validateForm.controls.startDate.value && this.validateForm.controls.endDate.value) {
                const tmp1 = this.dynamicIndService.date2String(this.validateForm.controls.startDate.value);
                const tmp2 = this.dynamicIndService.date2String(this.validateForm.controls.endDate.value);
                if (tmp1 < tmp2) {
                    this.validateForm.controls.content.setValue(tmp1 + '~' + tmp2);
                } else {
                    this.message.error('开始日期不能晚于结束日期');
                    return;
                }
            } else {
                this.message.error('日期不能为空');
                return;
            }
        }

        // 校验时间范围
        if (this.validateForm.controls.itemType.value === this.timeItem) {
            if (this.validateForm.controls.startTime.value && this.validateForm.controls.endTime.value) {
                const tmp1 = this.dynamicIndService.time2String(this.validateForm.controls.startTime.value);
                const tmp2 = this.dynamicIndService.time2String(this.validateForm.controls.endTime.value);
                if (tmp1 < tmp2) {
                    this.validateForm.controls.content.setValue(tmp1 + '~' + tmp2);
                } else {
                    this.message.error('开始时间不能晚于结束时间');
                    return;
                }
            } else {
                this.message.error('时间不能为空');
                return;
            }
        }
        const params = {
            orgNo: this.validateForm.controls.orgNo.value,
            itemNo: this.validateForm.controls.itemType.value,
            value: parseInt(this.validateForm.controls.transValue.value, 0),
            content: this.validateForm.controls.content.value
        };

        console.log(params);
        this.loading = true;
        this.dynamicIndService.addIndicator(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`添加动态指标成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/transWorth/dynamicInd']);
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
        this.dynamicIndService.qryItemType().subscribe(
            data => {
                this.itemTypes = data.data;
            }
        );
        this.validateForm = this.fb.group({
            orgNo: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(20)]],
            startDate: [null],
            endDate: [null],
            content: [null],
            itemType: [null],
            transValue: [null],
            startTime: [null],
            endTime: [null]
        });
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

