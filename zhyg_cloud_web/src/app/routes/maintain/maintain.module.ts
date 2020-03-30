import {NgModule} from '@angular/core';
import {MaintainRoutingModule} from './maintain.routing';
import {FaultQueryModule} from './faultQuery/faultQuery.module';
import {WorkOrderModule} from './workOrder/workOrder.module';
import {RetainCardModule} from './retainCard/retainCard.module';
import {DevParamModule} from './devParam/devParam.module';
import {CashForcastModule} from './cashForcast/cashForcast.module';
import {ReconcileModule} from './reconcile/reconcile.module';
import {WorkOrder2Module} from './workOrder2/workOrder2.module';


@NgModule({
    imports: [

        FaultQueryModule,
        MaintainRoutingModule,
        WorkOrderModule,
        WorkOrder2Module,
        RetainCardModule,
        DevParamModule,
        CashForcastModule,
        ReconcileModule
    ],
    providers: [
    ]
})
export class MaintainModule {
    constructor() {
    }
}
