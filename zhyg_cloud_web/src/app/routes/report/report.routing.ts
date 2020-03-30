import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {ReportAnalysisComponent} from './reportAnalysis/reportAnalysis.component';
import {BaseReportComponent} from './baseReport/base-report.component';
import {DevVersionComponent} from './baseReport/component/dev-version.component';
import {StatisticReportComponent} from './statisticReport/statistic-report.component';
import {TransReportComponent} from './transReport/trans-report.component';
import {AssessReportComponent} from './assessReport/assess-report.component';
import {CustomReportComponent} from './customReport/custom-report.component';

const routes: Routes = [
    {
        path: 'reportAnalysis',
        component: ReportAnalysisComponent,
        data: {text: '多维分析'}
    },
    {
        path: 'statisticReport',
        component: StatisticReportComponent,
        data: {text: '统计报表'}
    },
    {
        path: 'baseReport',
        component: BaseReportComponent,
        data: {text: '基础报表'}
    },
    {
        path: 'transReport',
        component: TransReportComponent,
        data: {text: '交易报表'}
    },
    {
        path: 'assessReport',
        component: AssessReportComponent,
        data: {text: '考核报表'}
    },
    {
        path: 'customReport',
        component: CustomReportComponent,
        data: {text: '定制报表'}
    }
];

export const ReportRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
