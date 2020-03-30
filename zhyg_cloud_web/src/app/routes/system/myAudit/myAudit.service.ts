import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class MyAuditService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';


    constructor(private http: HttpClient,
                private location: Location) {
    }

    getMyAudit(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/audit/qryMyAudit', {
            params: params
        });
    }

    PostAgree(url,params): Observable<any> {
        return this.http.post<any>(this.devsUrl + url, params);
    }

    changeAuditStatus(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/audit/changeAuditStatus', {
            params: params
        });
    }

    back() {
        this.location.back();
    }

}
