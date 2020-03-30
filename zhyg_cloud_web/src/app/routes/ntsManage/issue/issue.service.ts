import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class IssueService {

    private bulletinUrl = `${environment.SERVER_URL}` + '/system/bulletin';

    constructor(private http: HttpClient,
                private location: Location) {

    }
    getBulletins(params): Observable<any> {
        return this.http.get<any>(this.bulletinUrl + '/qryBulletin', {
            params: params
        });
    }

    getBulletin(bulletinId): Observable<any> {
        return this.http.get<any>(this.bulletinUrl + '/qryBulletinById', {
            params: {bulletinId: bulletinId}
        });
    }

    addBulletin(params): Observable<any> {
        return this.http.post<any>(this.bulletinUrl + '/addBulletin', params);
    }

    modBulletin(params): Observable<any> {
        return this.http.post<any>(this.bulletinUrl + '/modBulletin', params);
    }

    delBulletin(params): Observable<any> {
        return this.http.delete<any>(this.bulletinUrl + '/delBulletin', {
            params: params
        });
    }


    back() {
        this.location.back();
    }




}

