import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class FaultAnalysisService {
    private monitorUrl = `${environment.SERVER_URL}` + '/monitor';
    private resourceUrl = `${environment.RESOURCE_URL}`;
    private monitorWS= `${environment.WEBSOCKET_URL}`+'/monitor';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    realTimeOpenCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/realTimeOpenCase');
    }

    closeCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/closeCase');
    }

    addedCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/addedCase');
    }

    eachDayAddCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/eachDayAddCase');
    }

    eachDayCloseCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/eachDayCloseCase');
    }

    avgCloseTime(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/avgCloseTime');
    }

    avgCaseCount(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/avgCaseCount');
    }

}
