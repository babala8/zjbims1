import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {HttpResponse} from '@angular/common/http';
import {AdvertisementSpaceService} from '../advertisementSpace.service';
import {SessionService} from '@core/session.service';

@Component({
    selector: 'advertisementSpace-add',
    templateUrl: './advertisementSpace-add.html',
})
export class AdvertisementAddSpaceComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    url: string;
    typeList = [];
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
            name: this.validateForm.controls.name.value,
            type: this.validateForm.controls.type.value,
            playOrder: this.validateForm.controls.playOrder.value,
            adstypeurl: this.url,
            adduser: this.session.getUserSession().account,
        };

        console.log(params);
        this.loading = true;
        this.advertisementSpaceService.addAdvertisementSpace(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`创建广告位成功！`);
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
            playOrder: [null]
        });
        this.typeList = this.advertisementSpaceService.getAdTypeList();
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
