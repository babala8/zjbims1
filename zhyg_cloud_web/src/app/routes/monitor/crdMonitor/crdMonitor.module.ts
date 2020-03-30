import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {FaultQueryService} from '../../maintain/faultQuery/faultQuery.service';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {CrdMonitorComponent} from './crdMonitor.component';
import {CrdMonitorService} from './crdMonitor.service';
import {CrdMonitorDetailComponent} from './component/crdMonitor-detail.component';
import {DevMonitorService} from '../devMonitor/devMonitor.service';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        CrdMonitorComponent,
        CrdMonitorDetailComponent
    ],
    entryComponents: [
        CrdMonitorDetailComponent
    ],
    providers: [
        CrdMonitorService,
        DevMonitorService,
        FaultQueryService,
        VendorService,
        OrgService
    ]
})
export class CrdMonitorModule {

}
