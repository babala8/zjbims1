import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class LogService {

    private logUrl = `${environment.SERVER_URL}` + '/system/log';

    constructor(private http: HttpClient) {
    }

    /**
     * 查询所有操作
     */
    qryOperates(): Observable<any> {
        return this.http.get<any>(this.logUrl + '/operate');
    }

    /**
     * 查询日志
     * @param params
     */
    qryLogs(params): Observable<any> {
        return this.http.get<any>(this.logUrl, {
            params: params
        });
    }

}
