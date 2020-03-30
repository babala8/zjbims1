import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {DevResponsibleComponent} from './devResponsible.compoment';
import {DevResponsibleService} from './devResponsible.service';
import {SystemRoutingModule} from '../system.routing';
import {DevResponsibleManagerComponent} from './component/devResponsible-manager.component';
import {DevResponsibleDetailComponent} from './component/devResponsible-detail.component';
import {DevResponsibleOrgComponent} from './component/devResponsible-org.component';
import {TransferComponent} from './component/transfer.component';
import {DevManagerComponent} from './component/devResponsible-devmanager.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        DevResponsibleComponent,
        DevResponsibleManagerComponent,
        DevResponsibleDetailComponent,
        DevResponsibleOrgComponent,
        TransferComponent,
        DevManagerComponent
    ],
    entryComponents: [
        DevResponsibleManagerComponent,
        DevResponsibleDetailComponent,
        DevResponsibleOrgComponent,
        TransferComponent,
        DevManagerComponent

    ],
    providers: [
        DevResponsibleService
    ]
})
export class DevResponsibleModule {

}
