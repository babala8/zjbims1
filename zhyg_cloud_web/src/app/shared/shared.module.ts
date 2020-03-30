import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {ReactiveFormsModule, FormsModule} from '@angular/forms';
import {RouterModule} from '@angular/router';
// delon
import {NgZorroAntdExtraModule} from 'ng-zorro-antd-extra';
import {AlainThemeModule} from '@zjft/theme';
import {AlainACLModule} from '@zjft/acl';
import {ZORROMODULES, ABCMODULES} from '../delon.module';
// i18n
import {TranslateModule} from '@ngx-translate/core';

import {ContextMenuModule} from 'ngx-contextmenu';
import {AngularSplitModule} from 'angular-split';
import {TreeModule} from 'angular-tree-component';

// your components & directives
import {AceEditorDirective} from '@shared/directives/ace-editor.directive';
import {NzTreeModule} from '@zjft/ng-tree-antd';
import {OrgTreeComponent} from '@shared/component/org-tree.component';
import {PageIframeComponent} from '@shared/component/page-iframe/page.iframe.component';
import {Page2IframeComponent} from '@shared/component/page-iframe/page2.iframe.component';
// region: third libs
const THIRDMODULES = [
    AngularSplitModule,
    TreeModule,
    NzTreeModule,
    ContextMenuModule
];
// endregion

// region: your components & directives
const COMPONENTS = [
    PageIframeComponent,
    Page2IframeComponent,
    OrgTreeComponent
];
const DIRECTIVES = [
    AceEditorDirective
];

// endregion

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        RouterModule,
        ReactiveFormsModule,
        ...ZORROMODULES,
        NgZorroAntdExtraModule,
        AlainThemeModule.forChild(),
        ...ABCMODULES,
        AlainACLModule,
        // third libs
        ...THIRDMODULES,
        ContextMenuModule.forRoot({
            autoFocus: false
        })
    ],
    declarations: [
        // your components
        ...COMPONENTS,
        ...DIRECTIVES
    ],
    exports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        ...ZORROMODULES,
        NgZorroAntdExtraModule,
        AlainThemeModule,
        ...ABCMODULES,
        AlainACLModule,
        // i18n
        TranslateModule,
        // third libs
        ...THIRDMODULES,
        // your components
        ...COMPONENTS,
        ...DIRECTIVES
    ]
})
export class SharedModule {
}
