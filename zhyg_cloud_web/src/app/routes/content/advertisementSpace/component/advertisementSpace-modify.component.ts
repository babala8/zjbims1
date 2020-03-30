import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {HttpResponse} from '@angular/common/http';
import {AdvertisementSpaceService} from '../advertisementSpace.service';
import {SessionService} from '@core/session.service';

@Component({
    selector: 'advertisementSpace-modify',
    templateUrl: './advertisementSpace-modify.html',
})
export class AdvertisementModifySpaceComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    ads;
    typeList = [];
    statusList = [];
    url: string;
    orderArr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private advertisementSpaceService: AdvertisementSpaceService,
        private nzModal: NzModalSubject,
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
            id: this.ads.id,
            name: this.validateForm.controls.name.value,
            type: this.validateForm.controls.type.value,
            playOrder: this.validateForm.controls.playOrder.value,
            adstypeurl: this.url,
            user: this.session.getUserSession().account,
            status: this.validateForm.controls.status.value
        };
        console.log(params);
        this.loading = true;
        this.advertisementSpaceService.modAdvertisementSpace(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`修改广告位成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/content/advertisementSpace']);
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
            name: [null],
            type: [null],
            playOrder: [null],
            status: [null]
        });
        const adsSpaceId = this.ads.id;
        // 获取广告详细信息
        this.loading = true;
        this.typeList = this.advertisementSpaceService.getAdTypeList();
        this.statusList = this.advertisementSpaceService.getAdSpaceStatusList();
        this.advertisementSpaceService.getAdvertisementSpaceById(adsSpaceId).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.validateForm.controls.name.setValue(data.data.name);
                this.validateForm.controls.type.setValue(data.data.type);
                this.validateForm.controls.playOrder.setValue(data.data.playOrder);
                this.validateForm.controls.status.setValue(data.data.status);
                this.url = this.advertisementSpaceService.getAdTypeByNo(data.data.type).url;
            },
            error => {
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

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    changeUrl(event) {
        this.validateForm.controls.playOrder.setValue(null);
        this.url = this.advertisementSpaceService.getAdTypeByNo(event).url;
        this.orderArr = this.advertisementSpaceService.getAdTypeByNo(event).orderArr;
    }
}
