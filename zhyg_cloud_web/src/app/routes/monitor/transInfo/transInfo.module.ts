import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {TransInfoComponent} from './transInfo.component';
import {TransInfoService} from './transInfo.service';
import {CommonModule} from '@angular/common';
import {OrgService} from '../../system/org/org.service';
import {SessionService} from '@core/session.service';
import {MonitorRoutingModule} from '../monitor.routing';
import {DateStringFormatPipe} from './dateStringFormat.pipe';

@NgModule({
    imports: [
        SharedModule,
        MonitorRoutingModule,
        CommonModule
    ],
    declarations: [
        TransInfoComponent,
        DateStringFormatPipe
    ],
    providers: [
        TransInfoService,
        OrgService,
        SessionService
    ]
})
export class TransInfoModule {

}
