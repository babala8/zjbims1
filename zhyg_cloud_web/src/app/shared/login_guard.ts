/**  
 *  路由守卫，限制非正常情况下跳转，或者进入路由--baxian
 * 
 */
import { CanActivate, CanActivateChild } from '@angular/router';
import {Injectable, Inject} from '@angular/core';
import { Router } from '@angular/router';
import {DA_SERVICE_TOKEN, TokenService} from '@zjft/auth';
import {SessionService} from '@core/session.service';

import {Observable} from 'rxjs/Observable';


@Injectable()
export class LoginGuard implements CanActivate, CanActivateChild {
    constructor(
        private router: Router,
        private sesstionService: SessionService,
        @Inject(DA_SERVICE_TOKEN) private tokenService: TokenService,
    ) { }
    canActivate(): Observable<boolean> | Promise<boolean> | boolean {
        return this.logIn();
    }
    canActivateChild(): Observable<boolean> | Promise<boolean> | boolean {
        return this.logIn();
    }
    private logIn() {

        if (this.sesstionService.isLoggedIn) {
            return true;
        } else {
            this.router.navigateByUrl(this.tokenService.login_url);
            return false;
        }
    }
}
