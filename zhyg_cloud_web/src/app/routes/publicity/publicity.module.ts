import {NgModule} from '@angular/core';
import {PublicityRoutingModule} from './publicity.routing';
import {DevmanageModule} from './devmanage/devmanage.module';
@NgModule({
    imports: [
        DevmanageModule,
        PublicityRoutingModule
    ],
    providers: [
    ]
})
export class PublicityModule {
    constructor() {
    }
}
