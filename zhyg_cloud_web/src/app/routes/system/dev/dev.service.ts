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
export class DevService {
    private devsUrl = `${environment.SERVER_URL}` + '/system';

    /**
     * 自助银行标志  重庆银行所需
     */
    selfBankInfo = [
        {no: '1', name: '是'},
        {no: '0', name: '否'}
    ];
    /**
     * 离行在行标志
     */
    awayFlagInfo = [
        {no: '1', name: '在行'},
        {no: '2', name: '离行'}
    ];
    /**
     * 经营方式
     */
    workTypeInfo = [
        {no: '1', name: '自营'},
        {no: '2', name: '联营'},
    ];
    /**
     * 厂商sp类型
     */
    spInfo = [
        {no: '1', name: 'SP'}
    ];
    /**
     * 设备状态
     */
    status = [
        {no: '1', name: '启用'},
        {no: '2', name: '未启用'}
    ];
    /**
     * 有线无线标志
     */
    netTypeInfo = [
        {no: 'C', name: '有线'},
        {no: 'W', name: '无线'}
    ];
    /**
     * 安装方式
     */
    setupTypeInfo = [
        {no: '0', name: '大堂'},
        {no: '1', name: '穿墙'}
    ];

    investmentInfo = [
        {no: '1', name: '总行'},
        {no: '2', name: '分行'},
        {no: '3', name: '支行'}
    ];



    constructor(private http: HttpClient,
                private location: Location) {
    }

    getInvestmentInfo() {
        return this.investmentInfo;
    }

    getDevs(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/dev/qryDev', {
            params: params
        });
    }
    getOrgTypes(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/dev/qryOrgTypes', {
            params: params
        });
    }

    getDev(no): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/dev/qryDevById', {
            params: {no: no}
        });
    }

    addDev(params, auditParams): Observable<any> {
        return this.http.post<any>(this.devsUrl + '/dev/addDev', params, {
            headers: auditParams
        });
    }

    modDev(before, current, auditParams): Observable<any> {
        return this.http.post<any>(this.devsUrl + '/dev/modDev', {
            before: before,
            current: current
        }, {
            headers: auditParams
        });
    }

    delDev(params): Observable<any> {
        return this.http.delete<any>(this.devsUrl + '/dev/delDev', {
            params: params
        });
    }

    delDevAudit(params, auditParams): Observable<any> {
        return this.http.delete<any>(this.devsUrl + '/dev/delDev', {
            params: params,
            headers: auditParams,
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

    getAwayFlagInfo() {
        return this.awayFlagInfo;
    }

    getWorkTypeInfo() {
        return this.workTypeInfo;
    }

    getSpInfo() {
        return this.spInfo;
    }

    getNetTypeInfo() {
        return this.netTypeInfo;
    }

    getStatus() {
        return this.status;
    }

    getSetupTypeInfo() {
        return this.setupTypeInfo;
    }

    getSelfBankInfo() {
        return this.selfBankInfo;
    }

    back() {
        this.location.back();
    }

}
