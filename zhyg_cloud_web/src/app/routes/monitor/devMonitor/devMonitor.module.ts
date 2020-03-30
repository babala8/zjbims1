import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {DevMonitorComponent} from './devMonitor.component';
import {MonitorRoutingModule} from '../monitor.routing';
import {DevMonitorService} from './devMonitor.service';
import {DevMonitorDetailComponent} from './component/devMonitor-detail.component';
import {FaultQueryService} from '../../maintain/faultQuery/faultQuery.service';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {DirectiveModule} from '../NumberinputDirective/directive.module';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule,
        DirectiveModule
    ],
    declarations: [
        DevMonitorComponent,
        DevMonitorDetailComponent,
    ],
    entryComponents: [
        DevMonitorDetailComponent,
    ],
    providers: [
        DevMonitorService,
        FaultQueryService,
        VendorService,
        OrgService
    ]
})
export class DevMonitorModule {

}
