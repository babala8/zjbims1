import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {VersionService} from './version.service';
import  {NtsManageRoutingModule} from '../ntsManage.routing';
import {VersionComponent} from './version.component';


@NgModule({
    imports: [
        SharedModule,
        NtsManageRoutingModule,
    ],
    declarations: [
        VersionComponent,
    ],
    entryComponents: [
    ],
    providers: [
        VersionService
    ]


})
export class VersionModule {

}
