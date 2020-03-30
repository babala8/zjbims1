import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {IstMonitorComponent} from './istMonitor.component';
import {MonitorRoutingModule} from '../monitor.routing';
import {IstMonitorService} from './istMonitor.service';
import {IstMonitorDetailComponent} from './component/istMonitor-detail.component';
import {FaultQueryService} from '../../maintain/faultQuery/faultQuery.service';
import {VendorService} from '../../system/vendor/vendor.service';
import {OrgService} from '../../system/org/org.service';
import {CaseQueryComponent} from './component/caseQuery.component';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        IstMonitorComponent,
        IstMonitorDetailComponent,
        CaseQueryComponent
    ],
    entryComponents: [
        IstMonitorDetailComponent,
        CaseQueryComponent
    ],
    providers: [
        IstMonitorService,
        FaultQueryService,
        VendorService,
        OrgService
    ]
})
export class IstMonitorModule {

}
