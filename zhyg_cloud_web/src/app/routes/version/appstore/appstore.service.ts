import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

const httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'multipart/form-data'})
};

@Injectable()
export class AppstoreService {

    private appUrl = `${environment.SERVER_URL}` + '/content/appBaseInfo';

    /**
     * 应用类型
     */
    appTypeTransfer = [
        {no: '1', name: '全渠道统一平台'},
        {no: '2', name: '客户端应用'},
        {no: '3', name: '服务端应用'},
        {no: '4', name: 'WSAP应用工程'},
    ];

    constructor(
        private http: HttpClient,
        private location: Location
    ) {
    }

    getApps(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/qryApp', params);
    }

    /**
     * 获取应用类型列表
     * @param params
     */
    getAppCatalogs(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/qryAppCatalog', params);
    }

    addApp(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/addApp', params);
    }

    modApp(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/modApp', params);
    }

    delApp(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/delApp', params);
    }

    banApp(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/banApp', params);
    }

    /**
     * 获取应用类型名称
     * @param no
     */
    getTypeName(no: string): string {
        for (const type of this.appTypeTransfer) {
            if  (type.no == no) {
                return type.name;
            }
        }
    }

    getTypeTransfer() {
        return this.appTypeTransfer;
    }

    getVersions(params): Observable<any> {
        return this.http.post<any>(this.appUrl + '/appDetail', params);
    }

    /**
     * 临时方法
     * @param params
     */
    getDevCatalogs(params): Observable<any> {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/catalog/qryAllCatalog', params);
    }

    back() {
        this.location.back();
    }

    /**
     * 校验版本文件
     * @param params
     */
    checkVersionFile(params): Observable<any> {
        return this.http.get(`${environment.SERVER_URL}` + '/content/appVersion/checkVersion', {params: params});
    }

    /**
     * 版本文件入库
     * @param params
     */
    saveVersionFile(params): Observable<any> {
        return this.http.post(`${environment.SERVER_URL}` + '/content/appVersion/commitVersion', params);
    }

    /**
     * 查询所有应用
     */
    qryAll(): Observable<any> {
        return this.http.post(this.appUrl + '/qryAllApp', {});
    }
}
