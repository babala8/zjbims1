// 叫号机管理路由配置
import {RouterModule, Routes} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';

import {BusinessComponent} from './business/business.component';
import {BusinessConfigComponent} from './businessConfig/businessConfig.component';
import {ReserveSearchComponent} from './reserveSearch/reserveSearch.component';
import {DevManagerComponent} from './devManager/devManager.component';

const routes: Routes = [
    {
        path: 'devManager',
        component: DevManagerComponent,
        data: {text: '设备信息管理'}
    },
    {
        path: 'businessConfig',
        component: BusinessConfigComponent,
        data: {text: '总行业务配置'}
    },
    {
        path: 'business',
        component: BusinessComponent,
        data: {text: '设备业务配置'}
    },
    {
        path: 'reserveSearch',
        component: ReserveSearchComponent,
        data: {text: '预约查询'}
    }
];

export const CalldevRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);

