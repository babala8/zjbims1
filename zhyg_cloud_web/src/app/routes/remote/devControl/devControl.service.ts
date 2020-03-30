import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class DevControlService {

    private rmiUrl = `${environment.SERVER_URL}` + '/control/remote';

    constructor(private http: HttpClient) {
    }

    /**
     * 日期相差天数
     * @param date1
     * @param date2
     */
    diffDate(date1, date2): number {
        let difference;
        if (date1 > date2) {
            difference = date1 - date2;
        } else {
            difference = date2 - date1;
        }
        return difference / 1000 / 60 / 60 / 24;
    }

    /**
     * 查询设备品牌
     * @param params
     */
    qryDevVendors(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/qryVendors');
    }


    /**
     * 查询设备类型
     * @param params
     */
    qryDevCatalogs(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/qryCatalogs');
    }

    /**
     * 查询设备型号
     * @param params
     */
    qryDevTypes(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/qryTypes');
    }

    /**
     * 查询设备列表
     * @param params
     */
    qryDevs(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/qryDevs', {
            params: params
        });
    }

    /**
     * 远程控制
     * @param cmdUrl
     * @param params
     */
    remoteControl(params): Observable<any> {
        return this.http.post(this.rmiUrl + '/cmd', params);
    }

    getSystemInfo(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/getSystemInfo', {
            params: params
        });
    }
    getStatusInfo(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/getStatusInfo', {
            params: params
        });
    }
    getSoftwareInfo(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/getSoftwareInfo', {
            params: params
        });
    }
    getHardtwareInfo(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/getHardtwareInfo', {
            params: params
        });
    }
    getProcessInfo(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/getProcessInfo', {
            params: params
        });
    }
    getLogInfo(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/getLogInfo', {
            params: params
        });
    }
    /**
     * 远程浏览
     * @param params
     */
    remoteView(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/remoteView', {
            params: params
        });
    }

    /**
     * 远程浏览文件下载
     * @param params
     */
    viewDownloadFile(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/downloadFile', {
            params: params
        });
    }

    /**
     * 远程浏览文件上传
     * @param params
     */
    viewUploadFile(params): Observable<any> {
        return this.http.post(this.rmiUrl + '/upload', params);
    }

    /**
     * 远程浏览执行文件
     * @param params
     */
    executeFile(params): Observable<any> {
        return this.http.post(this.rmiUrl + '/executeFile', params);
    }

    /**
     * 远程浏览删除文件
     * @param params
     */
    deleteFile(params): Observable<any> {
        return this.http.delete(this.rmiUrl + '/deleteFile', {
            params: params
        });
    }

    /**
     * 查询下载列表
     * @param params
     */
    getDownloadFileList(params): Observable<any> {
        return this.http.get(this.rmiUrl + '/qryDownloadFiles', {
            params: params
        });
    }

    /**
     * 检查文件是否正在下载
     * @param params
     */
    // checkDownloadStatus(params): Observable<any> {
    //     return this.http.post(this.rmiUrl + '/checkDownloadStatus', params);
    // }
}
