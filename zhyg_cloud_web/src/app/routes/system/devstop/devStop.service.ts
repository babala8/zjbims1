import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()

export class DevStopService {

    private stopdevUrl = `${environment.SERVER_URL}` + '/system';



    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 获取所有设备以及当前停机信息
     * @param params
     */
    getDevs(params): Observable<any> {
        return this.http.get<any>(this.stopdevUrl + '/stop/qry', {
            params: params
        });
    }

    /**
     * 添加设备停机
     * @param params
     */
    addStopDev(params): Observable<any> {
        return this.http.post<any>(this.stopdevUrl + '/stop/add', params);
    }

    /**
     * 获取停机详细
     * @param params
     */
    getStopDevDetail(params): Observable<any> {
        return this.http.get<any>(this.stopdevUrl + '/stop/qryDetail', {
            params: params
        });
    }

    getStopDevByLogicId(logicId): Observable<any> {
        return this.http.get<any>(this.stopdevUrl + '/stop/qryByLogicId',
            {
                params: {logicId: logicId}
            });
    }

    modDevStop(before, current): Observable<any> {
        return this.http.post(this.stopdevUrl + '/stop/mod', {
            before: before,
            current: current,
        });
    }

    /**
     * 查询所有设备分类
     */
    getDevCatalogInfo(params): Observable<any> {
        return this.http.get<any>(this.stopdevUrl + '/catalog/qryCatalog', {
            params: params
        });
    }

    /**
     * 查询所有设备型号
     */
    getDevTypeByVendor(params): Observable<any> {
        return this.http.get<any>(this.stopdevUrl + '/type/qryType', {
            params: params
        });
    }

    /**
     * 查询所有设备品牌
     */
    getDevVendorInfo(params): Observable<any> {
        return this.http.get<any>(this.stopdevUrl + '/vendor/qryVendor', {
            params: params
        });
    }

    back() {
        this.location.back();
    }


}
