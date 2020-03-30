import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class ControlResultService {

    private remoteUrl = `${environment.SERVER_URL}` + '/control/remote';

    /**
     * 查询命令
     */
    comamndList = [
        {no: '', name: '所有命令类型'},
        {no: '200003', name: '提取电子日志'},
        {no: '200007', name: '远程抓屏'},
        {no: '200008', name: '获取进程信息'},
        {no: '200016', name: '获取软件信息'},
        {no: '200021', name: '获取硬件信息'},
        {no: '200022', name: '获取系统信息'},
        {no: '200018', name: '远程浏览'},
        {no: '200005', name: '文件上传'},
        {no: '200099', name: '文件下载'},
        {no: '200006', name: '文件删除'},
        {no: '200001', name: '文件执行'},
        {no: '200014', name: '设备重启'},
        {no: '200015', name: '设备关机'},
        {no: '200024', name: '强制复位'},
        {no: '200026', name: '开启服务'},
        {no: '200027', name: '暂停服务'},
        {no: '200011', name: '检查网络连接'},
        {no: '200028', name: '检测状态'},
    ];

    constructor(private http: HttpClient,
                private location: Location) {
    }

    /**
     * 查询命令
     */
    getCommand() {
        return this.comamndList;
    }

    /**
     * 查询远程控制结果
     */
    getAllRemoteControl(params): Observable<any> {
        return this.http.get<any>(this.remoteUrl + '/qryResults', {
            params: params
        });
    }

    back() {
        this.location.back();
    }

    convert(commandId: string): string {
        let commandName;
        switch (commandId) {
            case '200003':
                commandName = '提取电子日志';
                break;
            case '200007':
                commandName = '远程抓屏';
                break;
            case '200008':
                commandName = '获取进程信息';
                break;
            case '200011':
                commandName = '检查网络连接';
                break;
            case '200014':
                commandName = '设备重启';
                break;
            case '200015':
                commandName = '设备关机';
                break;
            case '200016':
                commandName = '获取软件信息';
                break;
            case '200021':
                commandName = '获取硬件信息';
                break;
            case '200022':
                commandName = '获取系统信息';
                break;
            case '200024':
                commandName = '强制复位';
                break;
            case '200026':
                commandName = '开启服务';
                break;
            case '200027':
                commandName = '暂停服务';
                break;
            case '200028':
                commandName = '状态检测';
                break;
            case '200018':
                commandName = '远程浏览';
                break;
            case '200005':
                commandName = '文件上传';
                break;
            case '200099':
                commandName = '文件下载';
                break;
            case '200006':
                commandName = '文件删除';
                break;
            case '200001':
                commandName = '文件执行';
                break;
            default:
                commandName = '';
        }
        return commandName;
    }
}
