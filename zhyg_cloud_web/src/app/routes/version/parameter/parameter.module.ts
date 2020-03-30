import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {VersionRoutingModule} from '../version.routing';
import {ParameterComponent} from './parameter.components';
import {ParameterService} from './parameter.service';
import {Validators} from '@angular/forms';
import {HttpResponse} from '@angular/common/http';

@NgModule({
    imports: [
        SharedModule,
        VersionRoutingModule,
    ],
    declarations: [
        ParameterComponent,
    ],
    entryComponents: [
    ],
    providers: [
        ParameterService
    ]
})
export class ParameterModule {

}
