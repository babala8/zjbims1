import {NgModule, Optional, SkipSelf} from '@angular/core';
import {throwIfAlreadyLoaded} from './module-import-guard';

import {I18NService} from './i18n/i18n.service';
import {AuthService} from '@core/auth.service';
import {SessionService} from '@core/session.service';
import {LoginGuard} from '@core/guard/login-guard.service';
import {AuthGuard} from '@core/guard/auth-guard.service';
import {NgZorroAntdModule} from 'ng-zorro-antd';


@NgModule({
    providers: [
        LoginGuard,
        AuthGuard,
        AuthService,
        SessionService,
        I18NService
    ],
    imports: [
        NgZorroAntdModule.forRoot({ extraFontName: 'anticon', extraFontUrl: '/assets/fonts/iconfont' })
    ]
})
export class CoreModule {
    constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
        throwIfAlreadyLoaded(parentModule, 'CoreModule');
    }
}
