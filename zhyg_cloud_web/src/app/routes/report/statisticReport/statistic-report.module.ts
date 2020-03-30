import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {StatisticReportComponent} from './statistic-report.component';
import {StatisticReportService} from './statistic-report.service';
import {ReportRoutingModule} from '../report.routing';
import { NzMenuModule } from 'ng-zorro-antd';
import {DevFaultInfoComponent} from './component/dev-fault-info.component';
import {FormsModule} from '@angular/forms';
import {OPenRateInfoComponent} from './component/openRate-info.component';
import {DevCountComponent} from './component/dev-count.component';
import {OrgRetainCardInfoComponent} from './component/org-retainCardInfo.component';
import {TransInfoComponent} from './component/trans-info.component';
// import {CustomTransInfoComponent} from './component/custom-trans-info.component';
import {OpenRateDetailInfoComponent} from './component/openRateDetail-info.component';
import {DevSoftHardWareComponent} from './component/dev-softHardWare.component';
import {DevAddCashInfoComponent} from './component/devAddCash-info.component';
import {ShortenInfoComponent} from './component/shorten-info.component';
import {ShortenDetailInfoComponent} from './component/shorten-Detail-info.component';
import {TransPoundageInfoComponent} from './component/trans-poundage-info.component';
import {AtmAddCashInfoComponent} from './component/atm-AddCash-info.component';

@NgModule({
    imports: [
        SharedModule,
        ReportRoutingModule,
        NzMenuModule,
        FormsModule
    ],
    declarations: [
        StatisticReportComponent,
        DevFaultInfoComponent,
        OPenRateInfoComponent,
        DevCountComponent,
        OrgRetainCardInfoComponent,
        TransInfoComponent,
        OpenRateDetailInfoComponent,
        DevSoftHardWareComponent,
        DevAddCashInfoComponent,
        ShortenInfoComponent,
        ShortenDetailInfoComponent,
        TransPoundageInfoComponent,
        AtmAddCashInfoComponent

    ],
    entryComponents: [
        DevFaultInfoComponent,
        OPenRateInfoComponent,
        DevCountComponent,
        OrgRetainCardInfoComponent,
        TransInfoComponent,
        OpenRateDetailInfoComponent,
        DevSoftHardWareComponent,
        DevAddCashInfoComponent,
        ShortenInfoComponent,
        ShortenDetailInfoComponent,
        TransPoundageInfoComponent,
        AtmAddCashInfoComponent

    ],
    providers: [
        StatisticReportService
    ]
})
export class StatisticReportModule {

}
