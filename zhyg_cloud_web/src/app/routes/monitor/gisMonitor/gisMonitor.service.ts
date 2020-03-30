import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class GisMonitorService {
    private gisMonitorUrl = `${environment.SERVER_URL}` + '/shepherd/monitor';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getGisOrgInfo(params): Observable<any> {
        return this.http.post<any>(this.gisMonitorUrl + '/qryGisOrgInfo', params);
    }
}

