import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {NzMenuModule} from 'ng-zorro-antd';
import {FormsModule} from '@angular/forms';
import {MonitorRoutingModule} from '../monitor.routing';
import {PjsTermMonitorComponent} from './pjsTermMonitor.component';
import {PjsTermMonitorService} from './pjsTermMonitor.service';


@NgModule({
    imports: [
        SharedModule,
        NzMenuModule,
        FormsModule,
        MonitorRoutingModule
    ],
    declarations: [
        PjsTermMonitorComponent,
    ],
    entryComponents: [
    ],
    providers: [
        PjsTermMonitorService
    ]
})
export class PjsTermMonitorModule {

}
