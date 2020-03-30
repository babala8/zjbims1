import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {ReconcileComponent} from './reconcile.component';
import {ReconcileService} from './reconcile.service';
import {MaintainRoutingModule} from '../maintain.routing';


@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        ReconcileComponent,
    ],
    entryComponents: [
    ],
    providers: [
        ReconcileService
    ]


})
export class ReconcileModule {

}
