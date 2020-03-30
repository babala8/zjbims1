import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {ContentRoutingModule} from '../content.routing';
import {AdvertisementSpaceComponent} from './advertisementSpace.component';
import {AdvertisementSpaceService} from './advertisementSpace.service';
import {AdvertisementAddSpaceComponent} from './component/advertisementSpace-add.component';
import {AdvertisementModifySpaceComponent} from './component/advertisementSpace-modify.component';

@NgModule({
    imports: [
        SharedModule,
        ContentRoutingModule
    ],
    declarations: [
        AdvertisementSpaceComponent,
        AdvertisementAddSpaceComponent,
        AdvertisementModifySpaceComponent
    ],
    entryComponents: [
        AdvertisementAddSpaceComponent,
        AdvertisementModifySpaceComponent
    ],
    providers: [
        AdvertisementSpaceService
    ]
})
export class AdvertisementSpaceModule {

}
