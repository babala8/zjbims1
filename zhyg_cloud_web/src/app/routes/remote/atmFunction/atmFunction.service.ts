import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AtmFunctionService {

    private atmFunctionUrl = `${environment.SERVER_URL}` + '/control/atmFunction';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 查询功能列表
     */
    getAtmFunction(params): Observable<any> {
        return this.http.get<any>(this.atmFunctionUrl + '/getAtmFunction', {
            params: params
        });
    }

    /**
     * 功能定义设定
     */
    atmFunctionSet(params): Observable<any> {
        return this.http.get<any>(this.atmFunctionUrl + '/createOrUpdateAtmFunction', {
            params: params
        });
    }

    back() {
        this.location.back();
    }
}
