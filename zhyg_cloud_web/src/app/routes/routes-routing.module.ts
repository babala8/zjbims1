import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {environment} from '@env/environment';
// layout
import {LayoutMetroComponent} from '../layout/metro/layout.metro.component';

// single pages
import {CallbackComponent} from './callback/callback.component';
import {Exception403Component} from './exception/403.component';
import {Exception404Component} from './exception/404.component';
import {Exception500Component} from './exception/500.component';
import {DemoDashboardComponent} from './dashboard/dashboard.component';
import {LoginComponent} from './login/login.component';
import {PasswordComponent} from './login/password.component';
// import {LoginGuard} from '@core/guard/login-guard.service';
import {CustomPreloadingStrategy} from './CustomPreloadingStrategy';
import {BankMonitorAComponent} from './monitor/bankMonitorA/bankMonitor-a.component';
import {BankMonitorBComponent} from './monitor/bankMonitorB/bankMonitor-b.component';
// login-guard
/**
 *  --baxian
 1，路由守卫，初始的条件是必须得是登陆过的，含有token值，才可以进入路由
 2，其他限制条件请修改../shared/login_guard 内容
 3，canActivate只能验证当前路由 canActivateChild可以验证当前路由的子路由，所以请注意三级路由级以上
 4，登陆页默认不需要路由守卫

 * */
import {LoginGuard} from '../shared/login_guard';


const routes: Routes = [
    {
        path: '',
        redirectTo: 'login',
        pathMatch: 'full'
    },
    {
        path: '',
        // component: LayoutDefaultComponent,
        component: LayoutMetroComponent,
        // canActivate: [LoginGuard],
        // canActivateChild: [AuthGuard],
        children: [
            // {path: '', component: LoginComponent, pathMatch: 'full'},
            // { path: 'dashboard', redirectTo: 'dashboard/v1', pathMatch: 'full' },
            {path: 'dashboard', component: DemoDashboardComponent, canActivate: [LoginGuard]},
            // { path: 'dashboard/analysis', component: DashboardAnalysisComponent },
            // { path: 'dashboard/monitor', component: DashboardMonitorComponent },
            // { path: 'dashboard/workplace', component: DashboardWorkplaceComponent },
            {path: 'system', loadChildren: './system/system.module#SystemModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], data: {prelocd: true}},
            {path: 'version', loadChildren: './version/version.module#VersionModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'content', loadChildren: './content/content.module#ContentModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'remote', loadChildren: './remote/remote.module#RemoteModule' ,
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'monitor', loadChildren: './monitor/monitor.module#MonitorModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'maintain', loadChildren: './maintain/maintain.module#MaintainModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'ntsManage', loadChildren: './ntsManage/ntsManage.module#NtsManageModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'report', loadChildren: './report/report.module#ReportModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'decision', loadChildren: './decision/decision.module#DecisionModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'transWorth', loadChildren: './transWorth/transWorth.module#TransWorthModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'elock', loadChildren: './elock/elock.module#ElockModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'callDev', loadChildren: './callDev/calldev.module#CalldevModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'publicity', loadChildren: './publicity/publicity.module#PublicityModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
            {path: 'returnManage', loadChildren: './returnMachineManage/returnManage.module#ReturnManageModule',
                canActivate: [LoginGuard], canActivateChild : [LoginGuard], },
        ]
    },
    {
        path: 'monitor/bankMonitorA',
        component: BankMonitorAComponent,
        data: {text: '大屏展示A', reuse: false}
    },
    {
        path: 'monitor/bankMonitorB',
        component: BankMonitorBComponent,
        data: {text: '大屏展示B', reuse: false}
    },
    {
        path: 'login',
        component: LoginComponent
    },

    {
        path: 'password/:userNo',
        component: PasswordComponent
    },
    // 单页不包裹Layout
    {path: 'callback/:type', component: CallbackComponent},
    {path: '403', component: Exception403Component},
    {path: '404', component: Exception404Component},
    {path: '500', component: Exception500Component},
    {path: '**', redirectTo: 'dashboard'}
];

@NgModule({
    imports: [RouterModule.forRoot(routes, {
        useHash: environment.useHash,
        preloadingStrategy: CustomPreloadingStrategy
    })],
    exports: [RouterModule]
})
export class RouteRoutingModule {
}
