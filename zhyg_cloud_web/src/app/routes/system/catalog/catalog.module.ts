import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';
import {CatalogComponent} from './catalog.component';
import {CatalogService} from './catalog.service';
import {CatalogAddComponent} from './component/catalog-add.component';
import {CatalogModifyComponent} from './component/catalog-modify.component';
import {SystemRoutingModule} from '../system.routing';
import {CatalogDetailLogComponent} from './component/catalog-detail-log.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        CatalogComponent,
        CatalogAddComponent,
        CatalogModifyComponent,
        CatalogDetailLogComponent
    ],
    entryComponents: [
        CatalogAddComponent,
        CatalogModifyComponent,
        CatalogDetailLogComponent
    ],
    providers: [
        CatalogService
    ]
})
export class CatalogModule {

}
