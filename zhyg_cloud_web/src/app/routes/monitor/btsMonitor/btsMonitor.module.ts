import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {FaultQueryService} from '../../maintain/faultQuery/faultQuery.service';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {BtsMonitorComponent} from './btsMonitor.component';
import {BtsMonitorService} from './btsMonitor.service';
// import {BtsMonitorDetailComponent} from './component/btsMonitor-detail.component';
import {BtsMonitorDetailComponent} from './component/btsMonitor-detail.component';
import {DevMonitorService} from '../devMonitor/devMonitor.service';
import {DirectiveModule} from '../NumberinputDirective/directive.module';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule,
        DirectiveModule
    ],
    declarations: [
        BtsMonitorComponent,
        BtsMonitorDetailComponent
    ],
    entryComponents: [
        BtsMonitorDetailComponent
    ],
    providers: [
        BtsMonitorService,
        DevMonitorService,
        FaultQueryService,
        VendorService,
        OrgService
    ]
})
export class BtsMonitorModule {

}
