import {Component, OnInit} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {ActivatedRoute, Router} from '@angular/router';
import {BenchmarkService} from '../benchmark.service';
import {BenchmarkApps} from '../../../../models/benchmarkApps';
import {HttpResponse} from '@angular/common/http';
import {AppVersionMerge} from '../../../../models/appVersionMerge';
import {BenchmarkAppParam} from '../../../../models/benchmarkAppParam';
import {SessionService} from '@core/session.service';
import {BenchmarkComponent} from '../benchmark.components';


@Component({
    selector: 'benchmark-deploy',
    templateUrl: './benchmark-deploy.html',
})
export class BenchmarkDeployComponent implements OnInit {

    formModel;
    loading = true;
    benchmarkNo;
    addVisible = false;
    paramVisible = false;
    appName_qry;
    current = 0;

    /**
     * 应用历史版本按应用标识合并结果
     */
    mergeHistoryVersions = {};
    /**
     * 此标杆未部署的应用版本信息
     */
    otherAppVersions: AppVersionMerge[] = [];

    /**
     * 添加app时的全选框的状态
     */
    allchecked = false;
    /**
     * 添加app时的全选框的样式
     */
    indeterminate = false;

    /**
     * 应用参数列表
     */
    params: BenchmarkAppParam[] = [];
    /**
     * 是否允许修改参数
     */
    modParam = true;
    /**
     * 同步方式和生效方式列表
     */
    updateModes: { no: string, name: string }[] = [];
    synModes: { no: string, name: string }[] = [];
    /**
     * 选择的同步方式和生效方式
     */
    updateMode;
    synMode;
    /**
     * 同步开始和结束的日期和时间
     */
    syn_start_time;
    syn_end_time;
    /**
     * 生效时间
     */
    update_time;

    constructor(
        private message: NzMessageService,
        private modal: NzModalService,
        private router: Router,
        private route: ActivatedRoute,
        private service: BenchmarkService,
        public benchmarkComponent: BenchmarkComponent,
        private session: SessionService,
    ) {
    }

    ngOnInit() {
        this.benchmarkNo = this.benchmarkComponent.editModel.logicId;
        this.updateModes = this.service.getUpdateModes();
        // this.benchmarkNo = this.route.snapshot.paramMap.get('no');
        this.refreshData();
    }

