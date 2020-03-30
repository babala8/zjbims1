import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class DynamicIndService {

    private dynamicIndUrl = `${environment.SERVER_URL}` + '/analysis/dynamicInd';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getDynamicInd(params): Observable<any> {
        return this.http.get<any>(this.dynamicIndUrl, {params : params});
    }

    delDynamicInd(params): Observable<any> {
        return this.http.delete<any>(this.dynamicIndUrl, {params: params});
    }

    addIndicator(params): Observable<any> {
        return this.http.post<any>(this.dynamicIndUrl, params);
    }

    modDynamicInd(params): Observable<any> {
        return this.http.put<any>(this.dynamicIndUrl, params);
    }

    back() {
        this.location.back();
    }

    qryItemType(): Observable<any> {
        return this.http.get<any>(this.dynamicIndUrl + '/itemType', {});
    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    date2String(date): string {
        if (date instanceof Date) {
            const dateStr = date.toLocaleString();
            const tmp1 = dateStr.substring(0, dateStr.indexOf(' '));
            const index1 = tmp1.indexOf('/');
            const index2 = tmp1.indexOf('/', index1 + 1);
            const tmp2 = tmp1.substring(0, index1);
            let tmp3 = tmp1.substring(index1 + 1, index2);
            let tmp4 = tmp1.substring(index2 + 1);
            tmp3 = tmp3.length < 2 ? '0' + tmp3 : tmp3;
            tmp4 = tmp4.length < 2 ? '0' + tmp4 : tmp4;
            return tmp2 + '-' + tmp3 + '-' + tmp4;
        }
        return date;
    }

    time2String(time): string {
        if (time instanceof Date) {
            return time.toTimeString().substring(0, 9);
        }
        return time;
    }

}

