import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {CardInfoService} from './cardInfo.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {CardInfoAddComponent} from './component/cardInfo-add.component';
import {CardInfoModifyComponent} from './component/cardInfo-modify.component';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SysMenuService} from '../menu/menu.service';

@Component({
    templateUrl: './cardInfo.html',
})
export class CardInfoComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    page = new Page();
    cardName;

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private cardInfoService: CardInfoService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            cardBin: [null]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            cardBin: this.validateForm.controls.cardBin.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        this.loading = true;
        // 获取当前页
        this.cardInfoService.getCardInfo(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.dataSet.forEach( item => {
                        item.idFlag = this.cardInfoService.convertFlag(item.idFlag);
                        item.cardNoFlag = this.cardInfoService.convertFlag(item.cardNoFlag);
                        item.panFlag = this.cardInfoService.convertFlag(item.panFlag);
                        item.cardTypeName = this.cardInfoService.convertType(item.cardType);
                        item.localFlagName = this.cardInfoService.convertLocFlag(item.localFlag);
                    });
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.dataSet = [];
                    this.page.totalRow = 0;
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addCardInfo() {
        const modal = this.modal.open({
            title: '添加卡表',
            maskClosable: false,
            footer: false,
            width:'60%',
            content: CardInfoAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyCardInfo(cardInfo) {
        const modal = this.modal.open({
            title: '修改卡表',
            maskClosable: false,
            width:'60%',
            footer: false,
            content: CardInfoModifyComponent,
            componentParams: {
                cardInfo: cardInfo
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(serNo) {
        this.cardInfoService.delCardInfo({
            serno: serNo
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除卡表成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 将20190723152151格式的字符串转为标准时间字符串
     * @param str
     */
   string2DateString(str) {
        /*const year = str.substring(0, 4);
        const month = str.substring(4, 6);
        const day = str.substring(6, 8);
        const hour = str.substring(8, 10);
        const minute = str.substring(10, 12);
        const seconds = str.substring(12, 14);
        return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + seconds;
*/
        const reg = /^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/;
        const d = str.replace(reg, '$1-$2-$3 $4:$5:$6');
        return d;
   }
    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.refreshData(true);
    }

    cancel() {

    }

}
