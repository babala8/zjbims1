import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class PjsMonitorService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';
    private pjsUrl = `${environment.SERVER_URL}` + '/monitor';
    private resourceUrl = `${environment.RESOURCE_URL}`;

    constructor(private http: HttpClient,
    ) {}



    getDevsStatus(params): Observable<any> {
        return this.http.get<any>(this.pjsUrl + '/pjs/devsStatus', {
            params: params
        });
    }

    getDevAttrAndStatus(params): Observable<any> {
        return this.http.get<any>(this.pjsUrl + '/pjs/devAttrAndStatus', {
            params: params
        });
    }

}
