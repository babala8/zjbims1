import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {SystemRoutingModule} from '../system.routing';
import {MyAuditComponent} from './myAudit.component';
import {MyAuditService} from './myAudit.service';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        MyAuditComponent,
    ],
    providers: [
        MyAuditService,
    ]
})
export class MyAuditModule {

}
