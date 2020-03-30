import {Injectable} from '@angular/core';
import {environment} from '@env/environment';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class ModCatalogService {

    private modCatalogUrl = `${environment.SERVER_URL}` + '/system/devModCatalog/qryAllModCatalog';
    constructor(private http: HttpClient) {
    }

    getModCatalogs(params): Observable<any> {
        return this.http.get<any>(this.modCatalogUrl, {
            params: params
        });
    }

}
