import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {BankMonitorComponent} from './bankMonitor.component';
import {NgxEchartsModule} from 'ngx-echarts';
import {BankMonitorService} from './bankMonitor.service';
@NgModule({
    imports: [
        NgxEchartsModule,
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        BankMonitorComponent
    ],
    entryComponents: [
    ],
    providers: [
        BankMonitorService
    ]
})
export class BankMonitorModule {

}
