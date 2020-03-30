import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {FaultQueryComponent} from './faultQuery/faultQuery.component';
import {WorkOrderComponent} from './workOrder/workOrder.component';
import {RetainCardComponent} from './retainCard/retainCard.component';
import {DevParamComponent} from './devParam/devParam.component';
import {CashForcastComponent} from './cashForcast/cashForcast.component';
import {ReconcileComponent} from './reconcile/reconcile.component';
import {WorkOrder2Component} from './workOrder2/workOrder2.component';

const routes: Routes = [
    {
        path: 'faultQuery',
        component: FaultQueryComponent,
        data: {text: '故障查询'}
    },
    {
        path: 'workOrder',
        component: WorkOrderComponent,
        data: {text: '工单管理'}
    },
    {
        path: 'workOrder2',
        component: WorkOrder2Component,
        data: {text: '工单管理2'}
    },
    {
        path: 'retainCard',
        component: RetainCardComponent,
        data: {text: '吞卡系统'}
    },
    {
        path: 'devParam',
        component: DevParamComponent,
        data: {text: '设备参数设置'}
    },
    {
        path: 'cashForcast',
        component: CashForcastComponent,
        data: {text: '加钞对账'}
    },
    {
        path: 'reconcile',
        component: ReconcileComponent,
        data: {text: '对账查询'}
    }
];

export const MaintainRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
