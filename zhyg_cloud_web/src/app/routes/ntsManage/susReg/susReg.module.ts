import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import {SusRegComponent} from './susReg.component';
import {SusRegService} from './susReg.service';


@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        SusRegComponent,
    ],
    entryComponents: [
    ],
    providers: [
        SusRegService
    ]


})
export class SusRegModule {

}
