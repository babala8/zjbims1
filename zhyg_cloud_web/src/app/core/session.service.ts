import {Inject, Injectable} from '@angular/core';
import {Menu, MenuService, SettingsService} from '@zjft/theme';
import {DA_SERVICE_TOKEN, TokenService} from '@zjft/auth';
import {Router} from '@angular/router';
import {ReuseTabService} from '@zjft/abc';
import {ACLService} from '@zjft/acl';

/**
 * 用户登陆后 初始化相关信息
 */
@Injectable()
export class SessionService {

    private _loggedIn: boolean;

    constructor(private menuService: MenuService,
                private router: Router,
                @Inject(DA_SERVICE_TOKEN) private tokenService: TokenService,
                private acl: ACLService,
                private reuseTabService: ReuseTabService,
                private settings: SettingsService) {
        this.tokenService.change().subscribe((res: any) => {
            // console.log('change', JSON.stringify(res));
            this.settings.setUser(res);
        });
    }

    get account() {
        return this.getUserSession().account;
    }

    get orgNo() {
        return this.getUserSession().orgNo;
    }

    get isLoggedIn(): boolean {
        return this._loggedIn;
    }

    getUserSession() {
        return this.settings.user || {};
    }

    setLogin(value: boolean) {
        this._loggedIn = value;
    }

    private _currentPath: Array<Menu> = [];

    set currentPath(param: Array<Menu>) {
        this._currentPath.splice(0, this._currentPath.length);
        this._currentPath.push(...param);
    }

    get token() {
        const tokenModel = this.tokenService.get();
        return tokenModel ? tokenModel.token : '';
    }

    get canRetry(): boolean {
        return !!this.tokenService.get().token;
    }

    set redirect(param: string) {
        this.tokenService.redirect = param;
    }

    get redirect(): string {
        return this.tokenService.redirect;
    }

    get login_url(): string {
        return this.tokenService.login_url;
    }

    getCurrentPath() {
        return this._currentPath;
    }

    parseData(data) {
        this.acl.setAbility(data.menuList);
        this.menuService.resume();
        const userInfo = {
            name: data.user.name,
            account: data.user.no,
            orgName: data.user.orgName,
            orgNo: data.user.orgNo,
            token: data.token,
            buttons: data.btnList,
            auditFlags: data.auditFlagList,
        };
        console.log('aaaa');
        console.log(userInfo);
        this.tokenService.set(userInfo);
        this._loggedIn = true;
    }

    logout() {
        this.tokenService.clear();
        this.reuseTabService.clear();
        this._loggedIn = false;
        this.router.navigateByUrl(this.tokenService.login_url);
    }

    clear() {
        this.tokenService.clear();
        this.reuseTabService.clear();
        this._loggedIn = false;
    }
}

