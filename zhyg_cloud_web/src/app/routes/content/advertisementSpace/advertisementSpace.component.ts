import {Component, OnInit} from '@angular/core';
import {AdvertisementSpaceService} from './advertisementSpace.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {AdvertisementAddSpaceComponent} from './component/advertisementSpace-add.component';
import {AdvertisementModifySpaceComponent} from './component/advertisementSpace-modify.component';
import {FormGroup} from '@angular/forms';
import {Page} from '../../../models/page';

@Component({
    selector: 'advertisementSpace',
    templateUrl: './advertisementSpace.html',
})
export class AdvertisementSpaceComponent implements OnInit {
    formModel = {};
    dataSet = [];
    validateForm: FormGroup;
    loading = false;
    page = new Page();
    adsTypeArr: {no: string, name: string, url: string}[];
    adSpaceStatusInfo;

    constructor(
        private advertisementSpaceService: AdvertisementSpaceService,
        private message: NzMessageService,
        private modal: NzModalService,
    ) {
    }

    refreshData(reset = false) {
        this.dataSet = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            adsType: this.formModel['adsType'] || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(this.formModel['adsType']);
        this.advertisementSpaceService.getAdvertisementSpace(params)
            .subscribe(_data => {
                console.log(_data);
                if (_data.data) {
                    this.dataSet = _data.data;
                    this.dataSet.forEach(data1 => {
                        data1.status = this.advertisementSpaceService.getAdSpaceStatusName(data1.status);
                        data1.type = this.advertisementSpaceService.getAdTypeByNo(data1.type).name;
                    });
                }
                if (_data.page) {
                    this.page.totalRow = _data.page.totalRow;
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    search() {
        this.refreshData(true);
    }

    ngOnInit(): void {
        this.adsTypeArr = this.advertisementSpaceService.getAdTypeList();
        this.adSpaceStatusInfo = this.advertisementSpaceService.getAdSpaceStatusList();
        this.refreshData(true);
    }

    addAdvertisement() {
        this.modal.open({
            title: '创建广告位',
            maskClosable: false,
            footer: false,
            content: AdvertisementAddSpaceComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyAdvertisement(ads) {
        this.modal.open({
            title: '修改广告位',
            maskClosable: false,
            footer: false,
            content: AdvertisementModifySpaceComponent,
            componentParams: {
                ads: ads
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    delAdSpace(space) {
        this.advertisementSpaceService.deleteAdvertisementSpace(space.id).subscribe(
            r => {
                this.message.success(
                    `广告位[${space.name}]删除成功！`
                );
                this.refreshData(true);
            }, (error) => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    disableAdvertisement(ad) {
        this.advertisementSpaceService.disableAdvertisementSpace(ad.id).subscribe(r => {
            this.message.success(
                `广告位[${ad.name}]停用成功！`
            );
            this.refreshData(true);
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    cancel() {

    }

}
