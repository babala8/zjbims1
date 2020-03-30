import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {BaseReportComponent} from './base-report.component';
import {BaseReportService} from './base-report.service';
import {ReportRoutingModule} from '../report.routing';
import { NzMenuModule } from 'ng-zorro-antd';
import {DevInfoComponent} from './component/dev-info.component';
import {FormsModule} from '@angular/forms';
import {DevVersionComponent} from './component/dev-version.component';
import {DevSoftHardWareComponent} from './component/dev-softHardWare.component';
import {BranchTransInfoComponent} from './component/branchTrans-info.component';
import {DevVersionInfoComponent} from './component/devVersion-info.component';

@NgModule({
    imports: [
        SharedModule,
        ReportRoutingModule,
        NzMenuModule,
        FormsModule
    ],
    declarations: [
        BaseReportComponent,
        DevInfoComponent,
        DevVersionComponent,
        DevSoftHardWareComponent,
        BranchTransInfoComponent,
        DevVersionInfoComponent

    ],
    entryComponents: [
        DevInfoComponent,
        DevVersionComponent,
        DevSoftHardWareComponent,
        BranchTransInfoComponent,
        DevVersionInfoComponent

    ],
    providers: [
        BaseReportService
    ]
})
export class BaseReportModule {

}
