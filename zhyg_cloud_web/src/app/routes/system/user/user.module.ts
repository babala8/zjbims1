import {NgModule} from '@angular/core';
import {UserComponent} from './user.component';
import {UserService} from './user.service';
import {OrgService} from '../org/org.service';
import {RoleService} from '../role/role.service';
import {UserAddComponent} from './component/user-add.component';
import {UserDetailComponent} from './component/user-detail.component';
import {UserModifyComponent} from './component/user-modify.component';
import {SharedModule} from '@shared/shared.module';
import {SystemRoutingModule} from '../system.routing';
import {UserDelComponent} from './component/user-del.component';
import {UserDetailLogComponent} from './component/user-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule
    ],
    declarations: [
        UserComponent,
        UserAddComponent,
        UserDetailComponent,
        UserModifyComponent,
        UserDelComponent,
        UserDetailLogComponent
    ],
    entryComponents: [
        UserAddComponent,
        UserDetailComponent,
        UserModifyComponent,
        UserDelComponent,
        UserDetailLogComponent
    ],
    providers: [
        OrgService,
        RoleService,
        UserService
    ]
})
export class UserModule {

    constructor() {
    }

}
