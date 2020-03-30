import {Injectable} from '@angular/core';
import {environment} from '@env/environment';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class GlobalCfgService {

    private globalCfgUrl = `${environment.SERVER_URL}` + '/business/globalCfg';
    constructor(private http: HttpClient) {
    }

    getGlobalCfg(params): Observable<any> {
        return this.http.get<any>(this.globalCfgUrl + '/qryGlobalCfg', {
            params: params
        });
    }

    modGlobalCfg(params): Observable<any> {
       return this.http.post<any>(this.globalCfgUrl + '/modGlobalCfg', params);
    }

}
