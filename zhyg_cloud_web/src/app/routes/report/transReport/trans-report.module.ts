import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {TransReportComponent} from './trans-report.component';
import {TransReportService} from './trans-report.service';
import {ReportRoutingModule} from '../report.routing';
import { NzMenuModule } from 'ng-zorro-antd';
import {FormsModule} from '@angular/forms';
import {BranchTransInfoComponent} from './component/branchTrans-info.component';
import {DoubtfulTransInfoComponent} from './component/doubtfulTrans-info.component';
import {TransDetailInfoComponent} from './component/trans-detail-info.component';
import {AtmpSuspiciousTransInfoComponent} from './component/atmp-suspiciousTrans-info.component';
import {OrgEarningInfoComponent} from './component/org-earning-info.component';
import {AtmCashInfoComponent} from './component/atm-cash-info.component';
import {TransInfoComponent} from './component/trans-info.component';

@NgModule({
    imports: [
        SharedModule,
        ReportRoutingModule,
        NzMenuModule,
        FormsModule
    ],
    declarations: [
        TransReportComponent,
        BranchTransInfoComponent,
        DoubtfulTransInfoComponent,
        TransDetailInfoComponent,
        AtmpSuspiciousTransInfoComponent,
        OrgEarningInfoComponent,
        AtmCashInfoComponent,
        TransInfoComponent
    ],
    entryComponents: [

        BranchTransInfoComponent,
        DoubtfulTransInfoComponent,
        TransDetailInfoComponent,
        AtmpSuspiciousTransInfoComponent,
        OrgEarningInfoComponent,
        AtmCashInfoComponent,
        TransInfoComponent
    ],
    providers: [
        TransReportService
    ]
})
export class TransReportModule {

}
