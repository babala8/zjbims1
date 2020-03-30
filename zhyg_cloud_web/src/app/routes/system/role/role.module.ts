import {NgModule} from '@angular/core';
import {RoleService} from './role.service';
import {RoleComponent} from './role.component';
import {SharedModule} from '../../../shared/shared.module';
import {RoleAddComponent} from './component/role-add.component';
import {RoleModifyComponent} from './component/role-modify.component';
import {RoleDetailComponent} from './component/role-detail.component';
import {SystemRoutingModule} from '../system.routing';
import {RoleAccessComponent} from './component/role-access.component';
import {RoleDetailLogComponent} from './component/role-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule
    ],
    declarations: [
        RoleComponent,
        RoleAddComponent,
        RoleModifyComponent,
        RoleDetailComponent,
        RoleAccessComponent,
        RoleDetailLogComponent
    ],
    entryComponents: [
        RoleAddComponent,
        RoleModifyComponent,
        RoleDetailComponent,
        RoleAccessComponent,
        RoleDetailLogComponent
    ],
    providers: [
        RoleService
    ]
})
export class RoleModule {

}




