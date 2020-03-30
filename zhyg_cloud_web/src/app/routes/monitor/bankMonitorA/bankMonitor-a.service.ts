import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class BankMonitorAService {
    private monitorUrl = `${environment.SERVER_URL}` + '/monitor';
    private resourceUrl = `${environment.RESOURCE_URL}`;
    private monitorWS= `${environment.WEBSOCKET_URL}`+'/monitor';

    // 获得地图json数据
    getMapjson(params): Observable<any> {
        return this.http.get(this.resourceUrl + '/map/' + params + '.json');
    }
    getRetainRatio(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCardRetainRatio');
    }
    eachDayAddCase(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/faultAnalysis/eachDayAddCase');
    }

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getCatalogScale(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCatalogScale');
    }

    getHotMapData(params): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryHotMapData', {
            params: params
        });
    }

    getHopMapWS(param1, param2) {
        return this.monitorWS + '/websocket/hotMap?' + 'token=' + param1 + '&userNo=' + param2;
    }

    getWdTransInfoRanking(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryWdTransInfoRanking');
    }

    getWdOpenRateRanking(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryWdOpenRateRanking');
    }

    getDayCountByTransTypeToHistogram(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryDayCountByTransTypeToHistogram');
    }

    getCallCount(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/bigScreen/qryCallCount');
    }

    // 获得饼图加柱状图数据
    getPieAndHistogramWS(param1, param2) {
        return this.monitorWS + '/websocket/pieAndHistogram?' + 'token=' + param1 + '&userNo=' + param2;
    }
    // 获得交易数量
    getTransScreenWS(param1, param2) {
        return this.monitorWS + '/websocket/transScreen?' + 'token=' + param1 + '&userNo=' + param2;
    }
    // 交易类型排名
    getTransCountRank(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/transAnalysis/histogram');
    }
}
