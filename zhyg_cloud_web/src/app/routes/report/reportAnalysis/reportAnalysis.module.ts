import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ReportAnalysisComponent} from './reportAnalysis.component';
import {ReportAnalysisService} from './reportAnalysis.service';
import {ReportRoutingModule} from '../report.routing';

@NgModule({
    imports: [
        SharedModule,
        ReportRoutingModule,
    ],
    declarations: [
        ReportAnalysisComponent,

    ],
    entryComponents: [

    ],
    providers: [
        ReportAnalysisService,
    ]
})
export class ReportAnalysisModule {

}
