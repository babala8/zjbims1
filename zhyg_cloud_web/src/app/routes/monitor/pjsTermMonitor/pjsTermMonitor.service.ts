import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class PjsTermMonitorService {

    private systemUrl = `${environment.SERVER_URL}` + '/system';

    private monitorUrl = `${environment.SERVER_URL}` + '/monitor';

    constructor(private http: HttpClient,
    ) {}

    /**
     * 是否需要解绑
     */
    bindRemarkList = [
        {no: 'true', name: '需要'},
        {no: 'false', name: '不需要'},
        {no: '', name: '全部'},
    ];

    getDevs(params): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/pjs/terminfo', {
            params: params
        });
    }

    unbutton(params): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/pjs/unbutton', {
            params: params
        });
    }

    getBindRemarkList() {
        return this.bindRemarkList;
    }

    /**
     * 查询所有设备分类
     */
    getDevCatalogInfo(params): Observable<any> {
        return this.http.get<any>(this.systemUrl + '/catalog/qryCatalog', {
            params: params
        });
    }

    /**
     * 查询所有设备型号
     */
    getDevTypeByVendor(params): Observable<any> {
        return this.http.get<any>(this.systemUrl + '/type/qryType', {
            params: params
        });
    }

    /**
     * 查询所有设备品牌
     */
    getDevVendorInfo(params): Observable<any> {
        return this.http.get<any>(this.systemUrl + '/vendor/qryVendor', {
            params: params
        });
    }


}
