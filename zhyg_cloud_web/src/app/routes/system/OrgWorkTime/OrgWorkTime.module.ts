import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import { OrgWorkTimeComponent} from './OrgWorkTime.component';
import {OrgWorkTimeService} from './OrgWorkTime.service';
import {SystemRoutingModule} from '../system.routing';
import { OrgSetTimeComponent} from './component/org-setTime.component';
import {OrgDetailComponent} from './component/org-detail.component';
import {OrgBatchAddComponent} from './component/org-batchAdd.compent';
import {OrgWorkTimeDetailLogComponent} from './component/org-detail-log.component';
import {SpecialDateDetailCompoment} from './component/specialDate-detail.compoment';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        OrgWorkTimeComponent,
        OrgSetTimeComponent,
        OrgDetailComponent,
        OrgBatchAddComponent,
        OrgWorkTimeDetailLogComponent,
        SpecialDateDetailCompoment

    ],
    entryComponents: [
        OrgSetTimeComponent,
        OrgDetailComponent,
        OrgBatchAddComponent,
        OrgWorkTimeDetailLogComponent,
        SpecialDateDetailCompoment,

    ],
    providers: [
        OrgWorkTimeService
    ]
})
export class   OrgWorkTimeModule {

}
