import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {TransMonitorComponent} from './transMonitor.component';
import {TransMonitorService} from './transMonitor.service';
import {CommonModule} from '@angular/common';
import {MonitorRoutingModule} from '../monitor.routing';
import {WebSocketService} from '../../remote/webSocketService';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule,
        CommonModule
    ],
    declarations: [
        TransMonitorComponent
    ],
    providers: [
        TransMonitorService,
        WebSocketService
    ]
})
export class TransMonitorModule {

}
