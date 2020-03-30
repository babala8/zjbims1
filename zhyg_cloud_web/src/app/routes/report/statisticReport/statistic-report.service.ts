import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {ResponseContentType } from '@angular/http';

@Injectable()
export class StatisticReportService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';
    private devsUrlReports = `${environment.SERVER_URL}` + '/reports';

    /**
     * 离行在行标志
     */
    reportDateType = [
        {no: '1', name: '日报'},
        // {no: '2', name: '周报'},
        {no: '3', name: '月报'},
        {no: '4', name: '年报'}
    ];
    /**
     * 离行在行标志
     */
    awayFlagInfo = [
        {no: '1', name: '在行'},
        {no: '2', name: '离行'},
        {no: '', name: '所有'}
    ];

    constructor(private http: HttpClient,
                private location: Location) {
    }


    parseParams(data) {
        try {
            const tempArr = [];
            for (let  i  in data) {
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


    getDevExcel(params) {
        window.location.href = this.devsUrlReports + '/statistic/faultInfoReport?' + this.parseParams(params);
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

    getReportDateType() {
        return this.reportDateType;
    }

    getAwayFlagInfo() {
        return this.awayFlagInfo;
    }


    openRateStatistic(params) {
        window.location.href = this.devsUrlReports + '/statisticType/openRate?' + this.parseParams(params);
    }

    devCountStatistic(params) {
        window.location.href = this.devsUrlReports + '/statisticType/devCount?' + this.parseParams(params);
    }

    retainCardInfo(params) {
        window.location.href = this.devsUrlReports + '/statisticType/retainCardInfo?' + this.parseParams(params);
    }

    transInfo(params) {
        window.location.href = this.devsUrlReports + '/statisticType/tradeInfo?' + this.parseParams(params);
    }

    openRateDetail(params) {
        window.location.href = this.devsUrlReports + '/statisticType/openRateDetail?' + this.parseParams(params);
    }

    softHardWareInfo(params) {
        window.location.href = this.devsUrlReports + '/base/softHardWareInfo?' + this.parseParams(params);
    }

    devAddCashInfo(params) {
        window.location.href = this.devsUrlReports + '/base/devAddCash?' + this.parseParams(params);
    }
    shortenInfo(params) {
        window.location.href = this.devsUrlReports + '/statisticType/shortenInfo?' + this.parseParams(params);
    }
    shortenDetailInfo(params) {
        window.location.href = this.devsUrlReports + '/base/shorten?' + this.parseParams(params);
    }
    poundage(params) {
        window.location.href = this.devsUrlReports + '/statisticType/poundage?' + this.parseParams(params);
    }
    qryAddCash(params) {
        window.location.href = this.devsUrlReports + '/base/qryAddCash?' + this.parseParams(params);
    }
    // openRateDetail(params) {
    //     window.location.href = this.devsUrlReports + '/openRateStatistic/cs?' + this.parseParams(params);
    // }
    // openRateDetail(params): Observable<any> {
    //    return   this.http.post<any>(this.devsUrlReports + '/openRateStatistic/openRateDetail?', params);
    // }

}