    refreshData() {
        this.mergeHistoryVersions = {};
        this.benchmarkComponent.curVersion = [];
        this.loading = true;
        this.service.qryDeployVersion({
            modelId: this.benchmarkNo,
        }).subscribe(
            _data => {
                if (_data.data != null) {
                    this.benchmarkComponent.curVersion = _data.data;
                    this.benchmarkComponent.curVersion.forEach(x => {
                        if (x.description) {
                            if (x.description.length > 15) {
                                x.description = x.description.substr(0, 15) + '...';
                            }
                        } else {
                            x.description = '';
                        }
                        x.versionInfo = x.versionBusNo + '|' + x.versionNo + '|' + x.description;
                        // 批量查询应用版本信息
                        this.service.qryHistoryVersions({
                            appsId: x.appsId,
                            versionNo: x.versionNo
                        }).subscribe(
                            _ret => {
                                _ret.data.forEach(otherVersion => {
                                    if (otherVersion.description) {
                                        if (otherVersion.description.length > 15) {
                                            otherVersion.description = otherVersion.description.substr(0, 15) + '...';
                                        }
                                    } else {
                                        otherVersion.description = '';
                                    }
                                    otherVersion.versionInfo = otherVersion.versionBusNo + ' | ' + otherVersion.versionAppNo + ' | '
                                        + otherVersion.versionDescription;
                                    this.mergeVersions(otherVersion.appsId, otherVersion);

                                });
                                if (this.mergeHistoryVersions[x.appsId] && this.mergeHistoryVersions[x.appsId].length > 1) {
                                    this.mergeHistoryVersions[x.appsId].sort();
                                    this.mergeHistoryVersions[x.appsId].reverse();
                                }
                            }, error => {
                                // if (error instanceof HttpResponse) {
                                //     this.message.error(error.body.retMsg);
                                // }
                            }
                        );
                    });
                    this.benchmarkComponent.curVersion.sort();
                }
                console.log('当前版本信息' + this.benchmarkComponent.curVersion);

            }, error => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.loading = false;
    }

    /**
     * 将应用历史版本合并入数组中
     */
    mergeVersions(appsId, otherVersion) {
        if (!this.mergeHistoryVersions[appsId]) {
            this.mergeHistoryVersions[appsId] = [];
        }
        this.mergeHistoryVersions[appsId].push(otherVersion.versionInfo);

    }

    /**
     * 打开添加应用界面
     */
    showAdd() {
        this.addVisible = true;
        this.indeterminate = false;
        this.allchecked = false;
        this.qryAllAppVersions({});
    }

    /**
     * 去除已部署的应用并合并版本
     * @param allAppVersions
     */
    mergeVersions_add(allAppVersions): AppVersionMerge[] {
        const result: AppVersionMerge[] = [];
        // 已部署的应用名，减少遍历次数
        let deployedId = '';
        const deployedVersions = this.benchmarkComponent.curVersion.concat(this.benchmarkComponent.upperVersion);
        // 按appsId排序
        deployedVersions.sort((a: BenchmarkApps, b: BenchmarkApps) => {
            return a.appsId.localeCompare(b.appsId);
        });
        for (const i of allAppVersions) {
            if (i.appsId === deployedId) {
                continue;
            }
            // 应用是否已部署
            let deployed = false;
            for (const j of deployedVersions) {
                if (i.appsId === j.appsId) {
                    deployed = true;
                    // 记录已部署的应用名
                    deployedId = j.appsId;
                    break;
                }
            }
            if (deployed) {
                continue;
            }
            // 应用是否存在结果中
            let exist = false;
            for (const k of result) {
                if (k.appsId === i.appsId) {
                    k.versions.push(i.versionBusNo + '|' + i.versionAppNo);
                    exist = true;
                    break;
                }
            }
            if (!exist) {
                result.push(new AppVersionMerge(i.appsId, i.appsName, [i.versionBusNo + '|' + i.versionAppNo]));
            }
        }
        return result;
    }

    /**
     * 查询应用信息
     * @param params
     */
    qryAllAppVersions(params) {
        this.loading = true;
        this.otherAppVersions = [];
        this.service.qryAllAppVersions(params).subscribe(
            _data => {
                this.loading = false;
                if (_data.data.length === 0) { return; }
                this.otherAppVersions = this.mergeVersions_add(_data.data);
                this.otherAppVersions.forEach(x => {
                    // 添加app时默认选择第一个（按版本号降序）
                    x.versions.sort();
                    x.versions.reverse();
                    x.selectedVersion = x.versions[0];
                    x.versions.splice(0, 1);
                    x.updateMode = '1';
                    x.updateTime = new Date();
                });
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 改变应用版本
     * @param appId 应用标识
     * @param versionNo 选择的版本号
     * @param i 应用列表index
     * @param j 版本列表index
     * @param type 区分查询和添加
     */
    changeVersion(appId: string, versionInfo: string, i: number, j: number, type: string) {

        if (type === 'qry') {
            if (this.benchmarkComponent.curVersion[i].versionInfo === '选择版本') {
                this.mergeHistoryVersions[appId].splice(j, 1);
            } else {
                (this.mergeHistoryVersions[appId])[j] = this.benchmarkComponent.curVersion[i].versionInfo;
            }
            this.benchmarkComponent.curVersion[i].versionInfo = versionInfo;
            this.mergeHistoryVersions[appId].sort();
            this.mergeHistoryVersions[appId].reverse();

        } else {
            if (this.otherAppVersions[i].selectedVersion === '选择版本') {
                this.otherAppVersions[i].versions.splice(j, 1);
            } else {
                this.otherAppVersions[i].versions[j] = this.otherAppVersions[i].selectedVersion;
            }
            this.otherAppVersions[i].selectedVersion = versionInfo;
            this.otherAppVersions[i].versions.sort();
            this.otherAppVersions[i].versions.reverse();
        }
    }

    /**
     * 应用添加界面查询应用
     */
    searchApp() {
        this.qryAllAppVersions({appName: this.appName_qry});
    }

    /**
     * 返回全量结果
     */
    showAll() {
        this.qryAllAppVersions({});
        this.appName_qry = '';
    }

    /**
     * 选择应用
     * @param index
     */
    selectApp(index: number) {
        this.otherAppVersions[index].selected = !this.otherAppVersions[index].selected;
        this.updateSingleChecked();
    }

    /**
     * 全选所有app
     */
    selectAll(event) {
        this.indeterminate = false;
        this.otherAppVersions.forEach(item => item.selected = event);
    }

    updateSingleChecked() {
        if (this.otherAppVersions.every(item => item.selected === false)) {
            this.allchecked = false;
            this.indeterminate = false;
        } else if (this.otherAppVersions.every(item => item.selected === true)) {
            this.allchecked = true;
            this.indeterminate = false;
        } else {
            this.indeterminate = true;
        }
    }

    /**
     * 取消添加应用
     */
    cancelAdd() {
        this.addVisible = false;
        this.otherAppVersions = [];
    }

    /**
     * 确认添加应用
     */
    submitAdd() {
        const appList = [];
        for (const i of this.otherAppVersions) {
            if (i.selected) {
                if (i.selectedVersion === '选择版本') {
                    this.message.info('请选择版本！');
                    return;
                }
                if (i.updateMode == '2' && !i.updateTime) {
                    this.message.info('生效时间不能为空');
                    return;
                }
                const updateTime = this.formatDate(i.updateTime, 'yyyy-MM-dd HH:mm:ss');
                const versionNo: string = (i.selectedVersion.split('|'))[1].trim();
                appList.push({appsId: i.appsId, versionNo: versionNo, updateMode: i.updateMode, updateTime: updateTime});
            }
        }
        this.loading = true;
        this.service.addAppVersions({
            modelId: this.benchmarkNo,
            appList: appList
        }).subscribe(
            data => {
                this.message.success(data.retMsg);

                this.cancelAdd();
                this.refreshData();
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 删除应用
     * @param appId
     */
    confirmDel(appId: string) {
        this.loading = true;
        console.log(appId);
        this.service.delAppVersion({
            modelId: this.benchmarkNo,
            appsId: appId,
            userNo: this.session.getUserSession().account
        }).subscribe(
            data => {
                this.loading = false;
                this.message.success(data.retMsg);
                this.refreshData();
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    /**
     * 保存版本&& 设置参数
     * @param appsId
     * @param versionNo
     */
    setParam(item: BenchmarkApps) {
        const versionNoArr = item.versionInfo.split('|');
        const versionNo1 = versionNoArr[1].trim();
        console.log(item);
        if (item.updateMode != '2') {
            item.updateTime = new Date();
        }
        if (!item.updateTime) {
            this.message.error('生效时间不能为空');
            return;
        }
        // 修改应用版本
        this.service.modAppVersion({
            appsId: item.appsId,
            versionNo: versionNo1,
            updateMode: item.updateMode,
            updateTime: this.formatDate(item.updateTime, 'yyyy-MM-dd HH:mm:ss'),
            modelId: this.benchmarkNo,
            userNo: this.session.getUserSession().account
        }).subscribe(
            data => {
                this.message.success('设置成功');
            }, error => {
                this.message.error(error.body.retMsg);
            }
        );
    }

    /**
     * 取消设置参数
     */
    cancelParam() {
        this.modParam = true;
        this.params = [];
        this.paramVisible = false;
        this.syn_start_time = null;
        this.syn_start_time = null;
        this.update_time = null;
        this.updateMode = null;
        this.synMode = null;
    }

    /**
     * 校验同步时间
     */
    startTimeChange() {
        if (this.syn_start_time > this.syn_end_time) {
            this.syn_end_time = '';
        }
    }

    endTimeChange() {
        if (this.syn_start_time > this.syn_end_time) {
            this.syn_start_time = '';
        }
    }

    /**
     * 日期和字符串相互转换
     * @param date
     */
    formatDate(date: Date, fmt: string) {
        if (!date) {
            date = new Date();
        }
        const o = {
            'M+' : date.getMonth() + 1, // 月份
            'd+' : date.getDate(), // 日
            'h+' : date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, // 小时
            'H+' : date.getHours(), // 小时
            'm+' : date.getMinutes(), // 分
            's+' : date.getSeconds(), // 秒
            'q+' : Math.floor((date.getMonth() + 3) / 3), // 季度
            'S' : date.getMilliseconds() // 毫秒
        };
        const week = {
            '0' : '/u65e5',
            '1' : '/u4e00',
            '2' : '/u4e8c',
            '3' : '/u4e09',
            '4' : '/u56db',
            '5' : '/u4e94',
            '6' : '/u516d'
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
        }
        if (/(E+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? '/u661f/u671f' : '/u5468') : '')
                + week[date.getDay() + '']);
        }
        for (const k in o) {
            if (new RegExp('(' + k + ')').test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
            }
        }
        return fmt;
    }

    /**
     * 保存设置
     */
    submitParam() {
        const paramList: { paramKey: string, paramValue: string }[] = [];
        if (this.modParam) {
            for (const i of this.params) {
                if (i.inputType === 'checkbox') {
                    let temParamValue = '';
                    i.options.forEach(j => {
                        if (j.selected) {
                            temParamValue += j.value + '#';
                        }
                    });
                    temParamValue = temParamValue.substr(0, temParamValue.length - 1);
                    paramList.push({paramKey: i.paramKey, paramValue: temParamValue});
                } else {
                    paramList.push({paramKey: i.paramKey, paramValue: i.paramValue});
                }

            }
        }
        const params = {
            modelId: this.benchmarkNo,
            appsId: this.params[0].appsId,
            version: this.params[0].version,
            params: paramList,
            updateMode: this.updateMode,
            synMode: this.synMode,
            updateTime: '',
            synStartTime: '',
            synEndTime: '',
        };
        if (this.synMode === '3') {
            params.synStartTime = this.formatDate(this.syn_start_time, 'yyyy-MM-dd HH:mm:ss');
            params.synEndTime = this.formatDate(this.syn_end_time, 'yyyy-MM-dd HH:mm:ss');
        }
        if (this.updateMode === '2') {
            params.updateTime = this.formatDate(this.update_time, 'yyyy-MM-dd HH:mm:ss');
        }
        this.loading = true;
        this.service.modAppParam(params).subscribe(
            data => {
                this.loading = false;
                this.message.success(data.retMsg);
                this.cancelParam();
            }, error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    cancel() {
    }

    backModel() {
        this.benchmarkComponent.flag = true;
    }

    /**
     * 同步标杆
     */
    syn() {
        this.service.synBenchmark({
            modelId: this.benchmarkNo,
            userNo: this.session.getUserSession().account,
            orgNo: this.session.getUserSession().orgNo
        }).subscribe(
            data => {
                this.message.success(data.retMsg);
                this.back();
            }, error => {
                this.message.error(error.body.retMsg);
            }
        );
    }

    /**
     * 返回标杆查询页面
     */
    back() {
        this.router.navigateByUrl('/version/benchmark');
    }

    pre(): void {
        this.current -= 1;
    }

    next(): void {
        this.current += 1;
    }

    done(): void {
        console.log('done');
    }


}
