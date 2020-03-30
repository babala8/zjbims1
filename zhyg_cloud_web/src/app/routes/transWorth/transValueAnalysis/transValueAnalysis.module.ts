import {NgModule} from '@angular/core';
import {TransWorthRoutingModule} from '../transWorth.routing';
import {TransValueAnalysisService} from './transValueAnalysis.service';
import {TransValueAnalysisComponent} from './transValueAnalysis.component';
import {SharedModule} from '@shared/shared.module';
import {NgxEchartsModule} from 'ngx-echarts';
@NgModule({
    imports: [
        SharedModule,
        NgxEchartsModule,
        TransWorthRoutingModule
    ],
    declarations: [
        TransValueAnalysisComponent
    ],
    entryComponents: [
    ],
    providers: [
        TransValueAnalysisService
    ]
})
export class TransValueAnalysisModule {

}
