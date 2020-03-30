import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {TypeComponent} from './type.component';
import {TypeService} from './type.service';
import {TypeAddComponent} from './component/type-add.component';
import {TypeModifyComponent} from './component/type-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {TypeDetailLogComponent} from './component/type-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,

    ],
    declarations: [
        TypeComponent,
        TypeAddComponent,
        TypeModifyComponent,
        TypeDetailLogComponent,    ],
    entryComponents: [
        TypeAddComponent,
        TypeModifyComponent,
        TypeDetailLogComponent
    ],
    providers: [
        TypeService
    ]
})
export class TypeModule {

}
