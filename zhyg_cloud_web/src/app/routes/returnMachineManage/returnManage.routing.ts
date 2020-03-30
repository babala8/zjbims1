// 叫号机管理路由配置
import {RouterModule, Routes} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';

import {CardCollectionTaskComponent} from './cardCollectionTask/cardCollectionTask.component';
import {AssociatedAccountComponent} from './associtedAccount/associatedAccount.component';
import {CardReplaceComponent} from './cardReplace/cardReplace.component';


const routes: Routes = [
    {
        path: 'cardCollection',
        component: CardCollectionTaskComponent,
        data: {text: '回单卡领入'}
    },
    {
        path: 'associated',
        component: AssociatedAccountComponent,
        data: {text: '回单卡关联账户'}
    },
    {
        path: 'replaced',
        component: CardReplaceComponent,
        data: {text: '对公卡挂失换卡'}
    },

];

export const returnManageRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);

