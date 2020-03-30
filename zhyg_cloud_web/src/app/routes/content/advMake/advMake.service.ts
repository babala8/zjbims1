import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AdvMakeService {

    private advUrl = `${environment.SERVER_URL}` + '/content/adv';

    constructor(private http: HttpClient) {
    }

    /**
     * 广告类型
     */
    adTypeInfo = [
        {no: '1', name: '等待插卡广告'},
        {no: '2', name: '交易中广告'},
        {no: '3', name: '跑马灯文字通告'},
    ];

    /**
     * 获取广告类型列表
     */
    getAdTypeList() {
        return this.adTypeInfo;
    }

    qryAdvs(param): Observable<any> {
        return this.http.get(this.advUrl, {
            params: param
        });
    }

    addAdv(param): Observable<any> {
        return this.http.post(this.advUrl, param);
    }

    modAdv(param): Observable<any> {
        return this.http.put(this.advUrl, param);
    }

    delAdv(param): Observable<any> {
        return this.http.delete(this.advUrl, {
            params: param
        });
    }

    /**
     * 查询广告资源详细信息
     * @param params
     */
    qryResourceByNo(params): Observable<any> {
        return this.http.get(`${environment.SERVER_URL}` + '/content/resource/qryResourceByNo', {
            params: params
        });
    }

    /**
     * 查询所有设备类型
     */
    qryDevCatalog(): Observable<any> {
        return this.http.get(this.advUrl + '/devCatalog');
    }

    /**
     * 查询所有广告位
     */
    qryAdvSpace(): Observable<any> {
        return this.http.get(`${environment.SERVER_URL}` + '/content/adsSpace/qryAllAdsSpace');
    }

    formatDate(date: Date, fmt: string) {
        if (!date) {
            date = new Date();
        }
        const o = {
            'M+' : date.getMonth() + 1, // 月份
            'd+' : date.getDate(), // 日
            'h+' : date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, // 小时
            'H+' : date.getHours(), // 小时
            'm+' : date.getMinutes(), // 分
            's+' : date.getSeconds(), // 秒
            'q+' : Math.floor((date.getMonth() + 3) / 3), // 季度
            'S' : date.getMilliseconds() // 毫秒
        };
        const week = {
            '0' : '/u65e5',
            '1' : '/u4e00',
            '2' : '/u4e8c',
            '3' : '/u4e09',
            '4' : '/u56db',
            '5' : '/u4e94',
            '6' : '/u516d'
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        if (/(E+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? '/u661f/u671f' : '/u5468') : '')
                + week[date.getDay() + '']);
        }
        for (const k in o) {
            if (new RegExp('(' + k + ')').test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
            }
        }
        return fmt;
    }

}
