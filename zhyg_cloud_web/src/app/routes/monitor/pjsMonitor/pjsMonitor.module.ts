import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {NzMenuModule} from 'ng-zorro-antd';
import {FormsModule} from '@angular/forms';
import {PjsMonitorService} from './pjsMonitor.service';
import {PjsMonitorComponent} from './pjsMonitor.component';
import {MonitorRoutingModule} from '../monitor.routing';
import {PjsDetailComponent} from './component/pjsDetail.component';


@NgModule({
    imports: [
        SharedModule,
        NzMenuModule,
        FormsModule,
        MonitorRoutingModule
    ],
    declarations: [
        PjsDetailComponent,
        PjsMonitorComponent
    ],
    entryComponents: [
        PjsDetailComponent
    ],
    providers: [
        PjsMonitorService
    ]
})
export class PjsMonitorModule {

}
