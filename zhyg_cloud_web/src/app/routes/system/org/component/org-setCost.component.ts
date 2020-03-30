import {Component, OnInit} from '@angular/core';
import {OrgService} from '../org.service';
import {FormBuilder, FormGroup} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {animate, state, style, transition, trigger} from '@angular/animations';

@Component({
    templateUrl: './org-setCost.html',
    styleUrls: ['./org-setCost.scss'],
    animations: [
        trigger('highlight', [
            state('show', style({
                backgroundColor: '#E5E5E5',
                color: 'black',
            })),
            state('hide', style({
                backgroundColor: 'white',
            })),
            transition('show => hide', animate('100ms ease-out')),
            transition('hide => show', animate('80ms ease-in')),
        ])
    ]
})
export class OrgSetCostComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    switch = false;
    org;
    staticCost: {
        place: string,
        decoration: string,
        device: string,
        other: string,
        placeStage: string,
        decorationStage: string,
        deviceStage: string,
        otherStage: string
    } = null;
    manageCost: {
        year: string,
        month: string,
        wage: string,
        rent: string,
        resourceFee: string,
        promotion: string,
        material: string,
        other: string,
        staffCount: string
    }[] = [];


    constructor(private fb: FormBuilder,
                private orgService: OrgService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService) {
    }


    ngOnInit(): void {
        // 初始化表单
        this.validateForm = this.fb.group({
            place: [null],
            placeStage: [null],
            decoration: [null],
            decorationStage: [null],
            device: [null],
            deviceStage: [null],
            other1: [null],
            otherStage: [null],
            year: [null],
            month: [null],
            wage: [null],
            rent: [null],
            resourceFee: [null],
            promotion: [null],
            material: [null],
            other2: [null],
            staffCount: [null]
        });
        // 获取成本信息
        this.loading = true;
        this.orgService.getOrgCost({orgNo: this.org.no})
            .subscribe(data => {
                    this.loading = false;
                    if (data) {
                        console.log(data);
                        this.staticCost = data.data.staticCost;
                        this.manageCost = data.data.manageCost;
                        this.initStaticCost();
                        this.initManageCost();
                    }
                },
                error => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                });
    }

    /**
     * 初始化固定成本
     */
    initStaticCost() {
        const data = this.staticCost;
        if (data) {
            this.validateForm.controls.place.setValue(data.place || '');
            this.validateForm.controls.decoration.setValue(data.decoration || '');
            this.validateForm.controls.device.setValue(data.device || '');
            this.validateForm.controls.other1.setValue(data.other);
            this.validateForm.controls.placeStage.setValue(data.placeStage || '');
            this.validateForm.controls.decorationStage.setValue(data.decorationStage || '');
            this.validateForm.controls.deviceStage.setValue(data.deviceStage || '');
            this.validateForm.controls.otherStage.setValue(data.otherStage || '');
        } else {
            this.validateForm.controls.place.setValue('');
            this.validateForm.controls.decoration.setValue('');
            this.validateForm.controls.device.setValue('');
            this.validateForm.controls.other1.setValue('');
            this.validateForm.controls.placeStage.setValue('');
            this.validateForm.controls.decorationStage.setValue('');
            this.validateForm.controls.deviceStage.setValue('');
            this.validateForm.controls.otherStage.setValue('');
        }
    }

    /**
     * 初始化经营成本
     */
    initManageCost() {
        const tmp = new Date().toLocaleString();
        const year = tmp.substring(0, 4);
        let month = tmp.substring(5, tmp.indexOf('/', tmp.indexOf('/') + 1));
        month = parseInt(month, 0) < 10 ? '0' + month : month;
        this.validateForm.controls.year.setValue(year);
        this.validateForm.controls.month.setValue(month);
        this.searchManageCost(year, month);
    }

    /**
     * 根据年份和月份查询经营成本
     * @param year1
     * @param month1
     */
    searchManageCost(year1, month1) {
        let year;
        let month;
        if (year1 == '') {
            month = month1;
            year = this.validateForm.controls.year.value;
        } else if (month1 == '') {
            year = year1;
            month = this.validateForm.controls.month.value;
        } else {
            year = year1;
            month = month1;
        }
        let flag = false;
        for (const i of this.manageCost) {
            if (year == i.year && month == i.month) {
                this.validateForm.controls.wage.setValue(i.wage);
                this.validateForm.controls.rent.setValue(i.rent);
                this.validateForm.controls.resourceFee.setValue(i.resourceFee);
                this.validateForm.controls.promotion.setValue(i.promotion);
                this.validateForm.controls.material.setValue(i.material);
                this.validateForm.controls.other2.setValue(i.other);
                this.validateForm.controls.staffCount.setValue(i.staffCount);
                flag = true;
                break;
            }
        }
        if (!flag) {
            this.validateForm.controls.wage.setValue('');
            this.validateForm.controls.rent.setValue('');
            this.validateForm.controls.resourceFee.setValue('');
            this.validateForm.controls.promotion.setValue('');
            this.validateForm.controls.material.setValue('');
            this.validateForm.controls.other2.setValue('');
            this.validateForm.controls.staffCount.setValue('');
        }
    }

    _submitForm() {
        let param;
        if (!this.switch) {
            param = {
                type: 'static',
                orgNo: this.org.no,
                place: this.validateForm.controls.place.value,
                placeStage: this.validateForm.controls.placeStage.value,
                decoration: this.validateForm.controls.decoration.value,
                decorationStage: this.validateForm.controls.decorationStage.value,
                device: this.validateForm.controls.device.value,
                deviceStage: this.validateForm.controls.deviceStage.value,
                other: this.validateForm.controls.other1.value,
                otherStage: this.validateForm.controls.otherStage.value,
            };
        } else {
            param = {
                type: 'manage',
                orgNo: this.org.no,
                wage: this.validateForm.controls.wage.value,
                rent: this.validateForm.controls.rent.value,
                resourceFee: this.validateForm.controls.resourceFee.value,
                promotion: this.validateForm.controls.promotion.value,
                other: this.validateForm.controls.other2.value,
                material: this.validateForm.controls.material.value,
                year: this.validateForm.controls.year.value,
                month: this.validateForm.controls.month.value,
                staffCount: this.validateForm.controls.staffCount.value
            };
        }
        this.loading = true;
        this.orgService.setOrgCost(param)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改机构成本成功！');
                this.nzModal.destroy('onOk');
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

}
