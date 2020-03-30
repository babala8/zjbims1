import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ControlResultComponent} from './controlResult.component';
import {ControlResultService} from './controlResult.service';
import {DevService} from '../../system/dev/dev.service';
import {RemoteRoutingModule} from '../remote.routing';




@NgModule({
    imports: [
        SharedModule,
        RemoteRoutingModule,
    ],
    declarations: [
        ControlResultComponent
    ],
    entryComponents: [

    ],
    providers: [
        ControlResultService,
        DevService
    ]
})
export class ControlResultModule {

}
