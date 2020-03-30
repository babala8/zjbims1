import {Injectable} from '@angular/core';
import 'rxjs/add/observable/of';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/delay';
import {Menu, MenuService} from '@zjft/theme';

const excludes = ['/home'];

/**
 * TODO(ccliu):验证用户权限的方式不应以url来判断
 * 建议使用acl中的abilities
 *
 * 菜单的是否显示交给acl来处理
 *
 */
@Injectable()
export class AuthService {
    constructor(private menu: MenuService) {

    }

    checkPermission(url: string, targetUrl: string): boolean {
        return true;
        // console.log('checkPermission:', url);
        // let ret = false;
        // if (excludes.includes(url)) {
        //     return true;
        // }
        // this._menuService.visit((menu: Menu) => {
        //     if ((menu.link === url||menu.link===targetUrl) && !menu._hidden) {
        //         ret = true;
        //     }
        // })
        // return ret;
    }
}
