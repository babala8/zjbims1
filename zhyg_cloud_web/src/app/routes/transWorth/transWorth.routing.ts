import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {DynamicIndComponent} from './dynamicInd/dynamicInd.component';
import {TransValueAnalysisComponent} from './transValueAnalysis/transValueAnalysis.component';
import {StaticIndComponent} from './staticInd/staticInd.component';

const routes: Routes = [
    {
        path: 'dynamicInd',
        component: DynamicIndComponent,
        data: {text: '动态指标'}
    },
    {
        path: 'staticInd',
        component: StaticIndComponent,
        data: {text: '静态指标'}
    },
    {
        path: 'transValueAnalysis',
        component: TransValueAnalysisComponent,
        data: {text: '交易价值分析'}
    }
];

export const TransWorthRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
