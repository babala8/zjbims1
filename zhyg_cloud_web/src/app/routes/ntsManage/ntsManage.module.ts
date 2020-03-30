import {NgModule} from '@angular/core';

import {VersionModule} from './version/version.module';
import {NtsManageRoutingModule} from './ntsManage.routing';
import {IssueModule} from './issue/issue.module';
import {IssueListModule} from './issueList/issueList.module';
import {SusRegModule} from './susReg/susReg.module';
import {NsnQryTxModule} from './nsnQryTx/nsnQryTx.module';
import {TxQryNsnModule} from './txQryNsn/txQryNsn.module';
import {NsnBlankModule} from './nsnBlank/nsnBlank.module';

@NgModule({
    imports: [
        VersionModule,
        IssueModule,
        IssueListModule,
        SusRegModule,
        NsnQryTxModule,
        TxQryNsnModule,
        NsnBlankModule,
        NtsManageRoutingModule
    ],
    providers: [
    ]
})
export class NtsManageModule {
    constructor() {
    }
}
