import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AdvertisementSpaceService {

    private advertisementSpaceUrl = `${environment.SERVER_URL}` + '/content/adsSpace';

    constructor(
        private http: HttpClient,
        private location: Location
    ) {
    }

    /**
     * 广告类型
     */
    adTypeInfo = [
        {no: '1', name: '等待插卡广告', url: 'WaitPicInfo', orderArr: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']},
        {no: '2', name: '交易中广告', url: 'TransPicInfo', orderArr: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']},
        {no: '3', name: '跑马灯文字通告', url: 'TextInfo', orderArr: ['1']},
    ];

    /**
     * 广告位状态
     */
    adSpaceStatusInfo = [
        {no: '1', name: '可用'},
        {no: '2', name: '不可用'}
    ];

    /**
     * 查询广告位
     */
    getAdvertisementSpace(params): Observable<any> {
        return this.http.get<any>(this.advertisementSpaceUrl + '/qryAdsSpace', {
            params: params
        });
    }

    /**
     * 查询所有广告位信息
     */
    getAllAdSpace(params): Observable<any> {
        return this.http.get<any>(this.advertisementSpaceUrl + '/qryAllAdsSpace', {
            params: params
        });
    }

    /**
     * 添加广告位
     */
    addAdvertisementSpace(params): Observable<any> {
        return this.http.post(this.advertisementSpaceUrl + '/addAdsSpace', params);
    }

    /**
     * 修改广告位
     */
    modAdvertisementSpace(params): Observable<any> {
        return this.http.post(this.advertisementSpaceUrl + '/modAdsSpace', params);
    }

    /**
     * 删除广告位
     */
    deleteAdvertisementSpace(adsSpaceId): Observable<any> {
        return this.http.delete<any>(this.advertisementSpaceUrl + '/delAdsSpace', {
            params: {id: adsSpaceId}
        });
    }

    /**
     * 禁用广告位
     */
    disableAdvertisementSpace(id): Observable<any> {
        return this.http.get(this.advertisementSpaceUrl + '/stopAdsSpace', {
            params: {id: id}
        });
    }

    /**
     * 根据广告编号查询广告位
     */
    getAdvertisementSpaceById(adsSpaceId): Observable<any> {
        return this.http.get<any>(this.advertisementSpaceUrl + '/qryAdsSpaceById', {
            params: {adsSpaceId: adsSpaceId}
        });
    }

    /**
     * 获取广告类型列表
     */
    getAdTypeList() {
        return this.adTypeInfo;
    }

    /**
     * 获取广告位状态
     */
    getAdSpaceStatusList() {
        return this.adSpaceStatusInfo;
    }

    getAdSpaceStatusName(no: string): string {
        for (const i of this.adSpaceStatusInfo) {
            if  (i.no == no) {
                return i.name;
            }
        }
    }

    getAdTypeByNo(no: string): any {
        for (const i of this.adTypeInfo) {
            if  (i.no == no) {
                return i;
            }
        }
        return {no: '', name: '', url: '', orderArr: []};
    }
}
