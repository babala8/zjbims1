import {Inject, Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {zip} from 'rxjs/observable/zip';
import {catchError} from 'rxjs/operators';
import {TranslateService} from '@ngx-translate/core';
import {MenuService, SettingsService, TitleService} from '@zjft/theme';
import {ACLService} from '@zjft/acl';
import {I18NService} from '../i18n/i18n.service';
import {DA_SERVICE_TOKEN, ITokenService, TokenService} from '@zjft/auth';
import {environment} from '@env/environment';

/**
 * 用于应用启动时
 * 一般用来获取应用所需要的基础数据等
 */
@Injectable()
export class StartupService {
    constructor(private menuService: MenuService,
                private translate: TranslateService,
                private i18n: I18NService,
                private settingService: SettingsService,
                private aclService: ACLService,
                private titleService: TitleService,
                @Inject(DA_SERVICE_TOKEN) private tokenService: ITokenService,
                private httpClient: HttpClient) {
    }

    // 根据environment.json初始化配置
    loadUrls(): Promise<any> {
        const promise = this.httpClient.get('assets/config/environment.json')
            .toPromise()
            .then((env: any) => {
                console.log('111');
                environment.SERVER_URL = env.SERVER_URL;
                environment.SERVER_FILE_URL = env.SERVER_FILE_URL;
                environment.WEBSOCKET_URL = env.WEBSOCKET_URL;
                environment.RESOURCE_URL = env.RESOURCE_URL;
                environment.VUE_QUEUEMANAGE_LINK = env.VUE_QUEUEMANAGE_LINK;
                environment.VUE_EXTEND_LINK = env.VUE_EXTEND_LINK;
                environment.VUE_MEDIA_LINK = env.VUE_MEDIA_LINK;
                return env;
            });
        return promise;
    }

    init(): Promise<any> {
        return this.loadUrls().then(() => {
            return this.load();
        });
    }

    load(): Promise<any> {
        // only works with promises
        // https://github.com/angular/angular/issues/15088
        return new Promise((resolve, reject) => {
            console.log('1222');
            console.log(`${environment.SERVER_URL}`);
            console.log('1222');
                zip(
                    this.httpClient.get(`${environment.RESOURCE_URL}/i18n/${this.i18n.defaultLang}.json`),
                    this.httpClient.get(`${environment.SERVER_URL}/system/menu`),

                ).pipe(
                    // 接收其他拦截器后产生的异常消息
                    catchError(([langData, appData]) => {
                        resolve(null);
                        return [langData, appData];
                    })
                ).subscribe(([langData, appData]) => {
                        // setting language data
                        this.translate.setTranslation(this.i18n.defaultLang, langData);
                        this.translate.setDefaultLang(this.i18n.defaultLang);
                        // application data
                        // const res: any = appData;
                        // 应用信息：包括站点名、描述、年份
                        // this.settingService.setApp(res.app);
                        // 用户信息：包括姓名、头像、邮箱地址
                        // this.settingService.setUser(res.user);
                        // ACL：设置权限为全量
                        this.aclService.setFull(false);
                        this.menuService.add(appData.data);
                        // 设置页面标题的后缀
                        // this.titleService.suffix = res.app.name;
                    },
                    () => {
                        console.log('error');
                    },
                    () => {
                        resolve(null);
                    });
            }
        );
    }
}
