import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {NsnBlankService} from './nsnBlank.service';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import {NsnBlankComponent} from './nsnBlank.component';



@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        NsnBlankComponent
    ],
    entryComponents: [
    ],
    providers: [
        NsnBlankService
    ]


})
export class NsnBlankModule {

}
