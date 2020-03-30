import {Component, OnInit, OnChanges} from '@angular/core';
import {DevWorkTimeService} from './devWorkTime.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Page} from '../../../models/page';
import {DevWorkTimeModifyComponent} from './component/devWorkTime-modify.component';

@Component({
    templateUrl: './devWorkTime.html',
})
export class DevWorkTimeComponent implements OnInit, OnChanges {

    validateForm: FormGroup;
    dataSet = [];
    loading = true;
    page = new Page();
    devTypeList = [];
    devVendorList = [];

    constructor(
        private fb: FormBuilder,
        private devWorkTimeService: DevWorkTimeService,
        private message: NzMessageService,
        private modal: NzModalService,
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            devNo: [null, Validators.maxLength(20)],
            org: [
                {no: '', name: ''}],
            devVendor: [null],
            devType: [null],
        });
        /*获取设备品牌信息*/
        this.devWorkTimeService.getDevVendorInfo({}).subscribe(
            data => {
                this.devVendorList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.refreshData(true);
    }
    ngOnChanges() {

    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const params = {
            orgNo: this.validateForm.controls.org.value.no,
            devNo: this.validateForm.controls.devNo.value || '',
            devVendor: this.validateForm.controls.devVendor.value || '',
            devType: this.validateForm.controls.devType.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log('2222222');
        console.log(params);
        // 获取当前页
        this.devWorkTimeService.getDevs(params)
            .subscribe(data => {
                this.loading = false;
                if (data.data) {
                    console.log(data.data);
                    data.data.forEach(data1 => {
                        if (data1.operateStatus == '1') {
                            data1.operateStatus = '启用';
                        }else if (data1.operateStatus == '2') {
                            data1.operateStatus = '停机';
                        }
                        if (data1.registrationStatus == '0') {
                            data1.registrationStatus = '未注册';
                        }else if (data1.registrationStatus == '1') {
                            data1.registrationStatus = '注册';
                        }
                    });
                    this.dataSet = data.data;
                    this.page.totalRow = data.page.totalRow;
                    this.dataSet.forEach(itme => {
                        itme.checked = false;
                    });
                } else {
                    this.dataSet = [];
                    this.page.totalRow = 0;
                }

            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    search() {
        this.refreshData(true);
    }

    modifyWorkTime() {
        const selectedDevs = this.dataSet.filter(x => x.checked);
        if (selectedDevs.length == 0) {
            this.message.error('请选择设备后再操作');
            return;
        }
        const modal = this.modal.open({
            title: '设备工作时间设定',
            content: DevWorkTimeModifyComponent,
            width: '60%',
            maskClosable: false,
            componentParams: {
                devs: selectedDevs
            },
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            },
            footer: false
        });
    }

    /**
     * 选择设备品牌后，查询用户可选的设备类型
     * @param evt
     */
    selectDevType(evt: any) {
        console.log(evt);
        if (evt) {
            const params = {
                devVendor: evt || '',
                devCatalog: '',
            } ;
            console.log(params);
            this.devWorkTimeService.getDevTypeByVendor(params).subscribe(
                data => {
                    this.devTypeList = data.data;
                    console.log(this.devTypeList);
                }, error => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
        }
    }


    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.devNo.setValue('');
        this.validateForm.controls.org.setValue({no: '', name: ''});
        this.validateForm.controls.devVendor.setValue('');
        this.validateForm.controls.devType.setValue('');
        this.devTypeList = [];
        this.refreshData(true);
    }

    cancel() {

    }
}
