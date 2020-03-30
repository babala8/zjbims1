import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {LogComponent} from './log.component';
import {LogService} from './log.service';
import {SystemRoutingModule} from '../system.routing';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        LogComponent,
    ],
    providers: [
        LogService
    ]
})
export class LogModule {

}
