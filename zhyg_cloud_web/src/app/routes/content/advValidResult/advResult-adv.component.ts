import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {AdvertisementSpaceService} from '../advertisementSpace/advertisementSpace.service';
import {AdvResultAdvDevComponent} from './advResult-adv-dev.component';
import {environment} from '@env/environment';
import {SessionService} from '@core/session.service';
import {AdvValidService} from '../advInvalid/advValid.service';

@Component({
    selector: 'advIssueResult',
    templateUrl: './advResult-adv.html',
})
export class AdvResultAdvComponent implements OnInit {
    validateForm: FormGroup;
    dataSet = [];
    loading = false;
    page = new Page();
    flag = true;
    adsTypeArr = [];
    previewVisible = false;
    selectedRes;

    constructor(
        private fb: FormBuilder,
        private modal: NzModalService,
        private spaceService: AdvertisementSpaceService,
        private validService: AdvValidService,
        private message: NzMessageService,
        private session: SessionService,
    ) {
    }

    refreshData(reset = false) {
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        this.validService.qryAdv({
            name: this.validateForm.controls.adsName.value || '',
            adsType: this.validateForm.controls.adsType.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
            timeStamp: new Date().getTime()
        }).subscribe(
            _data => {
                this.loading = false;
                if (_data.data) {
                    this.dataSet = _data.data;
                    this.dataSet.forEach(item => {
                        console.log(item.resourceId);
                        item.url = `${environment.SERVER_URL}` + '/content/resource/download?sourceId=' + item.resourceId
                            + '&userNo=' + this.session.getUserSession().account + '&token=' + this.session.token;
                    });
                    this.page.totalRow = _data.page.totalRow;
                }
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            adsName: [null],
            adsType: [null]
        });
        this.adsTypeArr = this.spaceService.getAdTypeList();
        this.refreshData(true);
    }

    /**
     * 展示详情
     * @param item
     */
    showDetail(item) {
        this.modal.open({
            title: '广告投放详情',
            footer: false,
            width: '80%',
            zIndex: 100,
            content: AdvResultAdvDevComponent,
            componentParams: {
                adsItem: item,
            },
            onOk: () => {
            },
            onCancel: () => {
            }
        });
    }

    previewRes(resource) {
        this.selectedRes = resource;
        this.previewVisible = true;
    }

    cancel() {

    }
}

