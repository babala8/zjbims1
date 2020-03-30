import {NgModule} from '@angular/core';
import {SystemRoutingModule} from './system.routing';
import {MenuModule} from './menu/menu.module';
import {SysMenuService} from './menu/menu.service';
import {RoleModule} from './role/role.module';
import {OrgModule} from './org/org.module';
import {DevModule} from './dev/dev.module';
import {UserModule} from './user/user.module';
import {SysParamModule} from './sysParam/sysParam.module';
import {DevResponsibleModule} from './devResponsible/devResponsible.module';
import {BankModule} from './bank/bank.module';
import {DevServiceManagerModule} from './devServiceManager/devServiceManager.module';
import {FactoryModule} from './factory/factory.module';
import {LogModule} from './log/log.module';
import {TypeModule} from './type/type.module';
import {VendorModule} from './vendor/vendor.module';
import {CatalogModule} from './catalog/catalog.module';
import {DevWorkTimeModule} from './devWorkTime/devWorkTime.module';
import {PasswordModule} from './password/password.module';
import {ModCatalogModule} from './modCatalog/modCatalog.module';
import {NotifyModelModule} from './notifyModel/notifyModel.module';
import {DevStopModule} from './devstop/devStop.module';
import {OrgWorkTimeModule} from './OrgWorkTime/OrgWorkTime.module';
import {BulletinModule} from './bulletin/bulletin.module';
import {SelfHelpBankModule} from './selfHelpBank/selfHelpBank.module';
import {MyApplyModule} from './myApply/myApply.module';
import {MyAuditModule} from './myAudit/myAudit.module';
import {CardInfoModule} from './cardInfo/cardInfo.module';
import {GlobalCfgModule} from './globalCfg/globalCfg.module';
import {BlackListInfoModule} from './blackListInfo/blackListInfo.module';

@NgModule({
    imports: [
        MenuModule,
        RoleModule,
        OrgModule,
        DevModule,
        UserModule,
        SysParamModule,
        BankModule,
        DevServiceManagerModule,
        FactoryModule,
        DevResponsibleModule,
        SystemRoutingModule,
        LogModule,
        TypeModule,
        VendorModule,
        CatalogModule,
        DevWorkTimeModule,
        PasswordModule,
        ModCatalogModule,
        NotifyModelModule,
        DevWorkTimeModule,
        DevStopModule,
        OrgWorkTimeModule,
        BulletinModule,
        SelfHelpBankModule,
        MyApplyModule,
        MyAuditModule,
        CardInfoModule,
        GlobalCfgModule,
        BlackListInfoModule,
    ],
    providers: [
        SysMenuService
    ]
})
export class SystemModule {
    constructor() {
    }
}
