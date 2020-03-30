import {Component, ElementRef, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {NzMessageService, NzModalSubject, NzNotificationService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {PjsLogMonitorService} from '../pjsLogMonitor.service';
import {format, addDays, subDays, isToday } from 'date-fns';
import {log} from 'util';
import {element} from 'protractor';
import {worker} from 'cluster';

@Component({
    templateUrl: './pjsLogDetail.html',
})
export class PjsLogDetailComponent implements OnInit {

    validateForm: FormGroup;
    loading = false;
    params;
    contexts = '' ;
    today = true ;
    targetPosition = []; // 记录查找到的关键字位置集合
    index = 0; // 位置集合中的下标
    parentElm: HTMLElement;
    keyStr = ''; // 关键字
    isInput = false; // 是否已输入
    searchDiv = false;
    constructor(
        private el: ElementRef,
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private session: SessionService,
        private message: NzMessageService,
        private pjsLogMonitorService: PjsLogMonitorService,
    ) {}

    ngOnInit(): void {
        this.parentElm = document.getElementById('textarea');
        this.refreshData(false);
    }

    refreshData(flag: boolean) {
        this.contexts = '' ;
        this.pjsLogMonitorService.getLogData(this.params).subscribe(
            data => {
                const logList = data.data;
                if (logList != null) {
                    for (const i in logList) {
                        this.contexts += logList[i] ;
                    }
                    this.parentElm.innerText = this.contexts;
                    if (flag && this.searchDiv) {
                        this.search();
                    }
                }
            }, error => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                    if (flag) {
                        this.parentElm.innerText = '';
                        // todo 没有日志时需要关闭检索框请将下面注释打开
                        // this.searchDiv = false;
                    }
                }
            }
        );
        const current = new Date(this.params.logDate);
        this.today = isToday(current);
    }

    // 前一天日志
    preDay() {
        this.contexts = '' ;
        const current = new Date(this.params.logDate);
        this.params.logDate = format( subDays(current, 1), 'YYYY-MM-DD');
        this.refreshData(true);
    }
    // 后一天日志
    postDay() {
        this.contexts = '' ;
        const current = new Date(this.params.logDate);
        this.params.logDate = format( addDays(current, 1), 'YYYY-MM-DD');
        this.refreshData(true);
    }
    // 开始检索
    search() {
        const str = this.keyStr.trim();
        if (str.length == 0) {
            this.message.error('您还没有输入关键字');
        }else {
            let html = this.parentElm.innerHTML;
            if (!html.match(str)) {
                this.message.error('没有找到关键字,请重新输入');
                return ;
            }
            // 先去掉之前可能存在的样式
            html = html.replace(/<\/?span[^>]*>/gi, '');
            const reg = new RegExp(str, 'g');
            const newHtml = html.replace(reg, '<span id="test1" style= "background-color: red"> ' + str + '</span>');
            this.parentElm.innerHTML = newHtml;
            const childArr = this.parentElm.getElementsByTagName('span');
            this.parentElm.scrollTop = 0;
            this.targetPosition = [];
            for (let i = 0; i < childArr.length; i++) {
                this.targetPosition.push({
                    index: i,
                    top: childArr[i].offsetTop - this.parentElm.offsetTop + this.parentElm.scrollTop
                });
            }
            this.isInput = true;
            this.start(0);
        }
    }
    // 打开检索框
    showSearch() {
        this.searchDiv = true;
    }
    // 关闭检索框
    closeSearch() {
        const html = this.parentElm.innerHTML.replace(/<\/?span[^>]*>/gi, '');
        this.parentElm.innerHTML = html;
        this.searchDiv = false;
        this.keyStr = '';
        this.isInput = false;
    }
    start(flag = 0 ) {
        if (!this.isInput) {
            this.message.error('您还没有输入关键字');
            return ;
        }
        const length = this.targetPosition.length;
        if (this.targetPosition.length == 0)  {
            return ;
        }
        if (flag + this.index >= length || flag == 0) {
            this.index = 0;
        }else if (flag + this.index < 0) {
            this.index = length - 1;
        }else {
            this.index = this.index + flag;
        }
        this.parentElm.scrollTop = this.targetPosition[this.index].top;
    }

    exportPdf() {
        this.params.userNo = this.session.getUserSession().account;
        this.params.token = this.session.token;
        this.pjsLogMonitorService.exportPdf(this.params);
    }
}
