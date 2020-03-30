import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {UnelockTaskComponent} from './unelockTask.component';
import {UnelockTaskService} from './unelockTask.service';
import {ElockRoutingModule} from '../elock.routing';
import {UnelockTaskAddComponent} from './component/unelockTask-add.component';



@NgModule({
    imports: [
        SharedModule,
        ElockRoutingModule
    ],
    declarations: [
        UnelockTaskComponent,
        UnelockTaskAddComponent
    ],
    entryComponents: [
        UnelockTaskAddComponent
    ],
    providers: [
        UnelockTaskService
    ]
})
export class UnelockTaskModule {

}
