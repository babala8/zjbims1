import {Component, OnInit} from '@angular/core';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ControlResultService} from './controlResult.service';
import {Page} from '../../../models/page';
import {NzMessageService} from 'ng-zorro-antd';
import {DevService} from '../../system/dev/dev.service';
import * as moment from 'moment';
import {SessionService} from '@core/session.service';

@Component({
    templateUrl: './controlResult.html',
})
export class ControlResultComponent implements OnInit {

    validateForm: FormGroup;
    loading = true;
    dataSet = [];
    commandList = [];
    devList = [];
    startDate = null;
    endDate = null;
    page = new Page();
    now = moment().startOf('day');

    constructor(
        private controlResultService: ControlResultService,
        private sessionService: SessionService,
        private fb: FormBuilder,
        private devService: DevService,
        private message: NzMessageService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            commandId: [null, Validators.maxLength(10)],
            org: [{no: this.sessionService.getUserSession().orgNo, name: this.sessionService.getUserSession().orgName}],
            devNo: [null, [ Validators.pattern('^[0-9a-zA-Z]{4,8}')]],
            devType: [null, Validators.maxLength(5)],
            startDate: [moment().startOf('day').add(-1, 'month').toDate(), Validators.maxLength(20)],
            endDate: [this.now.toDate(), Validators.maxLength(20)],
        });
        this.commandList = this.controlResultService.getCommand();
        this.refreshData();
    }

    /**
     * 限制开始时间
     * @param startValue
     * @private
     */
    _disabledStartDate = (startValue) => {
        startValue = moment(startValue).startOf('day');
        const endValue = moment(this.validateForm.controls.endDate.value).startOf('day');
        return   startValue > endValue || startValue > moment().startOf('day') || startValue < endValue.add(-1, 'year');
    }
    /**
     * 限制结束时间
     * @param endValue
     * @private
     */
    _disabledEndDate = (endValue) => {
        endValue = moment(endValue).startOf('day');
        const startValue = moment(this.validateForm.controls.startDate.value).startOf('day');
        return endValue < startValue || endValue > moment().startOf('day') || endValue > startValue.add(1, 'year');
    }

    refreshData() {
        if (this.validateForm.invalid) {
            return;
        }
        this.loading = true;
        const params = {
            commandId: this.validateForm.controls.commandId.value || '',
            orgNo: this.validateForm.controls.org.value.no,
            devNo: this.validateForm.controls.devNo.value || '',
            startDate: this.date2String(this.validateForm.controls.startDate.value, 'start'),
            endDate: this.date2String(this.validateForm.controls.endDate.value, 'end'),
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        // 获取当前页
        this.controlResultService.getAllRemoteControl(params)
            .subscribe(_data => {
                this.dataSet = _data.data;
                this.dataSet.forEach(x => x.commandName = this.controlResultService.convert(x.commandId));
                console.log(this.dataSet);
                this.page.totalRow = _data.page.totalRow;
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date: Date, type: string): string {
        const forMatDate =  moment(date).format('YYYY-MM-DD');
        if (!date) {
            return '';
        } else {
            if (type == 'start') {
                return forMatDate + ' 00:00:00';
            } else {
                return forMatDate + ' 23:59:59';
            }
        }
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({no: this.sessionService.getUserSession().orgNo, name: this.sessionService.getUserSession().orgName});
        this.validateForm.controls.commandId.setValue('');
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.startDate.setValue(moment().startOf('day').add(-1, 'month').toDate());
        this.validateForm.controls.endDate.setValue(this.now.toDate());
        this.devList = [];
        this.refreshData();
    }

    /**
     * 根据字段名获取表单字段值
     * @param name
     */
    getFormControl(name) {
        return this.validateForm.controls[name];
    }

}
