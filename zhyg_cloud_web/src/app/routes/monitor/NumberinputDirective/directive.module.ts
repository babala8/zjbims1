import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';
import {CommonModule} from '@angular/common';
import {NumberinputDirective} from './numberinput.directive';


@NgModule({
    imports: [
        SharedModule,
        CommonModule,
    ],
    declarations: [
        NumberinputDirective
    ],
    exports: [ // 使引用该模块的类可以使用该指令
        NumberinputDirective
    ],
    entryComponents: [
    ],
    providers: [

    ]
})
export class DirectiveModule {

}
