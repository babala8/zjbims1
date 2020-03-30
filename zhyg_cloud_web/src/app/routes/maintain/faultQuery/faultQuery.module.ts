import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {FaultQueryComponent} from './faultQuery.component';
import {FaultQueryService} from './faultQuery.service';
import {MaintainRoutingModule} from '../maintain.routing';
import {FaultQueryDetailComponent} from './component/faultQuery-detail.component';
import {FaultQueryFollowComponent} from './component/faultQuery-follow.component';
import {FaultQueryNoticeComponent} from './component/faultQuery-notice.component';
import {DevService} from '../../system/dev/dev.service';

@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        FaultQueryComponent,
        // FaultQueryDetailComponent,
        // FaultQueryFollowComponent,
        // FaultQueryNoticeComponent

    ],
    entryComponents: [
        // FaultQueryDetailComponent,
        // FaultQueryFollowComponent,
        // FaultQueryNoticeComponent

    ],
    providers: [
        FaultQueryService,
        DevService
    ]
})
export class FaultQueryModule {

}
