import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class CashForcastService {
    private cashForcastUrl = `${environment.SERVER_URL}` + '/business/cashForcast';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getCashInfo(params): Observable<any> {
        return this.http.get<any>(this.cashForcastUrl + '/qryCashForcast', params);
    }
}

