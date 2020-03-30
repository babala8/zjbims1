import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {RemoteRoutingModule} from '../remote.routing';
import {CommonModule} from '@angular/common';
import {OrgService} from '../../system/org/org.service';
import {SessionService} from '@core/session.service';
import {AtmFunctionComponent} from './atmFunction.component';
import {DevControlService} from '../devControl/devControl.service';
import {DevService} from '../../system/dev/dev.service';
import {AtmFunctionService} from './atmFunction.service';
import {AtmFunctionDetailComponent} from './component/atmFunctionDetail.component';

@NgModule({
    imports: [
        SharedModule,
        RemoteRoutingModule,
        CommonModule
    ],
    declarations: [
        AtmFunctionComponent,
        AtmFunctionDetailComponent,
    ],
    entryComponents: [
        AtmFunctionDetailComponent
    ],
    providers: [
        AtmFunctionService,
        DevControlService,
        OrgService,
        SessionService,
        DevService
    ]
})
export class AtmFunctionModule {

}
