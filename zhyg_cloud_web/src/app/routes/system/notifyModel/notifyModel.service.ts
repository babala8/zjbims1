import {Injectable} from '@angular/core';
import {environment} from '@env/environment';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class NotifyModelService {

    private notifyModelUrl = `${environment.SERVER_URL}` + '/system/notifyModel';

    constructor(private http: HttpClient) {
    }

    addNotifyModel(params): Observable<any> {
        return this.http.post<any>(this.notifyModelUrl + '/addNotifyModel', params);
    }

    getInfoSetByType(param): Observable<any> {
        return this.http.get<any>(this.notifyModelUrl + '/qryInfoSet', {
            params: param
        });
    }

}
