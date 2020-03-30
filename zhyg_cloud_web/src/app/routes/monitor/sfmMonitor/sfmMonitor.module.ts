import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {FaultQueryService} from '../../maintain/faultQuery/faultQuery.service';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {SfmMonitorComponent} from './sfmMonitor.component';
import {SfmMonitorService} from './sfmMonitor.service';
import {SfmMonitorDetailComponent} from './component/sfmMonitor-detail.component';
import {DevMonitorService} from '../devMonitor/devMonitor.service';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        SfmMonitorComponent,
        SfmMonitorDetailComponent
    ],
    entryComponents: [
        SfmMonitorDetailComponent
    ],
    providers: [
        SfmMonitorService,
        DevMonitorService,
        FaultQueryService,
        VendorService,
        OrgService
    ]
})
export class SfmMonitorModule {

}
