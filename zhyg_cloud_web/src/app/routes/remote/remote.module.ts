import {NgModule} from '@angular/core';
import {RemoteRoutingModule} from './remote.routing';
import {DevControlModule} from './devControl/devControl.module';
import {ControlResultModule} from './controlResult/controlResult.module';
import {SysMenuService} from '../system/menu/menu.service';
import {WebSocketService} from './webSocketService';
import {AtmFunctionModule} from './atmFunction/atmFunction.module';
import {AtmFunctionDefModule} from './atmFunctionDef/atmFunctionDef.module';

@NgModule({
    imports: [
        DevControlModule,
        ControlResultModule,
        RemoteRoutingModule,
        AtmFunctionModule,
        AtmFunctionDefModule
    ],
    providers: [
        SysMenuService,
        WebSocketService
    ]
})
export class RemoteModule {
    constructor() {
    }
}
