import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {BusinessAnalysisComponent} from './businessAnalysis.component';
import {BusinessAnalysisService} from './businessAnalysis.service';
import {DecisionRoutingModule} from '../decision.routing';

@NgModule({
    imports: [
        SharedModule,
        DecisionRoutingModule
    ],
    declarations: [
        BusinessAnalysisComponent,
    ],
    providers: [
        BusinessAnalysisService
    ]
})
export class BusinessAnalysisModule {

}
