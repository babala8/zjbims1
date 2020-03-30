import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class TransAnalysisService {
    private monitorUrl = `${environment.SERVER_URL}` + '/monitor';
    private resourceUrl = `${environment.RESOURCE_URL}`;
    private monitorWS= `${environment.WEBSOCKET_URL}`+'/monitor';



    constructor(private http: HttpClient,
                private location: Location) {
    }

    getTransCountRank(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/transAnalysis/histogram');
    }

    getDevCountTrend(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/transAnalysis/devCountTrend');
    }

    getCatalogScale(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCatalogScale');
    }



}
