import {Component, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {StaticIndService} from './staticInd.service';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {animate, state, style, transition, trigger} from '@angular/animations';

@Component({
    templateUrl: './staticInd.html',
    styleUrls: ['./staticInd.css'],
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
        ]),
        trigger('showEdit', [
            state('show', style({
                display: 'block',
            })),
            state('hide', style({
                display: 'none',
            })),
            transition('show => hide', animate('10ms ease-out')),
            transition('hide => show', animate('50ms ease-in')),
        ])
    ]
})
export class StaticIndComponent implements OnInit {
    protected loading = false;
    /**
     * 总列数
     */
    private colNum = 5;
    /**
     * 每列宽度
     */
    protected columnWidth = Math.floor(90 / this.colNum) + '%';
    /**
     * 所有交易指标列表
     */
    private itemList: {
        no: string,
        name: string
    }[] = [];
    /**
     * 可选交易指标列表
     */
    protected selectableItems: {
        no: string,
        name: string
    }[] = [];
    /**
     * 静态价值列表
     */
    private staticValues: {
        transType: string,
        transTypeName: string,
        transValueItem: string,
        transValueItemName: string,
        staticValue: string
    }[] = [];
    /**
     * 合并后的静态价值列表
     */
    private dataSet: {
        transType: string,
        transTypeName: string,
        valueList: {
            itemNo: string,
            itemName: string,
            staticValue: string
        }[]
    }[] = [];
    /**
     * 每列的单元格
     */
    public cols = [];
    /**
     * 备份修改之前的cell
     */
    protected backupCell;
    /**
     * 正在修改的单元格（交易类型）
     */
    protected editCell;
    /**
     * 高光交易类型
     */
    protected highCell;
    /**
     * 编辑按钮高光
     */
    protected overEdit = false;
    /**
     * 删除按钮高光
     */
    protected overDelete;
    /**
     * 添加按钮高光
     */
    protected overAdd;
    /**
     * 是否展示可选指标
     */
    protected showItems = false;
    /**
     * 要添加的指标高光
     */
    protected overAddItem;

    constructor(
        private session: SessionService,
        private fb: FormBuilder,
        private service: StaticIndService,
        private message: NzMessageService,
        private modal: NzModalService,
    ) {
    }

    public ngOnInit() {
        this.service.getStaticValueList().subscribe(
            data => {
                if (data.data) {
                    this.staticValues = data.data;
                    // 根据交易类型合并指标
                    this.mergeValue();
                    // 将交易类型分列展示
                    this.distribute();
                } else {
                    this.staticValues = [];
                }
            }, () => {
                this.message.error('获取静态交易价值失败');
            }
        );
        this.service.getStaticItems().subscribe(
            data => {
                if (data.data) {
                    this.itemList = data.data;
                }
            }, () => {
                this.message.error('获取静态价值指标失败');
            }
        );
    }

    /**
     * 根据交易类型合并指标
     */
    private mergeValue() {
        if (this.staticValues.length > 0) {
            const first = this.staticValues[0];
            // 初始化
            this.dataSet = [{
                transType: first.transType,
                transTypeName: first.transTypeName,
                valueList: [{
                    itemNo: first.transValueItem,
                    itemName: first.transValueItemName,
                    staticValue: first.staticValue
                }]
            }];
            let latest = first.transType;
            for (let i = 1; i < this.staticValues.length; i++) {
                const tmp2 = this.staticValues[i];
                if (tmp2.transType === latest) {
                    this.dataSet[this.dataSet.length - 1].valueList.push({
                        itemNo: tmp2.transValueItem,
                        itemName: tmp2.transValueItemName,
                        staticValue: tmp2.staticValue
                    });
                } else {
                    latest = tmp2.transType;
                    this.dataSet.push({
                        transType: tmp2.transType,
                        transTypeName: tmp2.transTypeName,
                        valueList: [{
                            itemNo: tmp2.transValueItem,
                            itemName: tmp2.transValueItemName,
                            staticValue: tmp2.staticValue
                        }]
                    });
                }
            }
        }
    }

