import {NgModule} from '@angular/core';
import {SysMenuService} from '../system/menu/menu.service';
import {ContentRoutingModule} from './content.routing';
import {AdvertisementSpaceModule} from './advertisementSpace/advertisementSpace.module';
import {AdvValidModule} from './advInvalid/advValid.module';
import {AdvResultModule} from './advValidResult/advResult.module';
import {ResourceManageModule} from './resourceManage/resourceManage.module';
import {AdvMakeModule} from './advMake/advMake.module';
import {CatalogService} from '../system/catalog/catalog.service';
import {VendorService} from '../system/vendor/vendor.service';
import {TypeService} from '../system/type/type.service';
import {DevServiceManagerService} from '../system/devServiceManager/devServiceManager.service';

@NgModule({
    imports: [
        AdvertisementSpaceModule,
        AdvValidModule,
        AdvResultModule,
        ResourceManageModule,
        ContentRoutingModule,
        AdvMakeModule,
    ],
    providers: [
        SysMenuService,
        CatalogService,
        VendorService,
        TypeService,
        DevServiceManagerService
    ]
})
export class ContentModule {
    constructor() {
    }
}
