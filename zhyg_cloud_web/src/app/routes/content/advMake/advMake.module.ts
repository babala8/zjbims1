import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ContentRoutingModule} from '../content.routing';
import {AdvMakeComponent} from './advMake.component';
import {AdvMakeService} from './advMake.service';
import {CommonModule} from '@angular/common';
import {FileUploadModule} from 'ng2-file-upload';
import {AppstoreService} from '../../version/appstore/appstore.service';
import {OrgService} from '../../system/org/org.service';
import {DevService} from '../../system/dev/dev.service';
import {AdvAddComponent} from './advAdd.component';
import {ResourceManageService} from '../resourceManage/resourceManage.service';
import {AdvModifyComponent} from './advModify.component';

@NgModule({
    imports: [
        SharedModule,
        ContentRoutingModule,
        CommonModule,
        FileUploadModule
    ],
    declarations: [
        AdvMakeComponent,
        AdvAddComponent,
        AdvModifyComponent
    ],
    entryComponents: [
        AdvAddComponent,
        AdvModifyComponent
    ],
    providers: [
        AdvMakeService,
        OrgService,
        AppstoreService,
        DevService,
        ResourceManageService
    ]
})

export class AdvMakeModule {

}
