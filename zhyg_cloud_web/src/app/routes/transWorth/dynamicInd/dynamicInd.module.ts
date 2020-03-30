import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {TransWorthRoutingModule} from '../transWorth.routing';
import {DynamicIndComponent} from './dynamicInd.component';
import {DynamicIndService} from './dynamicInd.service';
import {DynamicIndAddComponent} from './component/dynamicInd-add.component';
import {DynamicIndModifyComponent} from './component/dynamicInd-modify.component';

@NgModule({
    imports: [
        TransWorthRoutingModule,
        SharedModule
    ],
    declarations: [
        DynamicIndComponent,
        DynamicIndAddComponent,
        DynamicIndModifyComponent
    ],
    entryComponents: [
        DynamicIndAddComponent,
        DynamicIndModifyComponent
    ],
    providers: [
        DynamicIndService
    ]
})

export class DynamicIndModule {

}
