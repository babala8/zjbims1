import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class ButtonService {

    private btnsUrl = `${environment.SERVER_URL}` + '/system/bulletin';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * ops为操作参数
     * @param userNo
     */
    getRedisBulletin(userNo: string ): Observable<any> {
        return this.http.get<any>(this.btnsUrl + '/qryRedis', {
            params: {
                userNo: userNo
            }
        });
    }



    back() {
        this.location.back();
    }

}
