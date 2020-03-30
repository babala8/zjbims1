import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class BenchmarkService {

    private benchmarkUrl = `${environment.SERVER_URL}` + '/content/appModel';
    private versionUrl = `${environment.SERVER_URL}` + '/content/appVersion';

    private updateModes = [
        {no: '1', name: '立即生效'},
        {no: '2', name: '定时生效'},
        {no: '3', name: '重启生效'},
    ];

    private synModes = [
        {no: '1', name: '立即同步'},
        {no: '2', name: '开机同步'},
        {no: '3', name: '闲时同步'},
    ];

    private modelType = [
        {no: '1', name: '基础标杆'},
        {no: '2', name: '特色标杆'}
    ];

    constructor(
        private http: HttpClient,
        private location: Location
    ) {
    }

    /**
     * 查询标杆下已部署的应用版本信息
     * @param params
     */
    qryDeployVersion(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/qryDeployVersion', params);
    }

    /**
     * 查询应用版本信息
     * @param params
     */
    qryAllAppVersions(params): Observable<any> {
        return this.http.post<any>(this.versionUrl + '/qryVersion', params);
    }

    /**
     * 添加标杆部署的应用
     * @param params
     */
    addAppVersions(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/addModelApp', params);
    }

    /**
     * 批量查询应用历史版本信息
     * @param params
     */
    qryHistoryVersions(params) {
        return this.http.post<any>(this.versionUrl + '/qryHistoryVersion', params);
    }

    /**
     * 删除应用
     * @param params
     */
    delAppVersion(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/delModelApp', params);
    }

    getUpdateModes(): { no: string, name: string }[] {
        return this.updateModes;
    }

    getSynModes(): { no: string, name: string }[] {
        return this.synModes;
    }

    getModelType(): {no: string, name: string}[] {
        return this.modelType;
    }

    /**
     * 修改应用部署参数
     * @param params
     */
    modAppParam(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/modModelDeploy', params);
    }

    /**
     * 修改版本应用参数
     * @param params
     */
    modAppVersion(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/modModelAppVersion', params);
    }

    /**
     * 标杆同步
     * @param params
     */
    synBenchmark(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/synModel', params);
    }

    /**
     * 范围同步
     * @param params
     */
    synModel(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/synModelByRange', params);
    }

    /**
     * 添加标杆
     * @param params
     */
    addModel(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/addModel', params);
    }

    /**
     * 修改标杆
     * @param params
     */
    modifyModel(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/modModel', params);
    }

    qryModel(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/qryModel', params);
    }

    /**
     * 查询标杆已选择范围
     * @param params
     */
    qryModelRange(params): Observable<any> {
        return this.http.get<any>(this.benchmarkUrl + '/qryModelRange', {
            params: params
        });
    }

    /**
     * 查询该标杆所属机构下已分配设备-同机构下特色标杆中设备不能重复
     * @param params
     */
    qrySelectedDevNo(params): Observable<any> {
        return this.http.get<any>(this.benchmarkUrl + '/qrySelectedDevNo', {
            params: params
        });
    }

    qryModelById(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/qryModelById', params);
    }

    qryModelApps(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/qryModelApps', params);
    }

    back() {
        this.location.back();
    }

    delModel(params): Observable<any> {
        return this.http.delete<any>(this.benchmarkUrl + '/delModel', {params: params});
    }

    /**
     * 保存标杆范围
     * @param params
     */
    rangeModel(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/rangeModel', params);
    }

    /**
     * 删除标杆范围
     * @param params
     */
    delModelRange(params): Observable<any> {
        return this.http.post<any>(this.benchmarkUrl + '/delModelRange', params);
    }

    /**
     * 查询设备品牌、型号、类型列表
     * @param params
     */
    qryAllBrand(params) {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/vendor/qryVendor', {
            params: params
        });
    }
    qryAllType(params) {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/type/qryType', {
            params: params
        });
    }
    qryAllCatalog(params) {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/catalog/qryCatalog', {
            params: params
        });
    }

    /**
     * 查询设备信息列表
     * @param params
     */
    qryDevInfo(params) {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/dev/qryDev', {
            params: params
        });
    }

    /**
     * 查询角色有权限的机构列表
     * @param params
     */
    getOrgs(params): Observable<any> {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/org/qryAuthOrg', {
            params: params
        });
    }

    getOrgTypesByGrade(orgGrade: string): Observable<any> {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/org/qryTypeByGrade', {
            params : {
                orgGrade: orgGrade
            }
        });
    }

    getOrg(params): Observable<any> {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/org/qryOrgs', {
            params: params
        });
    }

    /**
     * 查询所有设备型号
     */
    getDevTypeByVendor(params): Observable<any> {
        return this.http.get<any>(`${environment.SERVER_URL}` + '/system/type/qryType', {
            params: params
        });
    }

}
