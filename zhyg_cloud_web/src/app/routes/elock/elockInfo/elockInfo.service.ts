import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class ElockInfoService {

    private elocksUrl = `${environment.SERVER_URL}` + '/elock/elockInfo';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getElocks(params): Observable<any> {
        console.log('is access service');
        console.log(this.elocksUrl + '/qryElocks');
        return this.http.get<any>(this.elocksUrl + '/qryElocks', {
            params: params
        });
    }


    addElock(params): Observable<any> {
        return this.http.post<any>(this.elocksUrl + '/addElock', params);
    }
}
