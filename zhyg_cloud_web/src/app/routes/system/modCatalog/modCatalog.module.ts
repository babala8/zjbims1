import {NgModule} from '@angular/core';
import {SharedModule} from '../../../shared/shared.module';

import {SystemRoutingModule} from '../system.routing';
import {ModCatalogComponent} from './modCatalog.component';
import {ModCatalogService} from './modCatalog.service';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule,
    ],
    declarations: [
        ModCatalogComponent
    ],
    providers: [
        ModCatalogService
    ]
})
export class ModCatalogModule {

}
