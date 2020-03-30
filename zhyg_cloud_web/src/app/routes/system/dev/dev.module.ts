import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {DevComponent} from './dev.component';
import {DevService} from './dev.service';
import {SystemRoutingModule} from '../system.routing';
import {DevAddComponent} from './component/dev-add.component';
import {DevModifyComponent} from './component/dev-modify.component';
import {DevDetailLogComponent} from './component/dev-detail-log.component';
import {DevDelComponent} from './component/dev-del.component';
import {DevServiceManagerService} from '../devServiceManager/devServiceManager.service';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        DevComponent,
        DevAddComponent,
        DevModifyComponent,
        DevDelComponent,
        DevDetailLogComponent
    ],
    entryComponents: [
        DevAddComponent,
        DevModifyComponent,
        DevDelComponent,
        DevDetailLogComponent
    ],
    providers: [
        DevService,
        DevServiceManagerService
    ]
})
export class DevModule {

}
