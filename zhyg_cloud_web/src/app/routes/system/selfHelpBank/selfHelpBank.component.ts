import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {SelfHelpBankService} from './selfHelpBank.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {SelfHelpBankAddComponent} from './component/selfHelpBank-add.component';
import {SelfHelpBankModifyComponent} from './component/selfHelpBank-modify.component';
import {FormBuilder, FormGroup} from '@angular/forms';
import {SysMenuService} from '../menu/menu.service';
import {OrgService} from '../org/org.service';
import {Org} from '../../../models/org';
import {OrgType} from '../../../models/orgType';



@Component({
    templateUrl: './selfHelpBank.html',

})
export class SelfHelpBankComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    org: Org;
    orgGrade;
    orgTypeList: OrgType[] = [];
    loading = true;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private selfHelpBankService: SelfHelpBankService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private orgService: OrgService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            bankName: [null],
            bankArea: [null],
            fhOrgNo: [null],
            areaNoProvince: [null],
            areaNoCity: [null],
            areaNoCounty: [null],
            upper: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            bankName: this.validateForm.controls.bankName.value || '',
            bankArea: this.validateForm.controls.bankArea.value || '',
            fhOrgNo: this.validateForm.controls.upper.value.no || '',
            areaNoProvince: this.validateForm.controls.areaNoProvince.value || '',
            areaNoCity: this.validateForm.controls.areaNoCity.value || '',
            areaNoCounty: this.validateForm.controls.areaNoCounty.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        this.loading = true;
        // 获取当前页
        this.selfHelpBankService.getSelfHelpBanks(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                this.dataSet = data.data;
                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                }else {
                    this.page.totalRow = 0 ;
                }
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addSelfHelpBank() {
        const modal = this.modal.open({
            title: '添加自助银行',
            maskClosable: false,
            footer: false,
            content: SelfHelpBankAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }
    confirmDel(logicId) {
        this.selfHelpBankService.delSelfHelpBank({
            logicId: logicId
        }).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除自助银行成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }
    modifySelfHelpBank(selfHelpBank) {
        const modal = this.modal.open({
            title: '修改自助银行信息',
            maskClosable: false,
            footer: false,
            content: SelfHelpBankModifyComponent,
            componentParams: {
                selfHelpBank: selfHelpBank
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }
    /**
     * 选择上级机构后，查询用户可选的机构类型列表
     * @param evt
     */
    selectOrg(evt: any) {
        const orgNo = evt.no;
        if (orgNo) {
            this.orgService.getOrg(orgNo)
                .subscribe(_data => {
                        this.org = _data.data;
                        console.log('grade1: ' + this.org.orgType.grade);
                        /*if (this.org.orgType.grade === '5') {
                            this.message.error('所选机构不允许作为上级机构!', {nzDuration: 2000});
                        } else {*/
                        this.orgService.getOrgTypesByGrade(this.org.orgType.grade).subscribe(
                            _data1 => {
                                const data = _data1.data;
                                const data1 = [];
                                this.loading = false;
                                for (this.i = 0; this.i < data.length; (this.i)++) {
                                    if ((Number(data[this.i].grade)) === (Number(this.org.orgType.grade) + 1)) {
                                        data1.push(data[this.i]);
                                    }
                                }
                                console.log(data1);
                                this.orgTypeList = data1;
                            },
                            error => {
                                this.loading = false;
                                this.message.error(error.body.retMsg);
                            }
                        );
                        /*}*/
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
        this.validateForm.controls.bankName.setValue('');
        this.validateForm.controls.bankArea.setValue('');
        this.validateForm.controls.fhOrgNo.setValue('');
        this.validateForm.controls.areaNoProvince.setValue('');
        this.validateForm.controls.areaNoCity.setValue('');
        this.validateForm.controls.areaNoCounty.setValue('');
        this.validateForm.controls.upper.setValue({no: '', name: ''});
        this.refreshData(true);
    }

    cancel() {

    }

    /**
     * 校验按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        return this.menuService.checkBtn(menuName, btnName);
    }

}
