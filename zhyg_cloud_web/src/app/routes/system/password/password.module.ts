import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {SystemRoutingModule} from '../system.routing';
import {PasswordComponent} from './password.component';

@NgModule({
    imports: [
        SharedModule,
        SystemRoutingModule
    ],
    declarations: [
        PasswordComponent,
    ]
})
export class PasswordModule {

}
