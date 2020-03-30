import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {DevControlComponent} from './devControl/devControl.component';
import {ControlResultComponent} from './controlResult/controlResult.component';
import {AtmFunctionComponent} from './atmFunction/atmFunction.component';
import {AtmFunctionDefComponent} from './atmFunctionDef/atmFunctionDef.component';

const routes: Routes = [
    {
        path: 'devControl',
        component: DevControlComponent,
        data: {text: '设备控制'}
    },
    {
        path: 'controlResult',
        component: ControlResultComponent,
        data: {text: '控制结果查询'}
    },
    {
        path: 'atmFunction',
        component: AtmFunctionComponent,
        data: {text: '功能定义'}
    },
    {
        path: 'atmFunctionDef',
        component: AtmFunctionDefComponent,
        data: {text: '交易类型管理'}
    }

];

export const RemoteRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
