import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {WorkOrderComponent} from './workOrder.component';
import {WorkOrderService} from './workOrder.service';
import {MaintainRoutingModule} from '../maintain.routing';


@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        WorkOrderComponent,
    ],
    entryComponents: [
    ],
    providers: [
        WorkOrderService
    ]


})
export class WorkOrderModule {

}
