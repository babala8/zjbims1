import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {DevStopComponent} from './devStop.componen';
import {SystemRoutingModule} from '../system.routing';
import {DevStopService} from './devStop.service';
import {DevStopAddComponent} from './component/devStop-add.component';
import {DevStopDetailComponent} from './devStop-detail.component';
import {DevStopModifyComponent} from './component/devStop-modify.component';
import {DevStopDetailLogComponent} from './component/devStop-detail-log.component';


@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        DevStopComponent,
        DevStopAddComponent,
        DevStopDetailComponent,
        DevStopModifyComponent,
        DevStopDetailLogComponent,
    ],
    entryComponents: [
        DevStopAddComponent,
        DevStopModifyComponent,
        DevStopDetailLogComponent,
    ],
    providers: [
        DevStopService,
    ]
})
export class DevStopModule {

}


