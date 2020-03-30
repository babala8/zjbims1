import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class VendorService {

    private vendorUrl = `${environment.SERVER_URL}` + '/system/vendor';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getVendors(params): Observable<any> {
        return this.http.get<any>(this.vendorUrl + '/qryVendor', {
            params: params
        });
    }

    // getcaseCataloglist(){
    //     return this.caseCatalogInfo;
    // }


    getVendor(no): Observable<any> {
        return this.http.get<any>(this.vendorUrl + '/qryVendorById', {
           params: {no: no}
        });
    }

    addVendor(params): Observable<any> {
        return this.http.post<any>(this.vendorUrl + '/addVendor', params);
    }

    modVendor(before, current): Observable<any> {
        return this.http.post<any>(this.vendorUrl + '/modVendor', {
            before: before,
            current: current,
        });
    }

    delVendor(params): Observable<any> {
        return this.http.delete<any>(this.vendorUrl + '/delVendor', {
            params: params
        });
    }


    back() {
        this.location.back();
    }

}
