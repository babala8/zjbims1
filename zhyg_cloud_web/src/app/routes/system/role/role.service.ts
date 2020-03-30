import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {environment} from '@env/environment';
import {HttpClient} from '@angular/common/http';

@Injectable()
export class RoleService {

    private roleUrl = `${environment.SERVER_URL}` + '/system/role';

    constructor(private http: HttpClient) {

    }


    qryRolesByPages(params): Observable<any> {
        return this.http.get<any>(this.roleUrl + '/qryRolesByPages', {
            params: params
        });
    }

    qryRoleByOrgType(params): Observable<any> {
        return this.http.post(this.roleUrl + '/qryRoleByOrgType', params);
    }

    qryAvailableRoleByOrgNo(params): Observable<any> {
        return this.http.get<any>(this.roleUrl + '/qryAvailableRoleByOrgNo', {
            params: params
        });
    }

    qryRoleByNo(roleNo): Observable<any> {
        return this.http.get<any>(this.roleUrl + '/qryByNo', {
            params: {roleNo: roleNo}
        });
    }

    addRole(params): Observable<any> {
        return this.http.post(this.roleUrl, params);
    }

    modRole(before, current): Observable<any> {
        return this.http.put(this.roleUrl, {
            before: before,
            current: current
        });
    }

    delRole(roleNo): Observable<any> {
        return this.http.delete(this.roleUrl + '/' + roleNo);
    }

    qryMenuByRoleid(roleNo): Observable<any> {
        return this.http.get<any>(this.roleUrl + '/qryMenuByRoleid', {
            params: {roleNo: roleNo}
        });
    }

    qryAccessById(roleNo): Observable<any> {
        return this.http.get(this.roleUrl + '/access/' + roleNo);
    }

    modAccess(param): Observable<any> {
        return this.http.put(this.roleUrl + '/access', param);
    }

}

