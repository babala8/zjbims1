import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import {IssueComponent} from './issue.component';
import {IssueService} from './issue.service';


@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        IssueComponent,
    ],
    entryComponents: [
    ],
    providers: [
        IssueService
    ]


})
export class IssueModule {

}
