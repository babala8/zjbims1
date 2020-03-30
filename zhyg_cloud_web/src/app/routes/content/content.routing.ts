import {RouterModule, Routes} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {AdvertisementSpaceComponent} from './advertisementSpace/advertisementSpace.component';
import {ResourceManageComponent} from './resourceManage/resourceManage.component';
import {AdvMakeComponent} from './advMake/advMake.component';
import {AdvValidComponent} from './advInvalid/advValid.component';
import {AdvResultAdvComponent} from './advValidResult/advResult-adv.component';

const routes: Routes = [
    {
        path: 'advertisementSpace',
        component: AdvertisementSpaceComponent,
        data: {text: '广告位管理'}
    },
    {
        path: 'advMake',
        component: AdvMakeComponent,
        data: {text: '广告制作'}
    },
    {
        path: 'advValid',
        component: AdvValidComponent,
        data: {text: '广告投放'}
    },
    {
        path: 'resourceManage',
        component: ResourceManageComponent,
        data: {text: '资源管理'}
    },
    {
        path: 'advValidResult',
        component: AdvResultAdvComponent,
        data: {text: '广告投放情况'}
    }
];

export const ContentRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);

