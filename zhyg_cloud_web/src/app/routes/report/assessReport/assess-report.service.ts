import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {ResponseContentType } from '@angular/http';

@Injectable()
export class AssessReportService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';
    private devsUrlReports = `${environment.SERVER_URL}` + '/reports';
    /**
     * 离行在行标志
     */
    awayFlagInfo = [
        {no: '1', name: '在行'},
        {no: '2', name: '离行'},
        {no: '', name: '所有'}
    ];
    /**
     * 经营方式
     */
    workTypeInfo = [
        {no: '1', name: '自营'},
        {no: '2', name: '联营'}
    ];
    /**
     * 设备维护商
     */
    devServiceInfo = [
        {no: '1', name: '紫金'}
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
        {no: '1', name: '有线'},
        {no: '2', name: '无线'}
    ];
    /**
     * 安装方式
     */
    setupTypeInfo = [
        {no: '1', name: '大堂'},
        {no: '2', name: '穿墙'}
    ];

    constructor(private http: HttpClient,
                private location: Location) {
    }


    parseParams(data) {
        try {
            const tempArr = [];
            for (let i in data) {
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
        window.location.href = this.devsUrlReports + '/base/devBaseInfoReport?' + this.parseParams(params);
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
    getDevServiceInfo() {
        return this.devServiceInfo;
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
    devAssess(params) {
        window.location.href = this.devsUrlReports + '/assess/devAssess?' + this.parseParams(params);
    }
    serviceAssess(params) {
        window.location.href = this.devsUrlReports + '/assess/serviceAssess?' + this.parseParams(params);
    }
    adminAssess(params) {
        window.location.href = this.devsUrlReports + '/assess/adminAssess?' + this.parseParams(params);
    }
    qryAccess(params) {
        window.location.href = this.devsUrlReports + '/assess/qryAccess?' + this.parseParams(params);
    }

}
