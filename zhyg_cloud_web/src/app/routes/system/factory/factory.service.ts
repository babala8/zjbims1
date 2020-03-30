import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class FactoryService {

    private factorysUrl = `${environment.SERVER_URL}` + '/system/factory';
    private devServiceManagersUrl = `${environment.SERVER_URL}` + '/system/devServiceManager';

    /**
     * 状态
     */
    status = [
        {no: '1', name: '启用'},
        {no: '2', name: '未启用'}
    ];
    constructor(private http: HttpClient,
                private location: Location) {
    }

    getFactorys(params): Observable<any> {
        return this.http.get<any>(this.factorysUrl + '/qryFactoryManagerPerson', {
            params: params
        });
    }


    getFactory(no): Observable<any> {
        return this.http.get<any>(this.factorysUrl + '/qryFactoryManagerPersonById', {
            params: {no: no}
        });
    }

    addFactory(params): Observable<any> {
        return this.http.post<any>(this.factorysUrl + '/addFactoryManagerPerson', params);
    }

    modFactory(before, current): Observable<any> {
        return this.http.post<any>(this.factorysUrl + '/modFactoryManagerPerson', {
            before: before,
            current: current,
        });
    }

    delFactory(params): Observable<any> {
        return this.http.delete<any>(this.factorysUrl + '/delFactoryManagerPerson', {
            params: params
        });
    }

    getDevServiceManagers(params): Observable<any> {
        return this.http.get<any>(this.devServiceManagersUrl + '/qryDevServiceCompany', {
            params: params
        });
    }
    getStatus() {
        return this.status;
    }


    back() {
        this.location.back();
    }

}
