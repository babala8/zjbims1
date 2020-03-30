import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AppResultService {

    private appResultUrl = `${environment.SERVER_FILE_URL}` + '/content/appModel';

    constructor(private http: HttpClient) {
    }

    private updateModes = [
        {no: '1', name: '立即生效'},
        {no: '2', name: '定时生效'},
        {no: '3', name: '重启生效'},
    ];

    getUpdateModes(): { no: string, name: string }[] {
        return this.updateModes;
    }

    /**
     * 查询设备应用版本生效结果
     * @param params
     */
    qryAppResultByDev(params): Observable<any> {
        return this.http.post(this.appResultUrl + '/qryAppResultByDev', params);
    }

    /**
     * 同步
     */
    syncAds(params): Observable<any> {
        return this.http.post(`${environment.SERVER_FILE_URL}` + '/content/advValidResult/syncAds', params);
    }
}
