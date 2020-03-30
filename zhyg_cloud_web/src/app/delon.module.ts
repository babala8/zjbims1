/**
 * 进一步对基础模块的导入提炼
 * 有关模块注册指导原则请参考：https://github.com/cipchk/ng-alain/issues/180
 */
import {NgModule, Optional, SkipSelf, ModuleWithProviders} from '@angular/core';
import {throwIfAlreadyLoaded} from '@core/module-import-guard';

// region: zorro modules

import {
    // LoggerModule,
    // NzLocaleModule,
    NzButtonModule,
    NzAlertModule,
    NzBadgeModule,
    // NzCalendarModule,
    NzCascaderModule,
    NzCheckboxModule,
    NzDatePickerModule,
    NzFormModule,
    NzInputModule,
    NzInputNumberModule,
    NzGridModule,
    NzMessageModule,
    NzModalModule,
    NzNotificationModule,
    NzPaginationModule,
    NzPopconfirmModule,
    NzPopoverModule,
    NzRadioModule,
    NzRateModule,
    NzSelectModule,
    NzSpinModule,
    NzSliderModule,
    NzSwitchModule,
    NzProgressModule,
    NzTableModule,
    NzTabsModule,
    NzTagModule,
    NzTimePickerModule,
    NzUtilModule,
    NzStepsModule,
    NzDropDownModule,
    NzMenuModule,
    NzBreadCrumbModule,
    NzLayoutModule,
    NzRootModule,
    NzCarouselModule,
    // NzCardModule,
    NzCollapseModule,
    NzTimelineModule,
    NzToolTipModule,
    // NzBackTopModule,
    // NzAffixModule,
    // NzAnchorModule,
    NzAvatarModule,
    NzUploadModule,
    // SERVICES
    NzNotificationService,
    NzMessageService
} from 'ng-zorro-antd';

export const ZORROMODULES = [
    // LoggerModule,
    // NzLocaleModule,
    NzButtonModule,
    NzAlertModule,
    NzBadgeModule,
    // NzCalendarModule,
    NzCascaderModule,
    NzCheckboxModule,
    NzDatePickerModule,
    NzFormModule,
    NzInputModule,
    NzInputNumberModule,
    NzGridModule,
    NzMessageModule,
    NzModalModule,
    NzNotificationModule,
    NzPaginationModule,
    NzPopconfirmModule,
    NzPopoverModule,
    NzRadioModule,
    NzRateModule,
    NzSelectModule,
    NzSpinModule,
    NzSliderModule,
    NzSwitchModule,
    NzProgressModule,
    NzTableModule,
    NzTabsModule,
    NzTagModule,
    NzTimePickerModule,
    NzUtilModule,
    NzStepsModule,
    NzDropDownModule,
    NzMenuModule,
    NzBreadCrumbModule,
    NzLayoutModule,
    NzRootModule,
    NzCarouselModule,
    // NzCardModule,
    NzCollapseModule,
    NzTimelineModule,
    NzToolTipModule,
    // NzBackTopModule,
    // NzAffixModule,
    // NzAnchorModule,
    NzAvatarModule,
    NzUploadModule
];
// endregion

// region: @zjft/abc modules
import {
    AdSimpleTableModule,
    AdReuseTabModule,
    AdAvatarListModule,
    AdChartsModule,
    // AdCountDownModule,
    AdDescListModule,
    AdEllipsisModule,
    AdErrorCollectModule,
    AdExceptionModule,
    AdFooterToolbarModule,
    AdGlobalFooterModule,
    AdNoticeIconModule,
    AdNumberInfoModule,
    AdProHeaderModule,
    AdResultModule,
    AdSidebarNavModule,
    AdStandardFormRowModule,
    AdTagSelectModule,
    AdTrendModule,
    // AdDownFileModule,
    AdImageModule,
    AdUtilsModule,
    AdFullContentModule,
    // AdXlsxModule,
    // AdZipModule,
    AdNumberToChineseModule,
    AdLodopModule
} from '@zjft/abc';

