import {NgModule} from '@angular/core';
import {SysMenuService} from '../system/menu/menu.service';
import {BusinessComponent} from './business/business.component';
import {BusinessConfigComponent} from './businessConfig/businessConfig.component';
import {DevManagerComponent} from './devManager/devManager.component';
import {ReserveSearchComponent} from './reserveSearch/reserveSearch.component';
import {CalldevRoutingModule} from './calldev.routing';
import {SharedModule} from '@shared/shared.module';

@NgModule({
    imports: [
        CalldevRoutingModule,
        SharedModule,
    ],
    declarations: [
        BusinessComponent,
        BusinessConfigComponent,
        DevManagerComponent,
        ReserveSearchComponent,
    ],
    providers: [
        SysMenuService
    ]
})
export class CalldevModule {
    constructor() {
    }
}
