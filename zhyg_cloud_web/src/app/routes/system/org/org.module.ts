import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {OrgComponent} from './org.component';
import {OrgService} from './org.service';
import {OrgAddComponent} from './component/org-add.component';
import {OrgSetCostComponent} from './component/org-setCost.component';
import {OrgDetailComponent} from './component/org-detail.component';
import {SystemRoutingModule} from '../system.routing';
import {OrgModifyComponent} from './component/org-modify.component';
import {OrgDetailLogComponent} from './component/org-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        OrgComponent,
        OrgAddComponent,
        OrgModifyComponent,
        OrgDetailComponent,
        OrgSetCostComponent,
        OrgDetailLogComponent
    ],
    entryComponents: [
        OrgAddComponent,
        OrgModifyComponent,
        OrgDetailComponent,
        OrgSetCostComponent,
        OrgDetailLogComponent
    ],
    providers: [
        OrgService
    ]
})
export class OrgModule {

}
