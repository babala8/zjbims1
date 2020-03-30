import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ContentRoutingModule} from '../content.routing';
import {ResourceManageComponent} from './resourceManage.component';
import {ResourceManageService} from './resourceManage.service';
import {ResourceAddComponent} from './component/resource-add.component';
import {CommonModule} from '@angular/common';
import {FileUploadModule} from 'ng2-file-upload';
import {ResourceModifyComponent} from './component/resource-modify.component';

@NgModule({
    imports: [
        SharedModule,
        ContentRoutingModule,
        CommonModule,
        FileUploadModule
    ],
    declarations: [
        ResourceManageComponent,
        ResourceAddComponent,
        ResourceModifyComponent
    ],
    entryComponents: [
        ResourceAddComponent,
        ResourceModifyComponent
    ],
    providers: [
        ResourceManageService
    ]
})
export class ResourceManageModule {

}
