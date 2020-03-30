import {NgModule} from '@angular/core';
import {ElockRoutingModule} from './elock.routing';
import {ElockInfoModule} from './elockInfo/elockInfo.module';
import {UnelockTaskModule} from './unelockTask/unelockTask.module';
import {SysMenuService} from '../system/menu/menu.service';



@NgModule({
    imports: [
        ElockInfoModule,
        UnelockTaskModule,
        ElockRoutingModule
    ],
    providers: [
        SysMenuService
    ]
})
export class ElockModule {
    constructor() {
    }
}
