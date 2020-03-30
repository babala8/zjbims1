import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AdvResultService {

    private advResultUrl = `${environment.SERVER_FILE_URL}` + '/content/advValidResult';

    constructor(private http: HttpClient) {
    }

    /**
     * 查询设备上当前播放广告列表
     * @param params
     */
    qryAdvResultForDev(params): Observable<any> {
        return this.http.get(this.advResultUrl + '/qryAdvResultForDev', {
            params: params
        });
    }

    /**
     * 查询广告当前投放设备列表
     * @param params
     */
    qryDevByAdv(params): Observable<any> {
        return this.http.get(this.advResultUrl + '/qryDevByAdv', {
            params: params
        });
    }

    /**
     * 撤销广告
     */
    cancelAds(params): Observable<any> {
        return this.http.post(this.advResultUrl + '/cancelAds', params);
    }

    /**
     * 同步广告
     */
    syncAds(params): Observable<any> {
        return this.http.post(this.advResultUrl + '/syncAds', params);
    }

    getTestDevOfAds(params): Observable<any> {
        return this.http.get(this.advResultUrl + '/getTestDevOfAds', {
            params: params
        });
    }
}
