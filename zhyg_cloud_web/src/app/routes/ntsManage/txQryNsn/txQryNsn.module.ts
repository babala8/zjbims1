import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import {TxQryNsnComponent} from './txQryNsn.component';
import {TxQryNsnService} from './txQryNsn.service';


@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        TxQryNsnComponent,
    ],
    entryComponents: [
    ],
    providers: [
        TxQryNsnService
    ]


})
export class TxQryNsnModule {

}
