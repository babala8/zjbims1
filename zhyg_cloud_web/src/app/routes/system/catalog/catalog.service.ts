import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class CatalogService {

    private catalogUrl = `${environment.SERVER_URL}` + '/system/catalog';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getCatalogs(params): Observable<any> {
        return this.http.get<any>(this.catalogUrl + '/qryCatalog', {
            params: params
        });
    }


    getCatalog(no): Observable<any> {
        return this.http.get<any>(this.catalogUrl + '/qryCatalogById', {
            params: {no: no}
        });
    }

    addCatalog(params): Observable<any> {
        return this.http.post<any>(this.catalogUrl + '/addCatalog', params);
    }

    modCatalog(before, current): Observable<any> {
        return this.http.post<any>(this.catalogUrl + '/modCatalog', {
            before: before,
            current: current,
        });
    }

    delCatalog(params): Observable<any> {
        return this.http.delete<any>(this.catalogUrl + '/delCatalog', {
            params: params
        });
    }


    back() {
        this.location.back();
    }

}
