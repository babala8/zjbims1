import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class StaticIndService {

    private url = `${environment.SERVER_URL}` + '/analysis/staticInd';

    constructor(private http: HttpClient) {
    }

    /**
     * 查询静态指标
     */
    public getStaticItems(): Observable<any> {
        return this.http.get<any>(this.url + '/staticItems');
    }

    /**
     * 查询交易静态价值列表
     */
    public getStaticValueList(): Observable<any> {
        return this.http.get<any>(this.url);
    }

    /**
     * 保存修改
     * @param param
     */
    public saveStaticValues(param): Observable<any> {
        return this.http.post<any>(this.url, param);
    }

}

