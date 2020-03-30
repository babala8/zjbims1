import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {RouteRoutingModule} from './routes-routing.module';
import {CallbackComponent} from './callback/callback.component';
import {Exception403Component} from './exception/403.component';
import {Exception404Component} from './exception/404.component';
import {Exception500Component} from './exception/500.component';
import {DemoDashboardComponent} from './dashboard/dashboard.component';
import {LoginComponent} from './login/login.component';
import {PasswordComponent} from './login/password.component';
import {LoginGuard} from '../shared/login_guard';
// import {HeaderModule} from '../layout/metro/header/header.module';
// import {HeaderMenuComponent} from '../layout/metro/header/components/menu/menu.component';
import {NgxEchartsModule} from 'ngx-echarts';
import {DemoDashboardService} from './dashboard/dashboard.service';
import {DevDetailComponent} from './system/dev/component/dev-detail.component';
import {BankMonitorService} from './monitor/bankMonitor/bankMonitor.service';
import {FaultQueryDetailComponent} from './maintain/faultQuery/component/faultQuery-detail.component';
import {FaultQueryFollowComponent} from './maintain/faultQuery/component/faultQuery-follow.component';
import {FaultQueryNoticeComponent} from './maintain/faultQuery/component/faultQuery-notice.component';
import {CaseQueryComponent} from './monitor/devMonitor/component/caseQuery.component';
import {BankMonitorAComponent} from './monitor/bankMonitorA/bankMonitor-a.component';
import {BankMonitorAService} from './monitor/bankMonitorA/bankMonitor-a.service';
import {BankMonitorBComponent} from './monitor/bankMonitorB/bankMonitor-b.component';
import {BankMonitorBService} from './monitor/bankMonitorB/bankMonitor-b.service';
@NgModule({
    imports: [
        NgxEchartsModule,
        SharedModule,
        RouteRoutingModule,
        // HeaderModule,
        // ZjDashboardModule.forRoot(DemoDashboardService),
    ],
    declarations: [
        DemoDashboardComponent,
        CallbackComponent,
        Exception403Component,
        Exception404Component,
        Exception500Component,
        LoginComponent,
        BankMonitorAComponent,
        BankMonitorBComponent,
        PasswordComponent,
        DevDetailComponent,
        FaultQueryDetailComponent,
        FaultQueryFollowComponent,
        FaultQueryNoticeComponent,
        CaseQueryComponent,
    ],
    entryComponents: [
        FaultQueryDetailComponent,
        FaultQueryFollowComponent,
        FaultQueryNoticeComponent,
        DevDetailComponent,
        CaseQueryComponent
    ],    
    providers: [
        // HeaderMenuComponent,
        DemoDashboardService,
        BankMonitorService,
        BankMonitorAService,
        BankMonitorBService,
        LoginGuard,
    ]
})

export class RoutesModule {
}
