import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ContentRoutingModule} from '../content.routing';
import {AdvValidComponent} from './advValid.component';
import {AdvValidService} from './advValid.service';
import {CommonModule} from '@angular/common';
import {AdvValidConfigureComponent} from './advValid-configure.component';
import {AdvIssueComponent} from './advIssue.component';

@NgModule({
    imports: [
        SharedModule,
        ContentRoutingModule,
        CommonModule
    ],
    declarations: [
        AdvValidComponent,
        AdvValidConfigureComponent,
        AdvIssueComponent
    ],
    entryComponents: [
        AdvValidConfigureComponent,
        AdvIssueComponent
    ],
    providers: [
        AdvValidService
    ]
})
export class AdvValidModule {

}
