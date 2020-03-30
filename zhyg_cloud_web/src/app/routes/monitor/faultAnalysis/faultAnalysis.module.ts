import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {NgxEchartsModule} from 'ngx-echarts';
import {FaultAnalysisComponent} from './faultAnalysis.component';
import {FaultAnalysisService} from './faultAnalysis.service';
@NgModule({
    imports: [
        NgxEchartsModule,
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        FaultAnalysisComponent
    ],
    entryComponents: [
    ],
    providers: [
        FaultAnalysisService
    ]
})
export class FaultAnalysisModule {

}
