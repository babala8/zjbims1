import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {BankComponent} from './bank.component';
import {BankService} from './bank.service';
import {BankAddComponent} from './component/bank-add.component';
import {BankModifyComponent} from './component/bank-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {BankDetailLogComponent} from './component/bank-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        BankComponent,
        BankAddComponent,
        BankModifyComponent,
        BankDetailLogComponent
    ],
    entryComponents: [
        BankAddComponent,
        BankModifyComponent,
        BankDetailLogComponent
    ],
    providers: [
        BankService
    ]
})
export class BankModule {

}
