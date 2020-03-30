import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {DevMonitorComponent} from './devMonitor/devMonitor.component';
import {TransMonitorComponent} from './transMonitor/transMonitor.component';
import {BankMonitorComponent} from './bankMonitor/bankMonitor.component';
import {GisMonitorComponent} from './gisMonitor/gisMonitor.component';
import {OrgMonitorComponent} from './orgMonitor/orgMonitor.component';
import {OrgMonitorDetailComponent} from './orgMonitor/component/orgMonitor-detail.component';
import {PjsLogMonitorComponent} from './pjsLogMonitor/pjsLogMonitor.component';
import {PjsTermMonitorComponent} from './pjsTermMonitor/pjsTermMonitor.component';
// import {BankMonitorAComponent} from './bankMonitorA/bankMonitor-a.component';
import {TransInfoComponent} from './transInfo/transInfo.component';
// import {BankMonitorBComponent} from './bankMonitorB/bankMonitor-b.component';
import {PjsMonitorComponent} from './pjsMonitor/pjsMonitor.component';
import {CrdMonitorComponent} from './crdMonitor/crdMonitor.component';
import {TransAnalysisComponent} from './transAnalysis/transAnalysis.component';
import {FaultAnalysisComponent} from './faultAnalysis/faultAnalysis.component';
import {BtsMonitorComponent} from './btsMonitor/btsMonitor.component';
import {SfmMonitorComponent} from './sfmMonitor/sfmMonitor.component';
import {IstMonitorComponent} from './istMonitor/istMonitor.component';


const routes: Routes = [
    {
        path: 'devMonitor',
        component: DevMonitorComponent,
        data: {text: '设备监控'}
    },
    {
        path: 'crdMonitor',
        component: CrdMonitorComponent,
        data: {text: '发卡机监控'}
    },
    {
        path: 'orgMonitor',
        component: OrgMonitorComponent,
        data: {text: '机构监控'}
    },
    {
        path: 'transInfo',
        component: TransInfoComponent,
        data: {text: '交易查询'}
    },
    {
        path: 'transMonitor',
        component: TransMonitorComponent,
        data: {text: '交易监控'}
    },
    {
        path: 'bankMonitor',
        component: BankMonitorComponent,
        data: {text: '大屏展示'}
    },
    {
        path: 'gisMonitor',
        component: GisMonitorComponent,
        data: {text: 'GIS地理'}
    },
    {
        path: 'orgMonitor/detail',
        component: OrgMonitorDetailComponent,
        data: {text: '机构详情监控'}
    },
    {
        path: 'pjsLogMonitor',
        component: PjsLogMonitorComponent,
        data: {text: '交易流水查询'}
    },
    {
        path: 'pjsTermMonitor',
        component: PjsTermMonitorComponent,
        data: {text: '无纸化解绑'}
    },

    {
        path: 'pjsMonitor',
        component: PjsMonitorComponent,
        data: {text: '无纸化流水查询'}
    },
    {
        path: 'transAnalysis',
        component: TransAnalysisComponent,
        data: {text: '交易分析'}
    },
    {
        path: 'faultAnalysis',
        component: FaultAnalysisComponent,
        data: {text: '故障分析'}
    },
    {
        path: 'sfmMonitor',
        component: SfmMonitorComponent,
        data: {text: '填单机监控'}
    },
    {
        path: 'istMonitor',
        component: IstMonitorComponent,
        data: {text: '智能自助终端监控'}
    },
    {
        path: 'btsMonitor',
        component: BtsMonitorComponent,
        data: {text: '回单机监控'}
    },

];

export const MonitorRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
