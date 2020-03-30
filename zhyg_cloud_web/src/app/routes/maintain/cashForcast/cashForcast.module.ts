import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {CashForcastComponent} from './cashForcast.component';
import {CashForcastService} from './cashForcast.service';
import {MaintainRoutingModule} from '../maintain.routing';


@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        CashForcastComponent,
    ],
    entryComponents: [
    ],
    providers: [
        CashForcastService
    ]


})
export class CashForcastModule {

}
