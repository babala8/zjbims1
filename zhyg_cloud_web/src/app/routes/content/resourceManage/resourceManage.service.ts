import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class ResourceManageService {

    private resourceUrl = `${environment.SERVER_URL}` + '/content/resource';
    /**
     * 资源类型
     */
    resourceTypes = [
        {no: '1', name: '图片'},
        {no: '3', name: '文字'}
    ];

    constructor(private http: HttpClient) {
    }

    /**
     * 获取资源类型列表
     */
    getResourceTypes() {
        return this.resourceTypes;
    }

    /**
     * 查询资源列表
     */
    qryResources(param): Observable<any> {
        return this.http.get(this.resourceUrl, {
            params: param
        });
    }

    /**
     * 添加资源
     * @param param
     */
    addResource(param): Observable<any> {
        return this.http.post(this.resourceUrl, param);
    }

    /**
     * 修改资源
     * @param param
     */
    modResource(param): Observable<any> {
        return this.http.put(this.resourceUrl, param);
    }

    /**
     * 删除资源
     * @param param
     */
    delResource(param): Observable<any> {
        return this.http.delete(this.resourceUrl, {
            params: param
        });
    }

}
