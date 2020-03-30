import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {p} from '@angular/core/src/render3';

@Injectable()
export class DevServiceManagerService {

    private devServiceManagersUrl = `${environment.SERVER_URL}` + '/system/devServiceManager';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getDevServiceManagers(params): Observable<any> {
        return this.http.get<any>(this.devServiceManagersUrl + '/qryDevServiceCompany', {
            params: params
        });
    }


    getDevServiceManager(no): Observable<any> {
        return this.http.get<any>(this.devServiceManagersUrl + '/qryDevServiceCompanyById', {
            params: {no: no}
        });
    }

    addDevServiceManager(params): Observable<any> {
        return this.http.post<any>(this.devServiceManagersUrl + '/addDevServiceCompany', params);
    }

    modDevServiceManager(before, current): Observable<any> {
        return this.http.post<any>(this.devServiceManagersUrl + '/modDevServiceCompany', {
            before: before,
            current: current,
        });
    }

    delDevServiceManager(params): Observable<any> {
        return this.http.delete<any>(this.devServiceManagersUrl + '/delDevServiceCompany', {
            params: params
        });
    }

    /**
     * 下载文件
     * @param url
     */
    downFile(data) {

        window.location.href = this.devServiceManagersUrl + '/downFile?userNo=' + data.userNo +
            '&token=' + data.token + '&no=' + data.no;
    }


    beforeDown(data): Observable<any> {
        return this.http.get<any>(this.devServiceManagersUrl +  '/beforeDown?userNo=' + data.userNo +
            '&token=' + data.token + '&no=' + data.no);

    }


    
    back() {
        this.location.back();
    }

}
