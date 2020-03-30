import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MonitorRoutingModule} from '../monitor.routing';
import {NgxEchartsModule} from 'ngx-echarts';
import {TransAnalysisComponent} from './transAnalysis.component';
import {TransAnalysisService} from './transAnalysis.service';
@NgModule({
    imports: [
        NgxEchartsModule,
        SharedModule,
        MonitorRoutingModule
    ],
    declarations: [
        TransAnalysisComponent
    ],
    entryComponents: [
    ],
    providers: [
        TransAnalysisService
    ]
})
export class TransAnalysisModule {

}
