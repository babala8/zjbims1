import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class DevWorkTimeService {

    private timesUrl = `${environment.SERVER_URL}` + '/system/devWorkTime';
    private devsUrl = `${environment.SERVER_URL}` + '/system';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 获取所有的设备信息
     * @param params
     */
    getDevs(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/devWorkTime/qryDevs', {
            params: params
        });
    }
    /**
     * 设置设备工作时间信息
     */
    SetDevWorkTime(params): Observable<any> {
        return this.http.post<any>(this.timesUrl + '/setDevWorkTime', params);
    }
    /**
     * 查询设备工作时间
     */
    getDevWorkTimeById(params): Observable<any> {
        return this.http.get<any>(this.timesUrl + '/qryDevWorkTimeById', {
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

    back() {
        this.location.back();
    }

}
