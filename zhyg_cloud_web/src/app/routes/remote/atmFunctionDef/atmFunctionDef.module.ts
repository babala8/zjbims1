import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {RemoteRoutingModule} from '../remote.routing';
import {CommonModule} from '@angular/common';
import {OrgService} from '../../system/org/org.service';
import {SessionService} from '@core/session.service';
import {AtmFunctionDefComponent} from './atmFunctionDef.component';
import {DevControlService} from '../devControl/devControl.service';
import {DevService} from '../../system/dev/dev.service';
import {AtmFunctionDefService} from './atmFunctionDef.service';
import {AtmFunctionDefAddComponent} from './component/atmFunctionDef-add.component';

@NgModule({
    imports: [
        SharedModule,
        RemoteRoutingModule,
        CommonModule
    ],
    declarations: [
        AtmFunctionDefComponent,
        AtmFunctionDefAddComponent
    ],
    entryComponents: [
        AtmFunctionDefAddComponent
    ],
    providers: [
        AtmFunctionDefService,
        DevControlService,
        OrgService,
        SessionService,
        DevService
    ]
})
export class AtmFunctionDefModule {

}
