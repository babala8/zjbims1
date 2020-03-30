import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {DevServiceManagerComponent} from './devServiceManager.component';
import {DevServiceManagerService} from './devServiceManager.service';
import {DevServiceManagerAddComponent} from './component/devServiceManager-add.component';
import {DevServiceManagerModifyComponent} from './component/devServiceManager-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {DevServiceManagerDetailLogComponent} from './component/devServiceManager-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        DevServiceManagerComponent,
        DevServiceManagerAddComponent,
        DevServiceManagerModifyComponent,
        DevServiceManagerDetailLogComponent

    ],
    entryComponents: [
        DevServiceManagerAddComponent,
        DevServiceManagerModifyComponent,
        DevServiceManagerDetailLogComponent
    ],
    providers: [
        DevServiceManagerService
    ]
})
export class DevServiceManagerModule {

}
