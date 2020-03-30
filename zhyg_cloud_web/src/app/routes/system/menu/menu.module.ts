import {NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {MenuDefineComponent} from './define/menu-define.component';
import {NgJsonEditorModule} from 'ang-jsoneditor';

@NgModule({
    imports: [
        SharedModule,
        NgJsonEditorModule,
    ],
    declarations: [
        MenuDefineComponent,
    ],
    schemas: [NO_ERRORS_SCHEMA],
    entryComponents: [
        MenuDefineComponent
    ]
})
export class MenuModule {

}
