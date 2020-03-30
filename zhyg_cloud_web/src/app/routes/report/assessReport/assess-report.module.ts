import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {AssessReportComponent} from './assess-report.component';
import {AssessReportService} from './assess-report.service';
import {ReportRoutingModule} from '../report.routing';
import { NzMenuModule } from 'ng-zorro-antd';
import {FormsModule} from '@angular/forms';
import {DevTypeInfoComponent} from './component/dev-type-info.component';
import {DevAdminAssessInfoComponent} from './component/devAdmin-assess-info.component';
import {DevServiceInfoComponent} from './component/devService-info.component';
import {AdminDetailInfoComponent} from './component/admin-Detail-info.component';


@NgModule({
    imports: [
        SharedModule,
        ReportRoutingModule,
        NzMenuModule,
        FormsModule
    ],
    declarations: [
        AssessReportComponent,
        DevTypeInfoComponent,
        DevAdminAssessInfoComponent,
        DevServiceInfoComponent,
        AdminDetailInfoComponent



    ],
    entryComponents: [
        DevTypeInfoComponent,
        DevAdminAssessInfoComponent,
        DevServiceInfoComponent,
        AdminDetailInfoComponent

    ],
    providers: [
        AssessReportService
    ]
})
export class AssessReportModule {

}
