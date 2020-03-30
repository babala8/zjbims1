import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class ParameterService {

    private parameterUrl = `${environment.SERVER_URL}` + '/content';

    constructor(
        private http: HttpClient,
        private location: Location
    ) {
    }


    /**
     * 查询应用版本参数
     * @param params
     */
    getParam(params): Observable<any> {
        return this.http.post<any>(this.parameterUrl + '/appParam/qryParam', params);
    }

    /**
     * 修改应用版本参数
     * @param params
     */
    modParam(params): Observable<any> {
        return this.http.post<any>(this.parameterUrl + '/appParam/modParam', params);
    }

    /**
     * 同步应用版本参数
     * @param params
     */
    synParam(params): Observable<any> {
        return this.http.post<any>(this.parameterUrl + '/appParam/synParam', params);
    }

    /**
     * 查询全部应用
     * @param params
     */
    getApp(params): Observable<any> {
        return this.http.post<any>(this.parameterUrl + '/appBaseInfo/qryAllApp', params);
    }

    /**
     * 根据APP应用查询应用版本号
     * @param params
     */
    getVersionByAppId(appsId): Observable<any> {
        return this.http.post<any>(this.parameterUrl + '/appVersion/qryVersionByAppId',
            {appsId: appsId});
    }

    /**
     * 查询机构总行编号
     * @param params
     */
    getZHOrg(params): Observable<any> {
        return this.http.post<any>(this.parameterUrl + '/system/org/qryZHOrg', params);
    }

    back() {
        this.location.back();
    }
}

