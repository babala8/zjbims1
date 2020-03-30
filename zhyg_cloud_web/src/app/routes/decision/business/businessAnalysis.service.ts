import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class BusinessAnalysisService {

    private decisionUrl = `${environment.SERVER_URL}` + '/analysis/decision';

    constructor(private http: HttpClient) {
    }


    getTransCostTime(): Observable<any> {
        return this.http.get<any>(this.decisionUrl + '/qryCostTime');
    }

}
