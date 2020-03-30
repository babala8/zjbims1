import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {SysParamComponent} from './sysParam.component';
import {SystemRoutingModule} from '../system.routing';
import {SysParamService} from './sysParam.service';
import {CaseCatalogModifyComponent} from './component/caseCatalog-modify.component';
import {CaseCatalogDetailLogComponent} from './component/caseCatalog-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule
    ],
    declarations: [
        SysParamComponent,
        CaseCatalogModifyComponent,
        CaseCatalogDetailLogComponent,
    ],
    entryComponents: [
        CaseCatalogModifyComponent,
        CaseCatalogDetailLogComponent
    ],
    providers: [
        SysParamService
    ]
})
export class SysParamModule {

}
