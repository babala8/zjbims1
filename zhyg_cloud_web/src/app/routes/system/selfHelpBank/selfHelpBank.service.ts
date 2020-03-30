import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class SelfHelpBankService {

    private selfHelpBankUrl = `${environment.SERVER_URL}` + '/system/selfHelpBank';

    constructor(private http: HttpClient,
                private location: Location) {

    }
    getSelfHelpBanks(params): Observable<any> {
        return this.http.get<any>(this.selfHelpBankUrl + '/qrySelfHelpBank', {
            params: params
        });
    }

    getSelfHelpBank(logicId): Observable<any> {
        return this.http.get<any>(this.selfHelpBankUrl + '/qrySelfHelpBankById', {
            params: {logicId: logicId}
        });
    }

    addSelfHelpBank(params): Observable<any> {
        return this.http.post<any>(this.selfHelpBankUrl + '/addSelfHelpBank', params);
    }

    modSelfHelpBank(before, current): Observable<any> {
        return this.http.post<any>(this.selfHelpBankUrl + '/modSelfHelpBank', {
            before: before,
            current: current,
        });
    }

    delSelfHelpBank(params): Observable<any> {
        return this.http.delete<any>(this.selfHelpBankUrl + '/delSelfHelpBank', {
            params: params
        });
    }
    getAreaData(): Observable<any> {
        return this.http.get(this.selfHelpBankUrl + '/getFormatArea');
    }


    back() {
        this.location.back();
    }




}

