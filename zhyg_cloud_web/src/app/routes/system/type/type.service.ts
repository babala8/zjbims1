import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class TypeService {

    private typeUrl = `${environment.SERVER_URL}` + '/system';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getTypes(params): Observable<any> {
        return this.http.get<any>(this.typeUrl + '/type/qryType', {
            params: params
        });
    }


    getType(no): Observable<any> {
        return this.http.get<any>(this.typeUrl + '/type/qryTypeById', {
            params: {no: no}
        });
    }

    addType(params): Observable<any> {
        return this.http.post<any>(this.typeUrl + '/type/addType', params);
    }

    modType(before, current): Observable<any> {
        return this.http.post<any>(this.typeUrl + '/type/modType', {
            before: before,
            current: current,
        });
    }

    delType(params): Observable<any> {
        return this.http.delete<any>(this.typeUrl + '/type/delType', {
            params: params
        });
    }

    /**
     * 查询所有设备分类
     */
    getDevCatalogInfo(params): Observable<any> {
        return this.http.get<any>(this.typeUrl + '/catalog/qryCatalog', {
            params: params
        });
    }

    /**
     * 查询所有设备品牌
     */
    getDevVendorInfo(params): Observable<any> {
        return this.http.get<any>(this.typeUrl + '/vendor/qryVendor', {
            params: params
        });
    }

    back() {
        this.location.back();
    }

}
