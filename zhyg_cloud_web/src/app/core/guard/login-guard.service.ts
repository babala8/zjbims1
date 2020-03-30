import {Inject, Injectable} from '@angular/core';
import {
    CanActivate, Router, ActivatedRouteSnapshot, RouterStateSnapshot
} from '@angular/router';
import {SessionService} from '../session.service';
import {Observable} from 'rxjs/Observable';
import {DA_SERVICE_TOKEN, TokenService} from '@zjft/auth';
import {HttpClient} from '@angular/common/http';


@Injectable()
export class LoginGuard implements CanActivate {

    constructor(private router: Router,
                private sessionService: SessionService,
                private http: HttpClient,
                @Inject(DA_SERVICE_TOKEN) private tokenService: TokenService) {
    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {

        const session = this.sessionService;
        console.log(session.canRetry);
        if (session.isLoggedIn) {
            // login in;
            return true;
        } else if (session.canRetry) {
            // refresh browser;
            return new Promise((resolve, reject) => {
                this._getCurUser()
                    .subscribe(data => {
                        session.parseData(data);
                        resolve(true);
                    }, (err) => {
                        // Store the attempted URL for redirecting
                        session.redirect = state.url;
                        this.router.navigate([session.login_url]);
                        resolve(false);
                    });
            });
        } else {
            // Store the attempted URL for redirecting
            session.redirect = state.url;
            this.router.navigate([session.login_url]);
            return false;
        }
    }

    private _getCurUser(): Observable<any> {
        return this.http.post('/system/newRefresh', {});
    }

}
