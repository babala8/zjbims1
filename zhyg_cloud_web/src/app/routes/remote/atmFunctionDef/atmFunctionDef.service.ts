import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AtmFunctionDefService {

    private atmFunctionUrl = `${environment.SERVER_URL}` + '/control/atmFunction';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 交易类别名称
     */
    transTypeList = [
        {name: '普通交易', no: '0'},
        {name: '现金交易', no: '1'}
    ];


    getTransTypeList() {
        return this.transTypeList;
    }

    /**
     * 查询交易类型功能列表
     */
    getAtmFunctionDef(params): Observable<any> {
        return this.http.get<any>(this.atmFunctionUrl + '/qryAtmFunctionDef', {
            params: params
        });
    }

    /**
     * 添加交易类型功能
     * 功能定义设定
     */
    addAtmFunctionDef(params): Observable<any> {
        return this.http.post(this.atmFunctionUrl + '/addAtmFunctionDef', params);
    }

    /**
     * 删除交易类型功能
     * @param param
     */
    delAtmeFunctionDef(devs): Observable<any> {
        return this.http.delete<any>(this.atmFunctionUrl, {
            params: devs
        });
    }

    back() {
        this.location.back();
    }
}