    /**
     * 将交易类型分配到列
     */
    private distribute() {
        const colLen = [];
        // 初始化列
        for (let j = 0; j < this.colNum; j++) {
            this.cols.push([]);
            // 初始化每列长度
            colLen.push(0);
        }
        // 将单元格逐个分配到当前最短的列
        for (const i of this.dataSet) {
            // 获取最短的列的下标
            const tmp = this.findShort(colLen);
            this.cols[tmp].push(i);
            // 更新列长度
            colLen[tmp] += i.valueList.length;
        }
    }

    /**
     * 寻找最短的列
     */
    private findShort(data: number[]): number {
        let result = 0;
        if (data.length > 0) {
            // 备份排序前的数组
            const tmp2 = data.slice();
            // 排序
            for (let i = 0; i < tmp2.length - 1; i++) {
                for (let j = 0; j < tmp2.length - 1 - i; j++) {
                    if (tmp2[j] > tmp2[j + 1]) {
                        const tmp = tmp2[j];
                        tmp2[j] = tmp2[j + 1];
                        tmp2[j + 1] = tmp;
                    }
                }
            }
            // 获取最小值在排序之前的index
            for (let i = 0; i < data.length; i++) {
                if (data[i] === tmp2[0]) {
                    result = i;
                    break;
                }
            }
        }
        return result;
    }

    /**
     * 进入编辑状态
     * @param cell
     */
    protected edit(cell) {
        const transType = cell.transType;
        if (this.editCell) {
            if (this.editCell != transType) {
                this.message.error('请先完成上个交易类型的修改');
            }
            return;
        }
        this.editCell = transType;
        // 备份
        if (!this.backupCell) {
            this.backupCell = [];
            // 对象数组只能遍历来复制
            for (const i of cell.valueList) {
                this.backupCell.push({
                    itemNo: i.itemNo,
                    itemName: i.itemName,
                    staticValue: i.staticValue
                });
            }
        }
        // 去除已选指标
        if (this.selectableItems && this.selectableItems.length > 0) {
            this.selectableItems = [];
        }
        for (const i of this.itemList) {
            let flag = false;
            for (const k of cell.valueList) {
                if (i.no == k.itemNo) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                this.selectableItems.push(i);
            }
        }
    }

    /**
     * 提交修改
     */
    protected submit(i, j) {
        this.loading = true;
        const editItems = [];
        const cell = this.cols[i][j];
        for (const k of cell.valueList) {
            editItems.push({
                transType: cell.transType,
                transValueItem: k.itemNo,
                staticValue: k.staticValue
            });
        }
        console.log(editItems);
        this.service.saveStaticValues(editItems).subscribe(
            () => {
                this.loading = false;
                this.message.success('修改静态指标成功');
                this.editCell = null;
                this.backupCell = null;
                this.showItems = false;
            }, () => {
                this.loading = false;
                this.message.error('修改静态指标失败');
                this.cancel(i, j);
            }
        );
    }

    /**
     * 取消修改
     */
    protected cancel(i, j) {
        this.editCell = null;
        this.cols[i][j].valueList = this.backupCell;
        this.backupCell = null;
        this.showItems = false;
    }

    /**
     * 添加指标
     * @param selected 已选指标
     * @param k 未选指标中的下标
     */
    protected addItem(selected, k) {
        const tmp = this.selectableItems.splice(k, 1)[0];
        selected.push({
            itemNo: tmp.no,
            itemName: tmp.name,
            staticValue: '0'
        });
    }

    /**
     * 删除指标
     * @param selected 已选指标
     * @param i 已选指标中的下标
     */
    protected delItem(selected, i) {
        const tmp = selected.splice(i, 1)[0];
        this.selectableItems.push({
            no: tmp.itemNo,
            name: tmp.itemName
        });
    }

}
