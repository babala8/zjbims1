import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class MyApplyService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';


    constructor(private http: HttpClient,
                private location: Location) {
    }

    getMyApply(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/audit/qryMyApply', {
            params: params
        });
    }

    changeCommitStatus(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/audit/changeCommitStatus', {
            params: params
        });
    }


    back() {
        this.location.back();
    }

}
