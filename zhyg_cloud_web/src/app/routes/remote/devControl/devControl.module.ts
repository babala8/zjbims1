import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {RemoteRoutingModule} from '../remote.routing';
import {DevControlComponent} from './devControl.component';
import {DevControlService} from './devControl.service';
import {CommonModule} from '@angular/common';
import {OrgService} from '../../system/org/org.service';
import {SessionService} from '@core/session.service';
import {FileUploadModule} from 'ng2-file-upload';
import {SoftwareInfoComponent} from './component/softwareInfo.component';
import {HardwareInfoComponent} from './component/hardwareInfo.component';
import {SystemInfoComponent} from './component/systemInfo.component';
import {ProcessInfoComponent} from './component/processInfo.component';
import {StatusInfoComponent} from './component/statusInfo.component';
import {LogInfoComponent} from './component/logInfo.component';



@NgModule({
    imports: [
        SharedModule,
        RemoteRoutingModule,
        CommonModule,
        FileUploadModule
    ],
    declarations: [
        DevControlComponent,
        SoftwareInfoComponent,
        HardwareInfoComponent,
        ProcessInfoComponent,
        SystemInfoComponent,
        StatusInfoComponent,
        LogInfoComponent
    ],
    entryComponents: [
        SoftwareInfoComponent,
        HardwareInfoComponent,
        ProcessInfoComponent,
        SystemInfoComponent,
        StatusInfoComponent,
        LogInfoComponent
    ],
    providers: [
        DevControlService,
        OrgService,
        SessionService
    ]
})
export class DevControlModule {

}
