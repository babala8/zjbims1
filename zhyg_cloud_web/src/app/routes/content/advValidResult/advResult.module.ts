import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ContentRoutingModule} from '../content.routing';
import {AdvResultAdvComponent} from './advResult-adv.component';
import {CommonModule} from '@angular/common';
import {AdvResultDevComponent} from './advResult-dev.component';
import {AdvResultAdvDevComponent} from './advResult-adv-dev.component';
import {AdvResultDevAdvComponent} from './advResult-dev-adv.component';
import {AdvResultService} from './advResult.service';
import {DevDetailComponent} from '../../system/dev/component/dev-detail.component';

@NgModule({
    imports: [
        SharedModule,
        ContentRoutingModule,
        CommonModule
    ],
    declarations: [
        AdvResultAdvComponent,
        AdvResultDevComponent,
        AdvResultAdvDevComponent,
        AdvResultDevAdvComponent
    ],
    entryComponents: [
        AdvResultDevComponent,
        AdvResultAdvDevComponent,
        AdvResultDevAdvComponent
    ],
    providers: [
        AdvResultService
    ]
})
export class AdvResultModule {

}
