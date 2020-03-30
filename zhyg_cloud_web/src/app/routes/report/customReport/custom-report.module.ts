import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {CustomReportComponent} from './custom-report.component';
import {ReportRoutingModule} from '../report.routing';
import {CustomOPenRateInfoComponent} from './component/custom-openRate-info.component';
import {CustomTransInfoComponent} from './component/custom-trans-info.component';
import {PoundageInfoComponent} from './component/poundage-info.component';
import {CustomReportService} from './custom-report.service';
import {DevInfoComponent} from './component/dev-info.component';

@NgModule({
    imports: [
        SharedModule,
        ReportRoutingModule,
    ],
    declarations: [
        CustomReportComponent,
        CustomOPenRateInfoComponent,
        CustomTransInfoComponent,
        PoundageInfoComponent,
        DevInfoComponent
    ],
    entryComponents: [
        CustomOPenRateInfoComponent,
        CustomTransInfoComponent,
        PoundageInfoComponent,
        DevInfoComponent
    ],
    providers: [
        CustomReportService,
    ]
})
export class CustomReportModule {

}