export const ABCMODULES = [
    // AdSimpleTableModule,
    AdReuseTabModule,
    AdAvatarListModule,
    // AdChartsModule,
    // AdCountDownModule,
    // AdDescListModule,
    // AdEllipsisModule,
    // AdErrorCollectModule,
    AdExceptionModule,
    AdFooterToolbarModule,
    AdGlobalFooterModule,
    AdNoticeIconModule,
    AdNumberInfoModule,
    AdProHeaderModule,
    AdResultModule,
    AdSidebarNavModule,
    AdStandardFormRowModule,
    AdTagSelectModule,
    AdTrendModule,
    // AdDownFileModule,
    // AdImageModule,
    AdUtilsModule,
    AdFullContentModule,
    // AdXlsxModule,
    // AdZipModule,
    AdNumberToChineseModule,
    AdLodopModule
];
// endregion

import {NgZorroAntdModule} from 'ng-zorro-antd';
import {NgZorroAntdExtraModule} from 'ng-zorro-antd-extra';
import {AlainThemeModule} from '@zjft/theme';
import {AlainAuthModule} from '@zjft/auth';
import {AlainACLModule} from '@zjft/acl';
import {DelonCacheModule} from '@zjft/cache';

// region: global config functions

// import { SimpleTableConfig } from '@zjft/abc';
// export function simpleTableConfig(): SimpleTableConfig {
//     return { ps: 20 };
// }

// endregion

@NgModule({
    imports: [
        NgZorroAntdModule.forRoot(),
        NgZorroAntdExtraModule.forRoot(),
        // theme
        AlainThemeModule.forRoot(),
        // abc
        AdErrorCollectModule.forRoot(),
        AdFooterToolbarModule.forRoot(),
        AdSidebarNavModule.forRoot(),
        // AdDownFileModule.forRoot(),
        AdImageModule.forRoot(),
        AdAvatarListModule.forRoot(),
        AdDescListModule.forRoot(),
        AdEllipsisModule.forRoot(),
        AdExceptionModule.forRoot(),
        AdExceptionModule.forRoot(),
        AdNoticeIconModule.forRoot(),
        AdNumberInfoModule.forRoot(),
        AdProHeaderModule.forRoot(),
        AdResultModule.forRoot(),
        AdStandardFormRowModule.forRoot(),
        AdTagSelectModule.forRoot(),
        AdTrendModule.forRoot(),
        AdUtilsModule.forRoot(),
        AdChartsModule.forRoot(),
        // AdCountDownModule.forRoot(),
        AdSimpleTableModule.forRoot(),
        AdReuseTabModule.forRoot(),
        AdFullContentModule.forRoot(),
        // AdXlsxModule.forRoot(),
        // AdZipModule.forRoot(),
        AdNumberToChineseModule.forRoot(),
        AdLodopModule.forRoot(),
        // auth
        AlainAuthModule.forRoot({
            // 忽略token验证
            ignores: [`\\/system\\/menu`,`\\/system\\/login`, `\\/system\\/user\\/modPasswd`, `assets\\/`, `\\/qryParamInfos`],
            token_send_place: 'header',
            token_send_key: 'token',
            token_invalid_redirect: false,
            login_url: `/login`
        }),
        // acl
        AlainACLModule.forRoot(),
        // cache
        DelonCacheModule.forRoot()
    ]
})
export class DelonModule {
    constructor(@Optional() @SkipSelf() parentModule: DelonModule) {
        throwIfAlreadyLoaded(parentModule, 'DelonModule');
    }

    static forRoot(): ModuleWithProviders {
        return {
            ngModule: DelonModule,
            providers: [
                // TIPS：@zjft/abc 有大量的全局配置信息，例如设置所有 `simple-table` 的页码默认为 `20` 行
                // { provide: SimpleTableConfig, useFactory: simpleTableConfig }
            ]
        };
    }
}
