import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {SystemRoutingModule} from '../system.routing';
import {MyApplyComponent} from './myApply.component';
import {MyApplyService} from './myApply.service';
import {UserRefillComponent} from './component/user-refill.component';
import {DevRefillComponent} from './component/dev-refill.component';
import {DevRedelComponent} from './component/dev-redel.component';
import {UserRedelComponent} from './component/user-redel.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        MyApplyComponent,
        UserRefillComponent,
        DevRefillComponent,
        DevRedelComponent,
        UserRedelComponent
    ],
    entryComponents: [
        UserRefillComponent,
        DevRefillComponent,
        DevRedelComponent,
        UserRedelComponent
    ],
    providers: [
        MyApplyService,
    ]
})
export class MyApplyModule {

}
