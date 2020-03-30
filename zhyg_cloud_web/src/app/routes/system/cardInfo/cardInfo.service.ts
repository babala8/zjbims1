import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class CardInfoService {

    private cardInfoUrl = `${environment.SERVER_URL}` + '/business/cardInfo';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getCardInfo(params): Observable<any> {
        return this.http.get<any>(this.cardInfoUrl + '/qryCardInfo', {
            params: params
        });
    }

    addCardInfo(params): Observable<any> {
        return this.http.post<any>(this.cardInfoUrl + '/addCardInfo', params);
    }

    modCardInfo(params): Observable<any> {
        return this.http.post<any>(this.cardInfoUrl + '/modCardInfo', params);
    }

    delCardInfo(params): Observable<any> {
        return this.http.delete<any>(this.cardInfoUrl + '/delCardInfo', {
            params: params
        });
    }


    back() {
        this.location.back();
    }

    convertFlag(idflag: string) {
        if (idflag == '1') {
            return '磁道1';
        } else if (idflag == '2') {
            return '磁道2';
        } else if (idflag == '3') {
            return '磁道3';
        }
    }

    convertType(cardType: string) {
        if (cardType == '001') {
            return '本行借记卡';
        } else if (cardType == '002') {
            return '本行信用开';
        } else if (cardType == '003') {
            return '本行一账通卡';
        } else if (cardType == '004') {
            return '单位结算卡';
        } else if (cardType == '005') {
            return '存折';
        } else if (cardType == '011') {
            return '村镇借记卡';
        } else if (cardType == '012') {
            return '村镇贷记卡';
        } else if (cardType == '998') {
            return '他行卡';
        } else if (cardType == 'AAA') {
            return '帐号';
        }
    }

    convertLocFlag(localflag: string) {
        if (localflag == '1') {
            return '本行卡';
        } else if (localflag == '2') {
            return '村镇银行卡';
        } else if (localflag == '3') {
            return '银联卡';
        } else if (localflag == '4') {
            return 'VISA';
        } else if (localflag == '5') {
            return 'JETCO';
        }
    }

}
