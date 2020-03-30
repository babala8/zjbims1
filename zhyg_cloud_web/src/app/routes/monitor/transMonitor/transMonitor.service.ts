import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class TransMonitorService {

    private monitorUrl = `${environment.SERVER_URL}` + '/monitor/transmonitor';

    constructor(private http: HttpClient) {
    }

    /**
     * 查询交易类型列表
     */
    qryTransType(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/qryTransType');
    }

}
