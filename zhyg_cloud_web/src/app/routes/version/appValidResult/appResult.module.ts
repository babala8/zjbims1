import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {VersionRoutingModule} from '../version.routing';
import {CommonModule} from '@angular/common';
import {AppResultDevComponent} from './appResult-dev.component';
import {AppResultDevAppComponent} from './appResult-dev-app.component';
import {AppResultService} from './appResult.service';
import {DevService} from '../../system/dev/dev.service';

@NgModule({
    imports: [
        SharedModule,
        VersionRoutingModule,
        CommonModule
    ],
    declarations: [
        AppResultDevComponent,
        AppResultDevAppComponent
    ],
    providers: [
        AppResultService,
        DevService
    ]
})
export class AppResultModule {

}
