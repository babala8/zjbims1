import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {Page} from '../../../models/page';
import {NotifyModelService} from './notifyModel.service';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService} from 'ng-zorro-antd';

@Component({
    templateUrl: './notifyModel.html',
})

export class NotifyModelComponent implements OnInit {
    formModel = {};
    validateForm: FormGroup;
    loading = true;
    notifyTypeList = [
        [{value: '${devNo}', name: '设备号', disabled: true, checked: true}, {value: '${orgNo}', name: '所属机构', checked: false},
            {value: '${catalogNo}', name: '故障类型', checked: false}, {value: '${devModule}', name: '故障模块', checked: false}],
        [{value: '${devVendor}', name: '设备品牌', checked: false}, {value: '${devType}', name: '设备型号', checked: false},
            {value: '${address}', name: '设备地址', checked: false}, {value: '${caseNo}', name: 'case编号', checked: false}],
        [{value: '${faultCode}', name: '故障代码', checked: false}, {value: '${vendorCode}', name: '厂商故障码', checked: false},
            {value: '${description}', name: 'case描述', checked: false}, {value: '${status}', name: 'case当前状态', checked: false}],
        [{value: '${openTime}', name: '生成时间', checked: false}, {value: '${preOnsiteTime}', name: '预期到场时间', checked: false},
            {value: '${preCloseTime}', name: '预期关闭时间', checked: false}, {value: '${useCloseTime}分钟', name: '故障持续时间', checked: false}],
    ];
    notifyType = [
        {value: 1, label: 'CASE生成通知'},
        {value: 2, label: 'CASE升级通知'},
        {value: 3, label: 'CASE关闭通知'}
    ];
    selectedType = 1;
    infoSetList = [];
    modelBy = 1;

    constructor(
        private modCatalogService: NotifyModelService,
        private fb: FormBuilder,
        private service: NotifyModelService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            notifyType: [null]
        });
        this.check1();
    }

    submit() {
        let content = '';
        switch (this.selectedType) {
            case 1:
                content = content.concat('ATM/VTM故障通知：CASE');
                break;
            case 2:
                content = content.concat('ATM/VTM故障通知：CASE升级');
                break;
            case 3:
                content = content.concat('ATM/VTM故障通知：CASE关闭');
                break;
        }
        this.notifyTypeList.forEach(x => {
            x.forEach(y => {
                if (y.checked) {
                    content = content.concat('，' + y.name + ':' + y.value);
                }
            });
        });
        content = content.concat('。');
        const params = {
            notifyType: this.selectedType,
            notifyWay: 1,
            modelBy: this.modelBy,
            infoSet: content
        };
        this.service.addNotifyModel(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`信息通知内容设定成功！`);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
        return;
    }

    chooseNotify(event) {
        this.selectedType = event;
        console.log(this.selectedType);
        this.service.getInfoSetByType({notifyType: this.selectedType})
            .subscribe(data => {
                if (data.data != null) {
                    this.infoSetList = data.data;
                    this.loadData(this.infoSetList);
                } else {
                    switch (event) {
                        case 1:
                            this.check1();
                            break;
                        case 2:
                            this.check2();
                            break;
                        case 3:
                            this.check3();
                            break;
                    }
                }
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    loadData(infoSetList) {
        for (let i = 0; i < this.notifyTypeList.length; i++) {
            const date = this.notifyTypeList[i];
            for (let j = 0; j < date.length; j++) {
                const date1 = this.notifyTypeList[i][j];
                let flag = false;
                for (let k = 0; k < infoSetList.length; k++) {
                    if (infoSetList[k] == date1.name) {
                        flag = true;
                    }
                }
                if (flag) {
                    this.notifyTypeList[i][j].checked = true;
                } else {
                    this.notifyTypeList[i][j].checked = false;
                }
            }
        }
    }

    check1() {
        for (let i = 0; i < this.notifyTypeList.length; i++) {
            const date = this.notifyTypeList[i];
            for (let j = 0; j < date.length; j++) {
                const date1 = this.notifyTypeList[i][j];
                if (date1.name == '设备号' || date1.name == '设备模块' || date1.name == '设备地址' ||
                    date1.name == 'case描述' || date1.name == '所属机构' || date1.name == 'case编号') {
                    this.notifyTypeList[i][j].checked = true;
                } else {
                    this.notifyTypeList[i][j].checked = false;
                }
            }
        }
    }

    check2() {
        for (let i = 0; i < this.notifyTypeList.length; i++) {
            const date = this.notifyTypeList[i];
            for (let j = 0; j < date.length; j++) {
                const date1 = this.notifyTypeList[i][j];
                if (date1.name == '设备号' || date1.name == '设备模块' || date1.name == 'case描述' || date1.name == '所属机构'
                    || date1.name == 'case编号' || date1.name == '设备地址' || date1.name == 'case当前状态') {
                    this.notifyTypeList[i][j].checked = true;
                } else {
                    this.notifyTypeList[i][j].checked = false;
                }
            }
        }
    }

    check3() {
        for (let i = 0; i < this.notifyTypeList.length; i++) {
            const date = this.notifyTypeList[i];
            for (let j = 0; j < date.length; j++) {
                const date1 = this.notifyTypeList[i][j];
                if (date1.name == '设备号' || date1.name == '设备模块' || date1.name == '所属机构' || date1.name == 'case编号') {
                    this.notifyTypeList[i][j].checked = true;
                } else {
                    this.notifyTypeList[i][j].checked = false;
                }
            }
        }
    }

    changeModelBy() {

    }

    selectAll() {
        this.notifyTypeList.forEach(x => {
            x.forEach(y => {
                y.checked = true;
            });
        });
    }

    selectNull() {
        this.notifyTypeList.forEach(x => {
            x.forEach(y => {
                y.checked = false;
            });
        });
        this.notifyTypeList[0][0].checked = true;
    }

    reverse() {
        this.modelBy = 1;
        this.notifyTypeList.forEach(x => {
            x.forEach(y => {
                y.checked = y.checked == true ? false : true;
            });
        });
        this.notifyTypeList[0][0].checked = true;
    }

    changeDefault() {
        this.modelBy = 0;
        switch (this.selectedType) {
            case 1:
                this.check1();
                break;
            case 2:
                this.check2();
                break;
            case 3:
                this.check3();
                break;
        }
    }
}
