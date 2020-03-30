import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class PjsLogMonitorService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';

    private pjsUrl = `${environment.SERVER_URL}` + '/monitor';

    constructor(private http: HttpClient,
    ) {}


    parseParams(data) {
        try {
            const tempArr = [];
            for (const i in data) {
                const key = encodeURIComponent(i);
                const value = encodeURIComponent(data[i]);
                if (value != '') {
                    tempArr.push(key + '=' + value);
                }
            }
            const urlParamsStr = tempArr.join('&');
            return urlParamsStr;
        } catch (err) {
            return '';
        }
    }


    exportPdf(params) {
        window.location.href = this.pjsUrl + '/pjs/logExport2Pdf?' + this.parseParams(params);
    }

    /**
     * 查询一天日志
     */
    getLogData(params): Observable<any> {
        return this.http.get<any>(this.pjsUrl + '/pjs/logdata', {
            params: params
        });
    }



    getDevs(params): Observable<any> {
        return this.http.get<any>(this.pjsUrl + '/pjs/qryDevs', {
            params: params
        });
    }

    /**
     * 查询所有设备分类
     */
    getDevCatalogInfo(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/catalog/qryCatalog', {
            params: params
        });
    }

    /**
     * 查询所有设备型号
     */
    getDevTypeByVendor(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/type/qryType', {
            params: params
        });
    }

    /**
     * 查询所有设备品牌
     */
    getDevVendorInfo(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/vendor/qryVendor', {
            params: params
        });
    }


}
