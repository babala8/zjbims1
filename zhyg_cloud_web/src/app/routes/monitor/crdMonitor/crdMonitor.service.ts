import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class CrdMonitorService {
    private crdMonitorUrl = `${environment.SERVER_URL}` + '/monitor';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    initCrdMonitor(params): Observable<any> {
        return this.http.get<any>(this.crdMonitorUrl + '/crdmonitor/initCrdMonitor', {
            params: params
        });
    }

    getCrdList(params): Observable<any> {
        return this.http.get<any>(this.crdMonitorUrl + '/crdmonitor/qryCrdList', {
            params: params
        });
    }

    getCrdStatus(params): Observable<any> {
        return this.http.get<any>(this.crdMonitorUrl + '/crdmonitor/qryCrdStatus', {
            params: params
        });
    }

    back() {
        this.location.back();
    }


    getCardBoxInfo(params): Observable<any> {
        return this.http.get<any>(this.crdMonitorUrl + '/crdmonitor/qryCardBoxInfo', {
            params: params
        });
    }

}
