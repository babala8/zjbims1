import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class SysParamService {



    private sysParamUrl = `${environment.SERVER_URL}` + '/system';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 负责人类型
     */
    caseCatalogInfo = [
        {no: 1, name: '管机员'},
        {no: 2, name: '维护人员'},
        {no: 3, name: '管机员和维护人员'}
    ];

    /**
     * 负责人类型
     */
    notifyWayInfo = [
        {no: 1, name: '短信'},
        {no: 2, name: '邮件'},
        {no: 3, name: '短信和邮件'},
        {no: 4, name: '不通知'}
    ];

    getSysParam(params): Observable<any> {
        return this.http.get<any>(this.sysParamUrl + '/sysParam/qryCaseCatalog', {
            params: params
        });
    }

    getcaseCataloglist() {
        return this.caseCatalogInfo;
    }

    getnotifyWayList() {
        return this.notifyWayInfo;
    }

    modSysParam(before, current): Observable<any> {
        return this.http.post<any>(this.sysParamUrl + '/sysParam/modCaseCatalog', {
            before: before,
            current: current,
        });
    }

    getGradle(params): Observable<any> {
        return this.http.get<any>(this.sysParamUrl + '/sysParam/qryAllGrade', {
            params: params
        });
    }

    back() {
        this.location.back();
    }

}
