import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class TransInfoService {

    private monitorUrl = `${environment.SERVER_URL}` + '/monitor/transInfo';

    private transStatus = [
        {no: '1', name: '成功'},
        {no: '2', name: '失败'},
        {no: '3', name: '超时'}
    ];

    constructor(private http: HttpClient) {
    }

    /**
     * 查询交易类型列表
     */
    qryTransType(): Observable<any> {
        return this.http.get<any>(this.monitorUrl + '/transType');
    }

    /**
     * 查询交易状态列表
     */
    qryTransStatus(): { no: string, name: string }[] {
        return this.transStatus;
    }

    /**
     * 查询交易信息列表
     * @param params
     */
    qryTransInfo(params): Observable<any> {
        return this.http.get<any>(this.monitorUrl, {params: params});
    }

    downloadPdf(serverPath: string) {
        window.location.href = this.monitorUrl + '/download?serverpath=' + serverPath;
    }
    getPdf(txId: string) {
        window.location.href = this.monitorUrl + '/getPdf?txId=' + txId;
    }

    getMonitorUrl() {
        return this.monitorUrl;
    }
}
