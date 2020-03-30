import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class TransValueAnalysisService {
    private transWorthUrl = `${environment.SERVER_URL}` + '/analysis/transWorth';

    /**
     * 季度
     */
    quarterList = [
        {no: '1', name: '第一季度'},
        {no: '2', name: '第二季度'},
        {no: '3', name: '第三季度'},
        {no: '4', name: '第四季度'}
    ];

    constructor(private http: HttpClient) {
    }

    getTransWorth(params): Observable<any> {
        return this.http.get<any>(this.transWorthUrl, {params: params});
    }

    getQuarterList() {
        return this.quarterList;
    }
}
