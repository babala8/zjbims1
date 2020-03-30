import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {TargetManagementComponent} from './targetManagement.component';
import {TargetManagementService} from './targetManagement.service';
import {TargetManagementAddComponent} from './component/targetManagement-add.component';
import {TargetManagementModifyComponent} from './component/targetManagement-modify.component';
import {DecisionRoutingModule} from '../decision.routing';

@NgModule({
    imports: [
        SharedModule,
        DecisionRoutingModule
    ],
    declarations: [
        TargetManagementComponent,
        TargetManagementAddComponent,
        TargetManagementModifyComponent
    ],
    entryComponents: [
        TargetManagementAddComponent,
        TargetManagementModifyComponent
    ],
    providers: [
        TargetManagementService
    ]
})
export class TargetManagementModule {

}
