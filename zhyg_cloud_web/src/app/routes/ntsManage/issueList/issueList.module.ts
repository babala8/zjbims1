import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import  {IssueListComponent} from './issueList.component';
import {IssueListService} from './issueList.service';


@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        IssueListComponent,
    ],
    entryComponents: [
    ],
    providers: [
        IssueListService
    ]


})
export class IssueListModule {

}
