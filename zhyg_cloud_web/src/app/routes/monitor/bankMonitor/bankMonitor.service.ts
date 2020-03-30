import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class BankMonitorService {
    private bankMonitorUrl = `${environment.SERVER_URL}` + '/monitor/bigScreen';
    private resourceUrl = `${environment.RESOURCE_URL}`;

    // 查询自定义参数信息列表
    getMapjson(params): Observable<any> {
        return this.http.get(this.resourceUrl + '/map/' + params + '.json');
    }

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getWdOpenRateRanking(params): Observable<any> {
        return this.http.get<any>(this.bankMonitorUrl + '/qryWdOpenRateRanking', {
            params: params
        });
    }

    getWdTransInfoRanking(params): Observable<any> {
        return this.http.get<any>(this.bankMonitorUrl + '/qryWdTransInfoRanking', {
            params: params
        });
    }
}
