import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {RetainCardComponent} from './retainCard.component';
import {RetainCardService} from './retainCard.service';
import {MaintainRoutingModule} from '../maintain.routing';


@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        RetainCardComponent,
    ],
    entryComponents: [
    ],
    providers: [
        RetainCardService
    ]


})
export class RetainCardModule {

}
