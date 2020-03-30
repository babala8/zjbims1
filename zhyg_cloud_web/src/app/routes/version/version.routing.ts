import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {AppstoreComponent} from './appstore/appstore.components';
import {AppAddComponent} from './appstore/component/app-add.component';
import {AppModifyComponent} from './appstore/component/app-modify.component';
// import {BenchmarkDeployComponent} from './benchmark/component/benchmark-deploy.component';
import {BenchmarkComponent} from './benchmark/benchmark.components';
import {BenchmarkAddComponent} from './benchmark/component/benchmark-add.component';
import {BenchmarkModifyComponent} from './benchmark/component/benchmark-modify.component';
// import {BenchmarkAllocComponent} from './benchmark/component/benchmark-alloc.component';
// import {BenchmarkOperationComponent} from './benchmark/component/benchmark-operation.component';
import {ParameterComponent} from './parameter/parameter.components';
import {AppResultDevComponent} from './appValidResult/appResult-dev.component';
import {AppResultDevAppComponent} from './appValidResult/appResult-dev-app.component';

const routes: Routes = [
    {
        path: 'appstore',
        component: AppstoreComponent,
        data: {text: '应用管理'}
    },
    {
        path: 'appAdd',
        component: AppAddComponent,
        data: {text: '应用添加'}
    },
    {
        path: 'appMod/:appName',
        component: AppModifyComponent,
        data: {text: '应用修改'}
    },
    {
        path: 'benchmark',
        component: BenchmarkComponent,
        data: {text: '标杆管理'}
    },
    {
        path: 'benchmarkAdd',
        component: BenchmarkAddComponent,
        data: {text: '添加标杆'}
    },
    {
        path: 'benchmarkDetails/:no',
        component: BenchmarkModifyComponent,
        data: {text: '标杆详情'}
    },
    {
        path: 'appResult',
        component: AppResultDevComponent,
        data: {text: '版本同步结果'}
    },
    {
        path: 'appResultDevApp',
        component: AppResultDevAppComponent,
        data: {text: '版本同步结果'}
    },
    // {
    //     path: 'benchmarkModify/:no',
    //     component: BenchmarkModifyComponent,
    //     data: {text: '修改标杆'}
    // },
    // {
    //     path: 'benchmarkAlloc/:no',
    //     component: BenchmarkAllocComponent,
    //     data: {text: '分配范围'}
    // },
    // {
    //     path: 'benchmarkDeploy/:no',
    //     component: BenchmarkDeployComponent,
    //     data: {text: '标杆部署'}
    // },
    // {
    //     path: 'benchmarkOperation/:no',
    //     component: BenchmarkOperationComponent,
    //     data: {text: '标杆操作'}
    // },
    {
        path: 'parameter',
        component: ParameterComponent,
        data: {text: '参数管理'}
    }
];

export const VersionRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);

