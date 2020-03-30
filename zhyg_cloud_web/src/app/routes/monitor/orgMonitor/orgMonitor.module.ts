import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {OrgMonitorComponent} from './orgMonitor.component';
import {MonitorRoutingModule} from '../monitor.routing';
import {OrgMonitorService} from './orgMonitor.service';
import {OrgMonitorDetailComponent} from './component/orgMonitor-detail.component';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        OrgMonitorComponent,
        OrgMonitorDetailComponent
    ],
    providers: [
        OrgMonitorService
    ]
})
export class OrgMonitorModule {

}
