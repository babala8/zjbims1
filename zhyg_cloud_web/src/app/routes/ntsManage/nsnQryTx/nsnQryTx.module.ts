import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import {NsnQryTxService} from './nsnQryTx.service';
import {NsnQryTxComponent} from './nsnQryTx.component';


@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        NsnQryTxComponent,
    ],
    entryComponents: [
    ],
    providers: [
        NsnQryTxService
    ]


})
export class NsnQryTxModule {

}
