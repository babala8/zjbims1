import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class OrgWorkTimeService {

    private orgsUrl = `${environment.SERVER_URL}` + '/system/SysOrgWorkTime';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getOrgs(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrg', {
            params: params
        });
    }

    getOrgType(): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/getOrgType', {});
    }

    getOrgWorkTime(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrgWorkTime', {
            params: params
        });
    }

    getOrgSpecialDate(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrgSpecialDate', {
            params: params
        });
    }

    // SetBatchOrgWorkTime  /SetNormalBatchOrgWorkTime

    setBatchOrgWorkTime(params): Observable<any> {
        return this.http.post<any>(this.orgsUrl + '/SetBatchOrgWorkTime', params);
    }

    SetNormalBatchOrgWorkTime(params): Observable<any> {
        return this.http.post<any>(this.orgsUrl + '/SetNormalBatchOrgWorkTime', params);
    }

    delSpecialDate(params): Observable<any> {
        return this.http.put(this.orgsUrl + '/delSpecial', params);
    }

    back() {
        this.location.back();
    }

}
