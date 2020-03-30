import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {VendorComponent} from './vendor.component';
import {VendorService} from './vendor.service';
import {VendorAddComponent} from './component/vendor-add.component';
import {VendorModifyComponent} from './component/vendor-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {VendorDetailLogComponent} from './component/vendor-detail-log.component';
// import {CaseCatalogDetailLogComponent} from '.component/caseCatalog-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        VendorComponent,
        VendorAddComponent,
        VendorModifyComponent,
        VendorDetailLogComponent
    ],
    entryComponents: [
        VendorAddComponent,
        VendorModifyComponent,
        VendorDetailLogComponent
    ],
    providers: [
        VendorService
    ]
})
export class VendorModule {

}
