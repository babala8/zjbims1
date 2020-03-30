import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {WorkOrder2Component} from './workOrder2.component';
import {WorkOrder2Service} from './workOrder2.service';
import {MaintainRoutingModule} from '../maintain.routing';


@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        WorkOrder2Component,
    ],
    entryComponents: [
    ],
    providers: [
        WorkOrder2Service
    ]


})
export class WorkOrder2Module {

}
