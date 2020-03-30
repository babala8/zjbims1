import {NgModule} from '@angular/core';
import {SysMenuService} from '../system/menu/menu.service';
import {VersionRoutingModule} from './version.routing';
import {AppstoreModule} from './appstore/appstore.module';
import {BenchmarkModule} from './benchmark/benchmark.module';
import {ParameterModule} from './parameter/parameter.module';
import {AppResultModule} from './appValidResult/appResult.module';
import {OrgService} from '../system/org/org.service';
import {CatalogService} from '../system/catalog/catalog.service';
import {VendorService} from '../system/vendor/vendor.service';
import {TypeService} from '../system/type/type.service';
import {DevServiceManagerService} from '../system/devServiceManager/devServiceManager.service';

@NgModule({
    imports: [
        AppstoreModule,
        BenchmarkModule,
        ParameterModule,
        VersionRoutingModule,
        AppResultModule
    ],
    providers: [
        SysMenuService,
        OrgService,
        VendorService,
        TypeService,
        CatalogService,
        DevServiceManagerService
    ]
})
export class VersionModule {
    constructor() {
    }
}
