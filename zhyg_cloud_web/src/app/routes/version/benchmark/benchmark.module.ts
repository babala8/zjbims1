import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {VersionRoutingModule} from '../version.routing';
import {BenchmarkComponent} from './benchmark.components';
import {BenchmarkAddComponent} from './component/benchmark-add.component';
import {BenchmarkDeployComponent} from './component/benchmark-deploy.component';
import {BenchmarkService} from './benchmark.service';
import {BenchmarkAllocComponent} from './component/benchmark-alloc.component';
import {BenchmarkModifyComponent} from './component/benchmark-modify.component';
import {BenchmarkOperationComponent} from './component/benchmark-operation.component';
import {BenchmarkDetailsComponent} from './component/benchmark-Details.component';

@NgModule({
    imports: [
        SharedModule,
        VersionRoutingModule,
    ],
    declarations: [
        BenchmarkComponent,
        BenchmarkAddComponent,
        BenchmarkDeployComponent,
        BenchmarkAllocComponent,
        BenchmarkModifyComponent,
        BenchmarkOperationComponent,
        BenchmarkDetailsComponent
    ],
    entryComponents: [
        BenchmarkDeployComponent,
        BenchmarkModifyComponent
    ],
    providers: [
        BenchmarkService
    ]
})
export class BenchmarkModule {

}
