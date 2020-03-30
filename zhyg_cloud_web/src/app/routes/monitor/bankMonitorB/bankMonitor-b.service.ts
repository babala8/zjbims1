import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class BankMonitorBService {
    private monitorUrl = `${environment.SERVER_URL}` + '/monitor';
    private resourceUrl = `${environment.RESOURCE_URL}`;
    private monitorWS = `${environment.WEBSOCKET_URL}` + '/monitor';


    constructor(private http: HttpClient,
                private location: Location) {
    }

    getCatalogScale(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCatalogScale');
    }

    getTransScreenWS() {
        return this.monitorWS + '/websocket/transScreen';
    }

    getPieAndHistogramWS() {
        return this.monitorWS + '/websocket/pieAndHistogram';
    }

    getRetainRatio(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCardRetainRatio');
    }

    getBootRatio(params): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryBootRatio', {
            params: params
        });
    }

    getDayCountByTransTypeToHistogram(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryDayCountByTransTypeToHistogram');
    }

    getCallCount(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCallCount');
    }

    getDevCountTrend(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/transAnalysis/devCountTrend');
    }

    eachDayAddCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/eachDayAddCase');
    }


}
