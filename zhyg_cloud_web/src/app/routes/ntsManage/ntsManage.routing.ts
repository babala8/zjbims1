import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {VersionComponent} from './version/version.component';
import {IssueComponent} from './issue/issue.component';
import {IssueListComponent} from './issueList/issueList.component';
import {SusRegComponent} from './susReg/susReg.component';
import {NsnQryTxComponent} from './nsnQryTx/nsnQryTx.component';
import {TxQryNsnComponent} from './txQryNsn/txQryNsn.component';
import {NsnBlankComponent} from './nsnBlank/nsnBlank.component';

const routes: Routes = [
    {
        path: 'version',
        component: VersionComponent,
        data: {text: '冠字号版本管理'}
    },
    {
        path: 'issue',
        component: IssueComponent,
        data: {text: '冠字号黑名单下发'}
    },
    {
        path: 'issueList',
        component: IssueListComponent,
        data: {text: '黑名单下发记录'}
    },
    {
        path: 'susReg',
        component: SusRegComponent,
        data: {text: '黑名单可疑规则'}
    },
    {
        path: 'nsnQryTx',
        component: NsnQryTxComponent,
        data: {text: '冠字号查交易'}
    },
    {
        path: 'txQryNsn',
        component: TxQryNsnComponent,
        data: {text: '交易查冠字号'}
    },
    {
        path: 'blank',
        component: NsnBlankComponent,
        data: {text: '黑名单配置'}
    },
];

export const NtsManageRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
