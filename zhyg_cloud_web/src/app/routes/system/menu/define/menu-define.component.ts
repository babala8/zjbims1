import {Component, ElementRef, HostBinding, HostListener, OnInit, ViewChild} from '@angular/core';
import {SysMenuService} from '../menu.service';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {ITreeOptions, KEYS, TREE_ACTIONS, TreeComponent, TreeModel, TreeNode} from 'angular-tree-component';

import 'brace/mode/javascript';
import 'brace/theme/clouds';
import 'brace/mode/json';
import * as _ from 'lodash';
import {ContextMenuComponent, ContextMenuService} from 'ngx-contextmenu';
import {determineDuplicateId, removeEmptyChildren} from './util';
import {JsonEditorComponent, JsonEditorOptions} from 'ang-jsoneditor';
import {NzTreeComponent} from '@zjft/ng-tree-antd';
import {Observable} from 'rxjs/Observable';
import {Subject} from 'rxjs/Subject';

@Component({
    templateUrl: './menu-define.html',
    styleUrls: ['./menu-define.less']
})
export class MenuDefineComponent implements OnInit {

    @ViewChild('tree') tree: NzTreeComponent;
    @ViewChild(ContextMenuComponent) contextMenu: ContextMenuComponent;
    @ViewChild(JsonEditorComponent) editor: JsonEditorComponent;


    loading: boolean;
    nodes: any;
    treeNodes: any;
    menu: any;  // 当前选中的菜单项
    options: ITreeOptions;
    editorOptions: JsonEditorOptions;

    menuList = [];

    json$ = new Subject();

    constructor(private menuService: SysMenuService,
                private modal: NzModalService,
                private message: NzMessageService,
                private contextMenuService: ContextMenuService) {
    }

    // 添加子节点
    addChildNode(parent: TreeNode) {
        parent.data.children = parent.data.children || [];
        parent.data.children.push(
            {
                id: parent.data.id + '.' + Math.floor(Math.random() * 10000000),
                text: '未命名菜单项',
                type: 1 // 默认新建路由节点
            }
        );
        this.tree.treeModel.update();
    }

    // 添加兄弟节点
    addSiblingNode(node: TreeNode) {
        // 获取当前节点在父节点children中的索引
        const idx = node.parent.data.children.indexOf(node.data);

        node.parent.data.children.splice(idx + 1, 0, {
            id: node.parent.data.id + '.' + Math.floor(Math.random() * 10000000),
            text: '未命名菜单项',
            type: 1
        });
        this.tree.treeModel.update();
    }

    // 删除当前节点
    deleteNode(node) {
        const parentNode = node.realParent ? node.realParent : node.treeModel.virtualRoot;
        _.remove(parentNode.data.children, (child) => child === node.data);
        this.tree.treeModel.update();
        this.formReset();
    }

    ngOnInit() {
        this.nodes = [];
        this.treeNodes = [];
        this.options = {
            displayField: 'text',
            allowDrag: (node) => node.data.type !== 2,
            actionMapping: {
                mouse: {
                    // 单击，显示选中菜单的属性
                    click: (tree, node, $event) => {
                        $event.preventDefault();
                        $event.stopPropagation();
                        return;
                        // this.menu = node.data;
                        // console.log(this.menu);
                        // if (!node.isActive) {
                        //     TREE_ACTIONS.TOGGLE_ACTIVE(tree, node, $event);
                        //     this.contextMenuService.closeAllContextMenus(null);
                        // }
                    },
                    // 右击，显示contextMenu
                    // contextMenu: (tree, node, $event) => {
                    //     if (!node.isActive) {
                    //         TREE_ACTIONS.TOGGLE_ACTIVE(tree, node, $event);
                    //     }
                    //
                    //     this.menu = node.data;
                    //
                    //     console.log(node);
                    //     this.contextMenuService.show.next({
                    //         contextMenu: this.contextMenu,
                    //         event: $event,
                    //         item: node,
                    //     });
                    //     $event.preventDefault();
                    //     $event.stopPropagation();
                    // }
                }
            }
        };
        this.editorOptions = new JsonEditorOptions();
        this.editorOptions.onChange = () => {
            this.json$.next(this.editor.get());
            // console.log(this.editor.get());
            // console.log(this.editor.data);
        };
        this.editorOptions.mode = 'code'; // set only one mode
        this.formReset();
        this.getMenuJson();
        this.json$.debounceTime(1000).subscribe(data => this.treeNodes = data);
    }

    // 查询数据库里的菜单
    getMenuJson() {
        this.menuService.getMenus()
            .subscribe(data => {
                this.treeNodes = this.nodes = data.data[0].children;
            }, (err) => {
                this.loading = false;
                this.message.error(err.body.retMsg);
            });
        this.menuList = [
            {
                'no': 'A',
                'name': '系统管理'
            },
            {
                'no': 'A01',
                'name': '基本管理'
            },
            {
                'no': 'A0101',
                'name': '用户信息'
            },
            {
                'no': 'B',
                'name': '菜单管理'
            },
            {
                'no': 'B01',
                'name': '模型管理'
            },
            {
                'no': 'B0101',
                'name': '物品管理'
            }
        ];

    }

    /**
     *  保存菜单树
     *  1.判断整颗树中是否相同的id
     *  2.对children为空数组的节点，移除children属性
     */
    save() {
        // const determineResults = determineDuplicateId(this.tree.treeModel.roots);
        // if (determineResults.hasDuplicateId) {
        //     console.error(determineResults);
        //     return;
        // }
        const treeJson = _.cloneDeep(this.tree.treeModel.nodes);
        removeEmptyChildren(treeJson);

        console.log(treeJson);

        this.menuService.saveMenus(treeJson)
            .subscribe(data => {
                console.log(data);
            });
    }

    synchronizeNodes() {
        this.nodes = this.editor.get();
        // console.log(JSON.stringify(this.tree.treeModel.nodes));
        // this.nodes = [].concat(this.tree.treeModel.nodes);
    }

    formReset() {
        this.menu = {
            id: null,
            text: null,
            type: null, // 0-导航节点，1-路由节点，2-按钮节点
            icon: null,
            link: null,
            acl: null
        };
    }

    nodeTypeChange(menu) {
        if (menu.type === 0) {
            if (menu.children && menu.children.length) {
                console.error('当前路由节点下有子节点，不允许替换节点类型');
                // 阻止节点类型转换
                setTimeout(() => {
                    menu.type = 0;
                });
            }
        } else if (menu.type === 1) {
            if (menu.children && menu.children.length) {
                console.error('当前路由节点下有子节点，不允许替换节点类型');
                // 阻止节点类型转换
                setTimeout(() => {
                    menu.type = 1;
                });
            }
        }
    }

    menuNoChange($event) {
        for (const i of this.menuList) {
            if (i.no === $event) {
                this.menu.text = i.name;
            }
        }
    }

}
