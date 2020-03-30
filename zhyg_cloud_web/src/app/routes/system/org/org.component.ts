import {Component, OnInit} from '@angular/core';
import {OrgService} from './org.service';
import {Org} from '../../../models/org';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {OrgType} from '../../../models/orgType';
import {OrgAddComponent} from './component/org-add.component';
import {OrgSetCostComponent} from './component/org-setCost.component';
import {OrgDetailComponent} from './component/org-detail.component';
import {SysMenuService} from '../menu/menu.service';
import {OrgModifyComponent} from './component/org-modify.component';

@Component({
    templateUrl: './org.html',
})
export class OrgComponent implements OnInit {

    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    orgGrade;
    orgTypeList: OrgType[] = [];
    loading = true;
    org: Org;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private orgService: OrgService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            orgNo: [null],
            orgType: [null],
            upper: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}],
        });

        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            orgNo: this.validateForm.controls.orgNo.value || '',
            userOrgNo: this.session.getUserSession().orgNo || '',
            orgTypeNo: this.validateForm.controls.orgType.value || '',
            parentOrgNo: this.validateForm.controls.upper.value.no || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize
        };
        this.loading = true;
        // 获取当前页
        this.orgService.getOrgs(params)
            .subscribe(data => {
                // console.log(data);
                this.loading = false;
                this.dataSet = data.data;
                if (data.page != null) {
                    this.page.totalRow = data.page.totalRow;
                } else {
                    this.page.totalRow = 0;
                }

                if (this.dataSet == null || this.dataSet.length == 0) {
                    this.dataSet = [];
                }
            }, (error) => {
                this.loading = false;
                // console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    addOrg() {
        this.modal.open({
            title: '添加机构',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: OrgAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }
    modifyOrg(orgs) {
        const modal = this.modal.open({
            title: '修改机构',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: OrgModifyComponent,
            componentParams: {
                orgs: orgs
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }

    setCost(org) {
        const modal = this.modal.open({
            title: '成本录入',
            maskClosable: false,
            footer: false,
            content: OrgSetCostComponent,
            width: '60%',
            componentParams: {
                org: org
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }

    openDetail(org) {
        const modal = this.modal.open({
            title: '机构详情',
            maskClosable: false,
            footer: false,
            width: '60%',
            content: OrgDetailComponent,
            componentParams: {
                org: org
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }

    confirmDel(org) {
        this.orgService.delOrg(org
        ).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除机构成功');
            this.refreshData(false);
        }, (error) => {
            // console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
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
                                   /* if ((Number(data[this.i].grade)) === (Number(this.org.orgType.grade) + 1)) {
                                        data1.push(data[this.i]);
                                    }*/
                                   data1.push(data[this.i]);
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
        this.validateForm.controls.orgNo.setValue('');
        this.validateForm.controls.upper.setValue({no: '', name: ''});
        this.validateForm.controls.orgType.setValue('');
        this.orgTypeList = [];
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
