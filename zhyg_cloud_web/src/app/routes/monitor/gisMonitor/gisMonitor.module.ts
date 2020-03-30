import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {NgxEchartsModule} from 'ngx-echarts';
import {GisMonitorComponent} from './gisMonitor.component';
import {GisMonitorService} from './gisMonitor.service';
@NgModule({
    imports: [
        NgxEchartsModule,
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        GisMonitorComponent
    ],
    entryComponents: [
    ],
    providers: [
        GisMonitorService
    ]
})
export class GisMonitorModule {
}
