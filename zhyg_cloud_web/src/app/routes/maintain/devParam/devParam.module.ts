import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import  {MaintainRoutingModule} from '../maintain.routing';
import  {DevParamComponent} from './devParam.component';
import {DevParamService} from './devParam.service';

@NgModule({
    imports: [
        SharedModule,
        MaintainRoutingModule,
    ],
    declarations: [
        DevParamComponent,
    ],
    entryComponents: [
    ],
    providers: [
        DevParamService
    ]


})
export class DevParamModule {

}
