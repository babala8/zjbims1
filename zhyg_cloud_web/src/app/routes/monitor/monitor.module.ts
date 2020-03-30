import {NgModule} from '@angular/core';
import {DevMonitorModule} from './devMonitor/devMonitor.module';
import {MonitorRoutingModule} from './monitor.routing';
import {TransMonitorModule} from './transMonitor/transMonitor.module';
import {DevService} from '../system/dev/dev.service';
import {SysMenuService} from '../system/menu/menu.service';
import {BankMonitorModule} from './bankMonitor/bankMonitor.module';
import {GisMonitorModule} from './gisMonitor/gisMonitor.module';
import {OrgMonitorModule} from './orgMonitor/orgMonitor.module';
import {PjsLogMonitorModule} from './pjsLogMonitor/pjsLogMonitor.module';
import {PjsTermMonitorModule} from './pjsTermMonitor/pjsTermMonitor.module';
import {TransInfoModule} from './transInfo/transInfo.module';
// import {BankMonitorAModule} from './bankMonitorA/bankMonitor-a.module';
// import {BankMonitorBModule} from './bankMonitorB/bankMonitor-b.module';
import {PjsMonitorModule} from './pjsMonitor/pjsMonitor.module';
import {CrdMonitorModule} from './crdMonitor/crdMonitor.module';
import {TransAnalysisModule} from './transAnalysis/transAnalysis.module';
import {FaultAnalysisModule} from './faultAnalysis/faultAnalysis.module';
import {BtsMonitorModule} from './btsMonitor/btsMonitor.module';
import {SfmMonitorModule} from './sfmMonitor/sfmMonitor.module';
import {IstMonitorModule} from './istMonitor/istMonitor.module';

@NgModule({
    imports: [
        DevMonitorModule,
        MonitorRoutingModule,
        TransInfoModule,
        TransMonitorModule,
        BankMonitorModule,
        GisMonitorModule,
        OrgMonitorModule,
        PjsLogMonitorModule,
        PjsTermMonitorModule,
        // BankMonitorBModule,
        // BankMonitorAModule,
        PjsMonitorModule,
        CrdMonitorModule,
        TransAnalysisModule,
        FaultAnalysisModule,
        BtsMonitorModule,
        SfmMonitorModule,
        IstMonitorModule,
    ],
    providers: [
        DevService,
        SysMenuService
    ]
})
export class MonitorModule {
    constructor() {
    }
}
