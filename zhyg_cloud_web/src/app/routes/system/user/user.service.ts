import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

const httpOptions = {
    headers: new HttpHeaders(
        {
            'Content-Type': 'application/json',
            'Accept-Language': 'zh-cn',
            'Accept-Charset': 'utf-8'
        })
};

@Injectable()
export class UserService {

    private url = `${environment.SERVER_URL}` + '/system/user';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 设备类型
     */
    devCatalogInfo = [
        {no: 'all', name: '全部设备'},
        {no: 'CRS', name: 'CRS'},
        {no: 'CDM', name: 'CDM'},
        {no: 'ATM', name: 'ATM'},
        {no: 'BSM', name: 'BSM'},
        {no: 'MTM', name: 'MTM'},
        {no: 'IST', name: 'IST'},
        {no: 'BTS', name: 'BTS'},
        {no: 'SFM', name: 'SFM'},
        {no: 'CDT', name: 'CDT'},
        {no: 'STM', name: 'STM'},
        {no: 'SQM', name: 'SQM'},
        {no: 'IAS', name: 'IAS'},
        {no: 'MDM', name: 'MDM'},
    ];

    getUsers(params): Observable<any> {
        return this.http.get<any>(this.url + '/qryAllUsers', params);
    }

    getUserByPage(params): Observable<any> {
        return this.http.get<any>(this.url + '/qryUsers', {
            params: params
        });
    }

    getUser(userNo): Observable<any> {
        return this.http.get<any>(this.url + '/qryUserById', {
            params: {userNo: userNo}
        });
    }

    addUser(params, auditParams): Observable<any> {
        console.log(params);
        return this.http.post<any>(this.url + '/addUser', params, {
            headers: auditParams
        });
    }

    updateUser(before, current, auditParams): Observable<any> {
        return this.http.post<any>(this.url + '/modUser', {
            before: before,
            current: current
        }, {
            headers: auditParams
        });
    }

    deleteUser(userNo): Observable<any> {
        return this.http.delete<any>(this.url + '/delUser', {
            params: {userNo: userNo}
        });
    }

    deleteUserAudit(userNo, auditParams): Observable<any> {
        return this.http.delete<any>(this.url + '/delUser', {
            params: {userNo: userNo},
            headers: auditParams,
        });
    }

    resetPassword(params): Observable<any> {
        return this.http.post<any>(this.url + '/modPasswd', params);
    }

    modPassword(params): Observable<any> {
        return this.http.post<any>(this.url + '/modPasswd', {
            params: params
        });
    }

    unlock(userNo): Observable<any> {
        return this.http.get<any>(this.url + '/unlock', {
            params: {userNo: userNo}
        });
    }

    getdevCatalogInfolist() {
        return this.http.get<any>('/system/catalog/qryAllCatalog');
    }

    cancel() {
        this.location.back();
    }
}
