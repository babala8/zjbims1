import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';

import {SystemRoutingModule} from '../system.routing';
import {GlobalCfgComponent} from './globalCfg.component';
import {GlobalCfgService} from './globalCfg.service';
import {GlobalCfgModifyComponent} from './component/globalCfg-modify.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        GlobalCfgComponent,
        GlobalCfgModifyComponent
    ],
    entryComponents: [
        GlobalCfgModifyComponent
    ],
    providers: [
        GlobalCfgService
    ]
})
export class GlobalCfgModule {

}
