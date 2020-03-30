import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {NgxEchartsModule} from 'ngx-echarts';
import {BankMonitorAService} from './bankMonitor-a.service';
@NgModule({
    imports: [
        NgxEchartsModule,
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
    ],
    entryComponents: [
    ],
    providers: [
        BankMonitorAService
    ]
})
export class BankMonitorAModule {

}
