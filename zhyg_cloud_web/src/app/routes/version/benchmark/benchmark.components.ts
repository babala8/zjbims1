import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService, NzModalSubject} from 'ng-zorro-antd';
import {ModelInfo} from '../../../models/modelInfo';
import {HttpResponse} from '@angular/common/http';
import {BenchmarkService} from './benchmark.service';
import {animate, state, style, transition, trigger} from '@angular/animations';
import {Router} from '@angular/router';
import {SysMenuService} from '../../system/menu/menu.service';
import {SessionService} from '@core/session.service';
import {BenchmarkApps} from '../../../models/benchmarkApps';
import {BenchmarkAddComponent} from './component/benchmark-add.component';
import {BenchmarkModifyComponent} from './component/benchmark-modify.component';

@Component({
    templateUrl: './benchmark.html',
    styleUrls: ['./benchmark.scss'],
    animations: [
        trigger('showIcon', [
            state('show', style({
                display: 'block',
                opacity: 1,
            })),
            state('hide', style({
                display: 'none',
                opacity: 0,
            })),
            transition('show => hide', animate('200ms ease-out')),
            transition('hide => show', animate('100ms ease-in')),
        ]),
        trigger('high', [
            state('show', style({
                display: 'block',
                opacity: 1,
            })),
            state('hide', style({
                display: 'none',
                opacity: 0,
            })),
            transition('show => hide', animate('200ms ease-out')),
            transition('hide => show', animate('100ms ease-in')),
        ])
    ]
})
export class BenchmarkComponent implements OnInit {
    flag = true;
    loading = true;
    formModel = {};
    dataSet: ModelInfo[] = [];
    options = [];
    // 用于分页显示的相关参数
    curPage = 1;
    totalNum = 0;
    pageSize = 16;
    displayDataSet: ModelInfo[] = [];
    // 下面三个参数用来实现点击任意地方保存修改的功能
    // 标杆名称修改完成
    editName = false;
    // 标杆描述修改完成
    editDescription = false;
    // 是否修改过
    hasEdit = false;
    // 当前正在修改的标杆
    editModel: ModelInfo;
    /**
     * 已部署应用当前版本信息
     */
    curVersion: BenchmarkApps[] = [];
    /**
     * 所有上级机构的app
     */
    upperVersion: BenchmarkApps[] = [];
    dataStartIndex: number;
    dataEndIndex: number;

    constructor(
        private message: NzMessageService,
        private nzModal: NzModalSubject,
        private modal: NzModalService,
        private router: Router,
        private menuService: SysMenuService,
        private benchmarkService: BenchmarkService,
        private session: SessionService
    ) {
    }

    ngOnInit() {
        this.formModel['org'] = {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName};
        this.options = [
            {value: '', label: '全部'},
            {value: 1, label: '基础标杆'},
            {value: 2, label: '特色标杆'}
        ];
        this.refreshData();
    }

    refreshData() {
        this.dataSet = [];
        this.loading = true;
        const params = {
            modelName: this.formModel['modelName'] || '',
            modelType: this.formModel['modelType'] || '',
            orgNo: this.formModel['org'].no,
        };
        // 获取标杆列表
        this.benchmarkService.qryModel(params)
            .subscribe(_data => {
                if (_data.data) {
                    this.dataSet = _data.data;
                    // 默认不显示删除图标
                    this.dataSet.forEach(x => {
                        x.showDel = 'hide';
                        x.showEdit = false;
                    });
                    this.displayDataSet = this.dataSet;
                    this.displayDataSet.forEach(item => {
                       if (item.modelName.length > 8) {
                           item.modelName = item.modelName.substring(0, 8) + '...';
                       }
                        if (item.orgName.length > 8) {
                            item.orgName = item.orgName.substring(0, 8) + '...';
                        }
                    });
                    this.totalNum = this.displayDataSet.length;
                    this.changePageIndex();
                } else {
                    this.dataSet = [];
                }
                this.loading = false;
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    search() {
        this.refreshData();
    }

    /**
     * 重置
     */
    reset() {
        this.formModel['org'] = {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName};
        this.formModel['modelName'] = '';
        this.formModel['modelType'] = '';
        this.refreshData();
    }

    showModel(model) {
        this.upperVersion = [];
        this.curVersion = [];
        this.flag = false;
        this.editModel = model;
    }

    addModelPage() {
        this.modal.open({
            title: '新增标杆',
            maskClosable: false,
            footer: false,
            content: BenchmarkAddComponent,
            componentParams: {

            },
            onOk: () => {
                this.refreshData();
            },
            onCancel: () => {
            }
        });
    }

    modModelPage(id: string) {
        this.modal.open({
            title: '修改标杆',
            maskClosable: false,
            footer: false,
            content: BenchmarkModifyComponent,
            componentParams: {
                modelId: id
            },
            onOk: () => {
                this.refreshData();
            },
            onCancel: () => {
            }
        });
    }

    delModel(id: string) {
        const params = {
            modelId: id,
            userNo: this.session.getUserSession().account
        };
        this.benchmarkService.delModel(params)
            .subscribe(data => {
                this.message.success(`删除标杆成功！`);
                this.nzModal.destroy('onOk');
                this.refreshData();
            }, (error) => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                } else {
                    this.message.error(`删除失败！`);
                }

            });
        this.loading = false;
    }

    /**
     * 鼠标移动到卡片上显示删除图标
     */
    showIcon(i: number) {
        this.dataSet[i].showDel = 'show';
    }

    hideIcon(i: number) {
        this.dataSet[i].showDel = 'hide';
    }

    cancel() {

    }

    /**
     * 失去焦点和获取焦点执行的函数
     */
    blurName() {
        this.editName = false;
        this.hasEdit = true;
    }

    blurDescription() {
        this.editDescription = false;
        this.hasEdit = true;
    }

    focusName() {
        this.editName = true;
        this.hasEdit = true;
    }

    focusDescription() {
        this.editDescription = true;
        this.editName = false;
        this.hasEdit = true;

    }

    /**
     * 显示修改界面
     * @param i
     */
     /*showEdit(i: number) {
        this.dataSet[i].showEdit = true;
        if (this.editModel) {
            // 只允许同时修改一个标杆
            this.editModel.showEdit = false;
            this.modModel();
            this.editModel = null;
            this.hasEdit = false;
        }
        this.editName = true;
        this.editModel = this.dataSet[i];
    }*/

    /*hideEdit(event) {
        if (event.target.id !== 'editBtn') {
            return;
        }
        if (!(this.editName || this.editDescription) || !this.hasEdit) {
            this.editModel.showEdit = false;
            this.hasEdit = false;
            this.modModel();
            this.editModel = null;
        }
    }*/

    /**
     * 修改标杆
     */
    modModel() {
        this.benchmarkService.modifyModel({
            modelId: this.editModel.logicId,
            modelName: this.editModel.modelName,
            description: this.editModel.description
        }).subscribe(data => {
            this.message.success(data.retMsg);
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 分页处理
     */
    changePageIndex() {
       // console.log(this.curPage);
        this.dataStartIndex = (this.curPage - 1) * this.pageSize;
        this.dataEndIndex = this.dataStartIndex + this.pageSize;
        if (this.dataSet.length < this.dataEndIndex) {
            this.dataEndIndex = this.dataSet.length;
        }
        this.displayDataSet = this.dataSet.slice(this.dataStartIndex, this.dataEndIndex);
       // console.log(this.displayDataSet);
    }

    jump() {
        this.router.navigate(['/version/benchmark']);
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
