import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {NgxEchartsModule} from 'ngx-echarts';
import {BankMonitorBService} from './bankMonitor-b.service';
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
        BankMonitorBService
    ]
})
export class BankMonitorBModule {

}
