import {NgModule} from '@angular/core';
import {HeaderComponent} from './header.component';
import {HeaderLogoComponent} from './components/logo/logo.component';
import {HeaderMenuComponent} from './components/menu/menu.component';
import {HeaderButtonComponent} from './components/button/button.component';
import {SharedModule} from '@shared/shared.module';
import {HeaderFullScreenComponent} from './components/button/fullscreen.component';
import {HeaderI18nComponent} from './components/button/i18n.component';
import {HeaderThemeComponent} from './components/button/theme.component';
import {HeaderStorageComponent} from './components/button/storage.component';
import {HeaderUserInfoComponent} from "./components/user/user.component";
import {ButtonService} from './components/button/button.service';
import {WebSocketService} from '../../../routes/remote/webSocketService';

const COMPONENTS = [
    HeaderComponent,
    HeaderLogoComponent,
    HeaderMenuComponent,
    HeaderUserInfoComponent,
    HeaderButtonComponent,
    HeaderFullScreenComponent,
    HeaderI18nComponent,
    HeaderThemeComponent,
    HeaderStorageComponent
];


@NgModule({
    imports: [
        SharedModule,
    ],
    declarations: [
        ...COMPONENTS
    ],
    exports: [
        HeaderComponent
    ],
    providers: [
        ButtonService,
        WebSocketService
    ]
})
export class HeaderModule {
}
