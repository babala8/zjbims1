import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {SelfHelpBankComponent} from './selfHelpBank.component';
import {SelfHelpBankService} from './selfHelpBank.service';
import {SelfHelpBankAddComponent} from './component/selfHelpBank-add.component';
import {SelfHelpBankModifyComponent} from './component/selfHelpBank-modify.component';
import {SystemRoutingModule} from '../system.routing';
@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        SelfHelpBankComponent,
        SelfHelpBankAddComponent,
        SelfHelpBankModifyComponent
    ],
    entryComponents: [
        SelfHelpBankAddComponent,
        SelfHelpBankModifyComponent
    ],
    providers: [
        SelfHelpBankService
    ]


})
export class SelfHelpBankModule {

}
