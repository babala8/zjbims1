import {NgModule} from '@angular/core';
import {SharedModule} from '@shared/shared.module';

import {LayoutDefaultComponent} from './default.component';
import {HeaderComponent} from './header/header.component';
import {SidebarComponent} from './sidebar/sidebar.component';
import {HeaderSearchComponent} from './header/components/search.component';
import {HeaderThemeComponent} from './header/components/theme.component';
import {HeaderNotifyComponent} from './header/components/notify.component';
import {HeaderTaskComponent} from './header/components/task.component';
import {HeaderIconComponent} from './header/components/icon.component';
import {HeaderFullScreenComponent} from './header/components/fullscreen.component';
import {HeaderI18nComponent} from './header/components/i18n.component';
import {HeaderStorageComponent} from './header/components/storage.component';
import {HeaderUserComponent} from './header/components/user.component';

const COMPONENTS = [
    LayoutDefaultComponent,
    HeaderComponent,
    SidebarComponent
];

const HEADERCOMPONENTS = [
    HeaderSearchComponent,
    HeaderNotifyComponent,
    HeaderTaskComponent,
    HeaderIconComponent,
    HeaderFullScreenComponent,
    HeaderThemeComponent,
    HeaderI18nComponent,
    HeaderStorageComponent,
    HeaderUserComponent
];


@NgModule({
    imports: [SharedModule],
    providers: [],
    declarations: [
        ...COMPONENTS,
        ...HEADERCOMPONENTS,
    ],
    exports: [
        ...COMPONENTS,
    ]
})
export class LayoutModule {
}
