import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import 'rxjs/add/operator/map';
import {environment} from '@env/environment';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class DemoDashboardService {

    private bkwdMonitorUrl = `${environment.SERVER_URL}` + '/monitor';

    constructor(private http: HttpClient,
                private session: SessionService) {
    }

    getWdOpenRate(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/wdmonitor/qryWdOpenRate', {
            params: params
        });
    }

    getWdWeekTransInfo(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/wdmonitor/qryWdWeekTransInfo', {
            params: params
        });
    }

    getWdMonthTransInfo(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/wdmonitor/qryWdMonthTransInfo', {
            params: params
        });
    }

    getWdDevCatalogTransUsedInfo(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/wdmonitor/qryWdDevCatalogTransUsedInfo', {
            params: params
        });
    }

    getWdDevCatalog(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/wdmonitor/qryWdDevCatalog', {
            params : params
        });
    }

    getWdTransType(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/wdmonitor/qryWdTransType', {
            params : params
        });
    }

    getScreenDef() {
        return this.http.post('/visible/screen/qryScreenInfo', {})
            .map((val: any) => JSON.parse(val.data.content));
    }

    updateScreenDef(newDef) {
        return this.http.post('/visible/screen/updateScreenInfo', {content: newDef});
    }

    // 获取自定义的图表类型
    getSelfDefCharts() {
        return this.http.post('/visible/chartsManage/chart/qryChartList', {
            chartOrgNo_Query: this.session.getUserSession().orgNo
        }).map(data => {
            console.log(data);
            data['retList'].forEach(val => {
                val.id = val.chartId;
                console.log(val);
                if (val.type === '10') {
                    val.children = JSON.parse(val.optionMsg);
                }
            });
            return data['retList'];
        });
    }

    // 根据id获取图表详细信息
    getOptionAndDataById(id) {
        return this.http.post('/visible/chartsManage/chart/qryServiceDataAndView', {
            chartId: id
        }).map(data => {
            console.log(data);
            return {
                element: data['retData']
            };
        });
    }

    getWdOpenRateRanking(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/bigScreen/qryWdOpenRateRanking', {
            params: params
        });
    }

    getWdTransInfoRanking(params): Observable<any> {
        return this.http.get<any>(this.bkwdMonitorUrl + '/bigScreen/qryWdTransInfoRanking', {
            params: params
        });
    }


}
