import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {BulletinComponent} from './bulletin.component';
import {BulletinService} from './bulletin.service';
import {BulletinAddComponent} from './component/bulletin-add.component';
import {BulletinModifyComponent} from './component/bulletin-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {BulletinDetailComponent} from './component/bulletin-detail.component';
import {BulletinDetailLogComponent} from './component/bulletin-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        BulletinComponent,
        BulletinAddComponent,
        BulletinModifyComponent,
        BulletinDetailComponent,
        BulletinDetailLogComponent
    ],
    entryComponents: [
        BulletinAddComponent,
        BulletinModifyComponent,
        BulletinDetailComponent,
        BulletinDetailLogComponent
    ],
    providers: [
        BulletinService
    ]


})
export class BulletinModule {

}
