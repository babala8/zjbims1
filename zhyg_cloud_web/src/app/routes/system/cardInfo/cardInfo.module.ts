import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {CardInfoComponent} from './cardInfo.component';
import {CardInfoService} from './cardInfo.service';
import {CardInfoAddComponent} from './component/cardInfo-add.component';
import {CardInfoModifyComponent} from './component/cardInfo-modify.component';
import {SystemRoutingModule} from '../system.routing';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        CardInfoComponent,
        CardInfoAddComponent,
        CardInfoModifyComponent
    ],
    entryComponents: [
        CardInfoAddComponent,
        CardInfoModifyComponent
    ],
    providers: [
        CardInfoService
    ]
})
export class CardInfoModule {

}
