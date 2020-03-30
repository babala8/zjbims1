import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {TargetManagementComponent} from './target/targetManagement.component';
import {BusinessAnalysisComponent} from './business/businessAnalysis.component';

const routes: Routes = [
    {
        path: 'target',
        component: TargetManagementComponent,
        data: {text: '目标管理'},
    },
    {
        path: 'business',
        component: BusinessAnalysisComponent,
        data: {text: '业务数据分析'},
    }

];

export const DecisionRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
