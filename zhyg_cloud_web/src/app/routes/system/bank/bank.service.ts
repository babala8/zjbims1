import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class BankService {

    private banksUrl = `${environment.SERVER_URL}` + '/system/bank';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getBanks(params): Observable<any> {
        return this.http.get<any>(this.banksUrl + '/qryBankManagerPerson', {
            params: params
        });
    }


    getBank(no): Observable<any> {
        return this.http.get<any>(this.banksUrl + '/qryBankManagerPersonById', {
            params: {no: no}
        });
    }

    addBank(params): Observable<any> {
        return this.http.post<any>(this.banksUrl + '/addBankManagerPerson', params);
    }

    modBank(before, current): Observable<any> {
        return this.http.post<any>(this.banksUrl + '/modBankManagerPerson', {
            before: before,
            current: current,
        });
    }

    delBank(no): Observable<any> {
        return this.http.delete<any>(this.banksUrl + '/delBankManagerPerson', {
            params: {no: no}
        });
    }


    back() {
        this.location.back();
    }

}
