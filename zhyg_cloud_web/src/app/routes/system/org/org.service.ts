import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class OrgService {

    private orgsUrl = `${environment.SERVER_URL}` + '/system/org';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getOrgs(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrgs', {
            params: params
        });
    }


    getOrg(orgNo): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrg', {
            params: {orgNo: orgNo}
        });
    }


    addOrg(params): Observable<any> {
        return this.http.post<any>(this.orgsUrl + '/addOrg', params);
    }

    modOrg(before, current): Observable<any> {
        return this.http.post<any>(this.orgsUrl + '/modOrg', {
            before: before,
            current: current
        });
    }

    delOrg(params): Observable<any> {
        return this.http.post<any>(this.orgsUrl + '/delOrg', params);
    }

    // qryAllOrgGrades(): Observable<any> {
    //     return this.http.post(this.orgsUrl + '/qryAllOrgTypes', {});
    // }

    getOrgTypesByGrade(orgGrade: string): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryTypeByGrade', {
            params: {
                orgGrade: orgGrade
            }
        });
    }

    getOrgTypesByOrgNo(orgNo: string): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrgTypesByOrgNo', {
            params: {userOrgNo: orgNo}
        });
    }

    getOrgType(no): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryOrgTypeByNo', {
            params: {no: no}
        });
    }

    getOrgCost(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryCost', {
            params: params
        });
    }

    setOrgCost(params): Observable<any> {
        return this.http.post<any>(this.orgsUrl + '/setCost', params);
    }

    back() {
        this.location.back();
    }

    /**
     * 查询银联标准地区列表
     * @param params
     */
    getCupAreaList(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryCupArea', {
            params: params
        });
    }

    /**
     * 查询升级省级地区列表
     * @param params
     */
    getProvinceAreaList(params): Observable<any> {
        return this.http.get<any>(this.orgsUrl + '/qryProvinceCityArea', {
            params: params
        });
    }

}
