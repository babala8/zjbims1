import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ElockInfoComponent} from './elockInfo.component';
import {ElockInfoService} from './elockInfo.service';
import {ElockRoutingModule} from '../elock.routing';
import {ElockAddComponent} from './component/elock-add.component';


@NgModule({
    imports: [
        SharedModule,
        ElockRoutingModule
    ],
    declarations: [
        ElockInfoComponent,
        ElockAddComponent
    ],
    entryComponents: [
        ElockAddComponent
    ],
    providers: [
        ElockInfoService
    ]
})
export class ElockInfoModule {

}
