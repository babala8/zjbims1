import {NgModule} from '@angular/core';
import {TransWorthRoutingModule} from './transWorth.routing';
import {DynamicIndModule} from './dynamicInd/dynamicInd.module';
import {TransValueAnalysisModule} from './transValueAnalysis/transValueAnalysis.module';
import {StaticIndModule} from './staticInd/staticInd.module';

@NgModule({
    imports: [
        TransWorthRoutingModule,
        DynamicIndModule,
        StaticIndModule,
        TransValueAnalysisModule
    ],
    providers: [
    ]
})
export class TransWorthModule {
    constructor() {
    }
}
