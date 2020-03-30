import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';

import {SystemRoutingModule} from '../system.routing';
import {NotifyModelComponent} from './notifyModel.component';
import {NotifyModelService} from './notifyModel.service';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        NotifyModelComponent
    ],
    providers: [
        NotifyModelService
    ]
})
export class NotifyModelModule {

}
