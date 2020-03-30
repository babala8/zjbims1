import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class IstMonitorService {
    private devMonitorUrl = `${environment.SERVER_URL}` + '/monitor';

    private status = [
        {no: 'idc', name: '读卡器模块'},
        {no: 'pin', name: '密码键盘模块'},
        {no: 'siu', name: '传感器模块'},
        {no: 'cim', name: '存款模块'},
        {no: 'cdm', name: '取款模块'},
        {no: 'rpr', name: '凭条打印机模块'},
        {no: 'jpr', name: '日志打印机模块'},
        {no: 'dep', name: '信封模块'},
        {no: 'pbk', name: '存折打印机模块'},
        {no: 'irc', name: '身份证模块'},
        {no: 'spr', name: '结单打印模块'},
        {no: 'fpi', name: '指纹模块'},
        {no: 'icc', name: '非接触式读卡器模块'},
        {no: 'cam', name: '照相机模块'},
        {no: 'dpr', name: '盖章模块'},
        {no: 'ups', name: '不间断电源模块'},
        {no: 'chk', name: '支票读扫描模块'},
        {no: 'ttu', name: '文本终端单元模块'},
        {no: 'bcr', name: '二维码扫描仪模块'},
        {no: 'isc', name: '刷卡式读卡器模块'}
    ];

    convert(id: string): string {
        for (const i of this.status) {
            if (i.no == id) {
                return i.name;
            }
        }
    }

    constructor(private http: HttpClient,
                private location: Location) {
    }

    initDevMonitor(params): Observable<any> {
        return this.http.get<any>(this.devMonitorUrl + '/istmonitor/initDevMonitor', {
            params: params
        });
    }

    getDevList(params): Observable<any> {
        return this.http.get<any>(this.devMonitorUrl + '/istmonitor/qryDevList', {
            params: params
        });
    }

    getDevStatus(params): Observable<any> {
        return this.http.get<any>(this.devMonitorUrl + '/istmonitor/qryDevStatus', {
            params: params
        });
    }

    updateUserMonitorSelect(params): Observable<any> {
        return this.http.post(this.devMonitorUrl + '/istmonitor/updateUsrMonitorSelect', params);
    }

    back() {
        this.location.back();
    }

    getDevFaultInfo(params): Observable<any> {
        return this.http.get<any>(this.devMonitorUrl + '/istmonitor/qryDevFaultInfo', {
            params: params
        });
    }

    getCashBoxInfo(params): Observable<any> {
        return this.http.get<any>(this.devMonitorUrl + '/istmonitor/qryCashBoxInfo', {
            params: params
        });
    }

    parseCurrencyType(type: string): string {
      /*  if (type.indexOf(',') >= 0 ) {
            type = type.split(',', -1)[0];
        }*/
        let typeName = type;
        if (type == 'CNY' || type == 'RMB') {
            typeName = '人名币';
        }else if (type == 'HKD') {
            typeName = '港币';
        }else if (type == 'USD') {
            typeName = '美元';
        }
        return typeName;
    }
}
