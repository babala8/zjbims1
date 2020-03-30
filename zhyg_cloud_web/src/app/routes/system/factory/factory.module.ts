import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {FactoryComponent} from './factory.component';
import {FactoryService} from './factory.service';
import {FactoryAddComponent} from './component/factory-add.component';
import {FactoryModifyComponent} from './component/factory-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {FactoryDetailLogComponent} from './component/factory-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        FactoryComponent,
        FactoryAddComponent,
        FactoryModifyComponent,
        FactoryDetailLogComponent
    ],
    entryComponents: [
        FactoryAddComponent,
        FactoryModifyComponent,
        FactoryDetailLogComponent
    ],
    providers: [
        FactoryService
    ]
})
export class FactoryModule {

}
