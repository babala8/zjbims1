import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {TransWorthRoutingModule} from '../transWorth.routing';
import {StaticIndService} from './staticInd.service';
import {StaticIndComponent} from './staticInd.component';

@NgModule({
    imports: [
        TransWorthRoutingModule,
        SharedModule
    ],
    declarations: [
        StaticIndComponent
    ],
    entryComponents: [
    ],
    providers: [
        StaticIndService
    ]
})

export class StaticIndModule {

}
