import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class RetainCardService {

    private bulletinUrl = `${environment.SERVER_URL}` + '/system/bulletin';

    constructor(private http: HttpClient,
                private location: Location) {

    }



   /* delBulletin(params): Observable<any> {
        return this.http.delete<any>(this.bulletinUrl + '/delBulletin', {
            params: params
        });
    }*/


    back() {
        this.location.back();
    }




}

