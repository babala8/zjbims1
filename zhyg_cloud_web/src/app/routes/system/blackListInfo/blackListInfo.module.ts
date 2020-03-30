import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {SystemRoutingModule} from '../system.routing';
import {BlackListInfoComponent} from './blackListInfo.component';


@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        BlackListInfoComponent,
    ],
    entryComponents: [

    ],
    providers: [

    ]
})
export class BlackListInfoModule {

}
