import {NgModule} from '@angular/core';
import {ReportRoutingModule} from './report.routing';
import {ReportAnalysisModule} from './reportAnalysis/reportAnalysis.module';
import {BaseReportModule} from './baseReport/base-report.module';
import {StatisticReportModule} from './statisticReport/statistic-report.module';
import {TransReportModule} from './transReport/trans-report.module';
import {AssessReportModule} from './assessReport/assess-report.module';
import {CustomReportModule} from './customReport/custom-report.module';

@NgModule({
    imports: [
        StatisticReportModule,
        BaseReportModule,
        ReportAnalysisModule,
        ReportRoutingModule,
        TransReportModule,
        AssessReportModule,
        CustomReportModule

    ],
    providers: [
    ]
})
export class ReportModule {
    constructor() {
    }
}
