import {Injectable} from '@angular/core';
import {
    CanActivate, Router, ActivatedRouteSnapshot, RouterStateSnapshot, CanActivateChild,
    CanLoad, Route
} from '@angular/router';
import {Observable} from 'rxjs/Observable';
import {SessionService} from 'app/core/session.service';
import {ACLService} from '@zjft/acl';

@Injectable()
export class AuthGuard implements CanActivate, CanActivateChild {

    constructor(private router: Router,
                private acl: ACLService,
                private session: SessionService) {
    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
        if (this.session.isLoggedIn) {
            return true;
            // return this._checkPermission(this._getUrl(route), state.url);
        }
        return false;
    }

    canActivateChild(childRoute: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
        return this.canActivate(childRoute, state);
    }


}
