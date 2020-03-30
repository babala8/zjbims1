import {NgModule} from '@angular/core';
import {SysMenuService} from '../system/menu/menu.service';
import {SharedModule} from '@shared/shared.module';
import {returnManageRoutingModule} from './returnManage.routing';
import {CardCollectionTaskComponent} from './cardCollectionTask/cardCollectionTask.component';
import {AssociatedAccountComponent} from './associtedAccount/associatedAccount.component';
import {CardReplaceComponent} from './cardReplace/cardReplace.component';

@NgModule({
    imports: [
        returnManageRoutingModule,
        SharedModule,
    ],
    declarations: [
        CardCollectionTaskComponent,
        AssociatedAccountComponent,
        CardReplaceComponent
    ],
    providers: [
        SysMenuService
    ]
})
export class ReturnManageModule {
    constructor() {
    }
}
