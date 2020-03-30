import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class FaultQueryService {

    private faultQueryUrl = `${environment.SERVER_URL}` + '/monitor/case';
    private devsUrl = `${environment.SERVER_URL}` + '/system';


    /**
     * Case状态
     */
    CaseStatusInfo = [
        {no: '', name: '全部'},
        {no: 'O', name: '未关闭CASE'},
        {no: 'C', name: '已关闭CASE'}
    ];

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getCaseDevs(params): Observable<any> {
        return this.http.get<any>(this.faultQueryUrl + '/qryDevs', {
            params: params
        });
    }

    /**
     * 查询CASE状态
     */
    getCaseStatus() {
        return this.CaseStatusInfo;
    }

    /**
     * 查询所有故障类型
     */
    getAllCaseCatalog(params): Observable<any> {
        return this.http.get<any>(this.faultQueryUrl + '/qryAllCaseCatalog', {
            params: params
        });
    }

    /**
     * 查询所有设备模块
     */
    getAllModCatalog(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/devModCatalog/qryAllModCatalog', {
            params: params
        });
    }

    /**
     * 查询CASE
     */
    getCase(params): Observable<any> {
        return this.http.post<any>(this.faultQueryUrl + '/qryCase', params);
    }

    /**
     * 查询CASE详情信息
     */
    getCaseDetail(params): Observable<any> {
        return this.http.get<any>(this.faultQueryUrl + '/qryCaseDetail', {
            params: params
        });
    }

    /**
     * 查询CASE跟踪信息
     */
    getCaseFollow(params): Observable<any> {
        return this.http.get<any>(this.faultQueryUrl + '/qryCaseTrace', {
            params: params
        });
    }

    /**
     * 查询CASE通知信息
     */
    getCaseNotice(params): Observable<any> {
        return this.http.get<any>(this.faultQueryUrl + '/qryCaseNotify', {
            params: params
        });
    }

    back() {
        this.location.back();
    }

    /**
     * 关闭case
     */
    closeCase(params): Observable<any> {
        return this.http.get<any>(this.faultQueryUrl + '/closeCase', {
            params: params
        });
    }

}
