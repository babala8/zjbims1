import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {ElockInfoComponent} from './elockInfo/elockInfo.component';
import {UnelockTaskComponent} from './unelockTask/unelockTask.component';

const routes: Routes = [
    {
        path: 'elockInfoManager',
        component: ElockInfoComponent,
        data: {text: '锁具信息管理'}
    },
    {
        path: 'unelockTaskManager',
        component: UnelockTaskComponent,
        data: {text: '开锁任务管理'}
    }
];

export const ElockRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
