import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {NzMenuModule} from 'ng-zorro-antd';
import {FormsModule} from '@angular/forms';
import {PjsLogMonitorService} from './pjsLogMonitor.service';
import {PjsLogMonitorComponent} from './pjsLogMonitor.component';
import {MonitorRoutingModule} from '../monitor.routing';
import {PjsLogDetailComponent} from './component/pjsLogDetail.component';


@NgModule({
    imports: [
        SharedModule,
        NzMenuModule,
        FormsModule,
        MonitorRoutingModule
    ],
    declarations: [
        PjsLogDetailComponent,
        PjsLogMonitorComponent
    ],
    entryComponents: [
        PjsLogDetailComponent
    ],
    providers: [
        PjsLogMonitorService
    ]
})
export class PjsLogMonitorModule {

}
