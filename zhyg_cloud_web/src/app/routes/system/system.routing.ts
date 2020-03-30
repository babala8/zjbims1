import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {MenuDefineComponent} from './menu/define/menu-define.component';
import {RoleComponent} from './role/role.component';
import {OrgComponent} from './org/org.component';
import {DevComponent} from './dev/dev.component';
import {UserComponent} from './user/user.component';
import {SysParamComponent} from './sysParam/sysParam.component';
import {DevResponsibleComponent} from './devResponsible/devResponsible.compoment';
import {BankComponent} from './bank/bank.component';
import {FactoryComponent} from './factory/factory.component';
import {DevServiceManagerComponent} from './devServiceManager/devServiceManager.component';
import {LogComponent} from './log/log.component';
import {TypeComponent} from './type/type.component';
import {VendorComponent} from './vendor/vendor.component';
import {CatalogComponent} from './catalog/catalog.component';
import {DevWorkTimeComponent} from './devWorkTime/devWorkTime.component';
import {PasswordComponent} from './password/password.component';
import {ModCatalogComponent} from './modCatalog/modCatalog.component';
import {NotifyModelComponent} from './notifyModel/notifyModel.component';
import {DevStopComponent} from './devstop/devStop.componen';
import {DevStopDetailComponent} from './devstop/devStop-detail.component';
import {OrgWorkTimeComponent} from './OrgWorkTime/OrgWorkTime.component';
import {BulletinComponent} from './bulletin/bulletin.component';
import {SelfHelpBankComponent} from './selfHelpBank/selfHelpBank.component';
import {MyApplyComponent} from './myApply/myApply.component';
import {MyAuditComponent} from './myAudit/myAudit.component';
import {CardInfoComponent} from './cardInfo/cardInfo.component';
import {GlobalCfgComponent} from './globalCfg/globalCfg.component';
import {BlackListInfoComponent} from './blackListInfo/blackListInfo.component';

const routes: Routes = [
    {
        path: 'menuDefine',
        component: MenuDefineComponent,
        data: {text: '菜单定义'}
    },
    {
        path: 'role',
        component: RoleComponent,
        data: {text: '角色管理'}
    },
    {
        path: 'org',
        component: OrgComponent,
        data: {text: '机构管理'}
    },
    {
        path: 'dev',
        component: DevComponent,
        data: {text: '设备管理'}
    },
    {
        path: 'user',
        component: UserComponent,
        data: {text: '用户管理'}
    },
    {
        path: 'sysParam',
        component: SysParamComponent,
        data: {text: '系统参数设定'}
    },
    {
        path: 'devResponsible',
        component: DevResponsibleComponent,
        data: {text: '设备责任人'}
    },
    {
        path: 'bank',
        component: BankComponent,
        data: {text: '网点管理'}

    },
    {
        path: 'factory',
        component: FactoryComponent,
        data: {text: '厂商管理'}

    },
    {
        path: 'devServiceManager',
        component: DevServiceManagerComponent,
        data: {text: '设备维护'}
    },
    {
        path: 'log',
        component: LogComponent,
        data: {text: '日志查询'}
    },
    {
        path: 'vendor',
        component: VendorComponent,
        data: {text: '设备品牌管理'}
    },
    {
        path: 'type',
        component: TypeComponent,
        data: {text: '设备型号管理'}
    },
    {
        path: 'catalog',
        component: CatalogComponent,
        data: {text: '设备类型管理'}
    },
    {
        path: 'devWorkTime',
        component: DevWorkTimeComponent,
        data: {text: '工作时间设定'}
    },
    {
        path: 'password',
        component: PasswordComponent,
        data: {text: '用户密码'}
    },
    {
        path: 'modCatalog',
        component: ModCatalogComponent,
        data: {text: '设备模块'}
    },
    {
        path: 'notifyModel',
        component: NotifyModelComponent,
        data: {text: '信息通知模版'}
    },
    {
        path: 'devStop',
        component: DevStopComponent,
        data: {text: '设备停机管理'}
    },
    {
        path: 'devStopDetail',
        component: DevStopDetailComponent,
        data: {text: '设备停机详细查询'}
    }
    ,
    {
        path: 'orgWorkTime',
        component: OrgWorkTimeComponent,
        data: {text: '机构工作时段'}
    },
    {
        path: 'bulletin',
        component: BulletinComponent,
        data: {text: '公告管理'}
    },
    {
        path: 'selfHelpBank',
        component: SelfHelpBankComponent,
        data: {text: '自助银行管理'}
    },
    {
        path: 'myApply',
        component: MyApplyComponent,
        data: {text: '我的申请'}
    },
    {
        path: 'myAudit',
        component: MyAuditComponent,
        data: {text: '我的审批'}
    },
    {
        path: 'cardInfo',
        component: CardInfoComponent,
        data: {text: '卡表管理'}
    },
    {
        path: 'globalCfg',
        component: GlobalCfgComponent,
        data: {text: '参数管理'}
    },
    {
        path: 'blackListInfo',
        component: BlackListInfoComponent,
        data: {text: '黑名单管理'}
    }
];

export const SystemRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
