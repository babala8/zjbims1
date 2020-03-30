import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {DevWorkTimeComponent} from './devWorkTime.component';
import {DevWorkTimeService} from './devWorkTime.service';
import {DevWorkTimeModifyComponent} from './component/devWorkTime-modify.component';
import {SystemRoutingModule} from '../system.routing';


@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        DevWorkTimeComponent,
        DevWorkTimeModifyComponent,
    ],
    entryComponents: [
        DevWorkTimeModifyComponent,
    ],
    providers: [
        DevWorkTimeService
    ]
})
export class DevWorkTimeModule {

}
