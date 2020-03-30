import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {AppstoreComponent} from './appstore.components';
import {VersionRoutingModule} from '../version.routing';
import {AppstoreService} from './appstore.service';
import {AppAddComponent} from './component/app-add.component';
import {AppModifyComponent} from './component/app-modify.component';
import {FileUploadModule} from 'ng2-file-upload';
import {CommonModule} from '@angular/common';

@NgModule({
    imports: [
        SharedModule,
        VersionRoutingModule,
        CommonModule,
        FileUploadModule
    ],
    declarations: [
        AppstoreComponent,
        AppAddComponent,
        AppModifyComponent,
    ],
    providers: [
        AppstoreService
    ],
    entryComponents: [
    ]
})
export class AppstoreModule {

}
