import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {BankService} from './bank.service';
import {Org} from '../../../models/org';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {Page} from '../../../models/page';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {BankAddComponent} from './component/bank-add.component';
import {BankModifyComponent} from './component/bank-modify.component';
import {SysMenuService} from '../menu/menu.service';



@Component({
    templateUrl: './bank.html',
})
export class BankComponent implements OnInit {

    formModel = {};
    validateForm: FormGroup;
    dataSet = [];
    i = 0;
    loading = true;
    org: Org;
    page = new Page();

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private bankService: BankService,
        private modal: NzModalService,
        private menuService: SysMenuService,
        private message: NzMessageService
    ) {
    }

    ngOnInit() {
        this.validateForm = this.fb.group({
            name: [null],
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}]
        });
        this.refreshData(true);
    }

    refreshData(reset = false) {
        if (reset) {
            this.page.curPage = 1;
        }
        const params = {
            orgNo: this.validateForm.controls.org.value.no || this.session.getUserSession().orgNo,
            name: this.validateForm.controls.name.value || '',
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        console.log(params);
        this.loading = true;
        // 获取当前页
        this.bankService.getBanks(params)
            .subscribe(data => {
                console.log(data);
                this.loading = false;
                if (data.data) {
                    this.dataSet = data.data;
                    this.page.totalRow = data.page.totalRow;
                    this.dataSet.forEach( item => {
                        if (item.isLeader == '1') {
                            item.isLeader = '是' ;
                        } else {
                            item.isLeader = '否' ;
                        }
                        if (item.isLobbyManager == '1') {
                            item.isLobbyManager = '是' ;
                        } else {
                            item.isLobbyManager = '否' ;
                        }
                        if (item.isDevManager == '1') {
                            item.isDevManager = '是' ;
                        } else {
                            item.isDevManager = '否' ;
                        }
                        if (item.isDeskManager == '1') {
                            item.isDeskManager = '是' ;
                        } else {
                            item.isDeskManager = '否' ;
                        }
                    });
                } else {
                    this.dataSet = [];
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

    addBank() {
        const modal = this.modal.open({
            title: '添加银行网点人员',
            maskClosable: false,
            footer: false,
            width:'60%',
            content: BankAddComponent,
            onOk: () => {
                this.refreshData(true);
            },
            onCancel: () => {
            }
        });
    }

    modifyBank(banks) {
        const modal = this.modal.open({
            title: '修改银行网点人员',
            maskClosable: false,
            footer: false,
            width:'60%',
            content: BankModifyComponent,
            componentParams: {
                banks: banks
            },
            onOk: () => {
                this.refreshData(false);
            },
            onCancel: () => {
            },
        });
    }


    confirmDel(no) {
        this.bankService.delBank(no).subscribe(data => {
            this.refreshData(false);
            this.message.success('删除人员成功');
            this.refreshData(false);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 重置查询条件
     *
     */
    reset() {
        this.validateForm.reset();
        this.validateForm.controls.org.setValue({});
        this.validateForm.controls.name.setValue('');
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
