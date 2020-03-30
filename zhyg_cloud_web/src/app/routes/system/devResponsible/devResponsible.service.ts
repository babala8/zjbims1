import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class DevResponsibleService {

    private devsUrl = `${environment.SERVER_URL}` + '/system';


    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 查询设备责任人
     */
    getDevResponsor(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/devResponsor/qryDevResponsor', {
            params: params
        });
    }

    /**
     * 根据设备号，机构号查询已设置和未设置的设备责任人
     */
    getSetDevResponsor(params): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/devResponsor/qrySetDevResponsor', {
            params: params
        });
    }

    /**
     * 设置设备责任人
     */
    SetDevResponsor(params): Observable<any> {
        return this.http.post<any>(this.devsUrl + '/devResponsor/setDevResponsor', params);
    }

    getDev(no): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/dev/qryDevById', {
            params: {no: no}
        });
    }

    getOrg(orgNo): Observable<any> {
        return this.http.get<any>(this.devsUrl + '/org/qryOrg', {
            params: {orgNo: orgNo}
        });
    }



    back() {
        this.location.back();
    }

}
