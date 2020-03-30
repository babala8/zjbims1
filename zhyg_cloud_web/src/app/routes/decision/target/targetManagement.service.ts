import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class TargetManagementService {

    private targetUrl = `${environment.SERVER_URL}` + '/analysis/decision';

    constructor(private http: HttpClient,
                private location: Location) {
    }


    getTargets(params): Observable<any> {
        return this.http.get<any>(this.targetUrl + '/qryTarget', {params : params});
    }


    getTargetById(params): Observable<any> {
        return this.http.get<any>(this.targetUrl + '/qryTargetById', {params : params});
    }

    addTarget(params): Observable<any> {
        return this.http.post<any>(this.targetUrl + '/addTarget', params);
    }

    modTarget(params): Observable<any> {
        return this.http.post<any>(this.targetUrl + '/modTarget', params);
    }

    delTarget(params): Observable<any> {
        return this.http.delete<any>(this.targetUrl + '/delTarget', {params : params});
    }


    back() {
        this.location.back();
    }

}
