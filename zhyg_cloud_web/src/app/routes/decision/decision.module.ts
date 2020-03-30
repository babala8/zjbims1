import {NgModule} from '@angular/core';
import {TargetManagementModule} from './target/targetManagement.module';
import {SysMenuService} from '../system/menu/menu.service';
import {DecisionRoutingModule} from './decision.routing';
import {BusinessAnalysisModule} from './business/businessAnalysis.module';

@NgModule({
    imports: [
        TargetManagementModule,
        BusinessAnalysisModule,
        DecisionRoutingModule,
    ],
    providers: [
        SysMenuService
    ]
})
export class DecisionModule {
    constructor() {
    }
}
