import {Component, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {environment} from '@env/environment';
import {AtmFunctionService} from '../atmFunction.service';
import {WebSocketService} from '../../webSocketService';

@Component({
    templateUrl: './atmFunctionDetail.html',
})
export class AtmFunctionDetailComponent implements OnInit, OnDestroy {
    devList;
    devCatalog;

    sessionId; // 连接websocket的id
    transTypeList = []; // 存放交易类型，里面存放 交易名称 ，交易信息
    atmFunctions = []; // 这是所有的交易信息
    number; // 后端获取的所有功能数

    showDevs = true;
    loadResult = false;
    selDevNum = 0;
    controlResult = []; // 功能定义的控制结果
    resultSerial = 1; // 控制结果的序号


    constructor(
        private fb: FormBuilder,
        private message: NzMessageService,
        private session: SessionService,
        private atmFunctionService: AtmFunctionService,
        private webSocketService: WebSocketService,
        private nzModal: NzModalSubject) {

    }

    ngOnInit(): void {
        this.loadResult = true;
        // 查询atm功能定义
        const params = {
            devList: this.devList,
            devCatalog: this.devCatalog
        };
        this.atmFunctionService.getAtmFunction(params).subscribe(
            _data => {
                if (_data.data) {
                    this.loadResult = false;
                    const temp = _data.data.result;
                    const resultName = []; // 存放的是交易类型名字
                    const resultNum = []; // 存放的是各交易类型对应的数量
                    console.log('==========数据===');
                    console.log(_data.data);
                    this.number = _data.data.number;
                    for ( let i = 0; i < temp.length; i = i + 1) {
                        resultName.push(temp[i][0]);
                        resultNum.push(temp[i][1]);
                    }
                    console.log(resultName);
                    for (let i = 0; i < resultName.length; i++) {
                        const atmFun = []; // 存放的是和resultName[i]中对应的交易信息
                        const atmFunList = []; // 存放的是所有行记录，一行最多5条记录
                        _data.data.atmFunction.forEach( functionTemp => {
                            functionTemp.checked = this.onFunctionSelect(functionTemp.transFlag);
                            if (functionTemp.transType == resultName[i]) {
                                atmFun.push(functionTemp);
                                this.atmFunctions.push(functionTemp);
                            }
                        });
                        const atmFunNum = atmFun.length;
                        const flag = atmFunNum % 5;
                        for (let j = 0; j < Math.floor(atmFunNum / 5); j++) {
                            atmFunList.push([atmFun[j * 5], atmFun[j * 5 + 1], atmFun[j * 5 + 2], atmFun[j * 5 + 3], atmFun[j * 5 + 4]]);
                        }
                        if (flag == 1) {
                            atmFunList.push([atmFun[atmFunNum - 1]]);
                        } else if (flag == 2) {
                            atmFunList.push([atmFun[atmFunNum - 2], atmFun[atmFunNum - 1]]);
                        } else if (flag == 3) {
                            atmFunList.push([atmFun[atmFunNum - 3], atmFun[atmFunNum - 2], atmFun[atmFunNum - 1]]);
                        } else if (flag == 4) {
                            atmFunList.push([atmFun[atmFunNum - 4], atmFun[atmFunNum - 3], atmFun[atmFunNum - 2], atmFun[atmFunNum - 1]]);
                        }
                        this.transTypeList.push({name: resultName[i], atmFunList: atmFunList});
                    }
                    console.log('所有交易信息');
                    console.log(this.atmFunctions);
                    console.log(this.transTypeList);
                }
            },
            error => {
                console.log(error);
                this.loadResult = false;
                this.nzModal.destroy('onCancel');
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this._startWebSocket(); // 开启websocket监听
    }

    ngOnDestroy(): void {
        this.webSocketService.ws.close();
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }

    submit() {
        console.log('提交信息');
        const atmFuncSelTransNos = this.atmFunctions.filter( func => func.checked)
                                    .map( item => item.transNo);         // 选中的菜单编号保存
        let transNos = '';
        for (let i = 0; i < atmFuncSelTransNos.length; i++) {
            transNos += atmFuncSelTransNos[i] + '|';
        }
        const params = {
            devList: this.devList,
            number: this.number,
            atmFunction: transNos,
            devCatalog: this.devCatalog,
            user: this.session.getUserSession().account,
            sessionId: this.sessionId,
        };
        console.log('功能定义参数');
        console.log(params);
        this.selDevNum = this.devList.split(',').length - 1;
        this.atmFunctionService.atmFunctionSet(params)
            .subscribe(
                data => {
                    this.showDevs = false;
                    // this.showResult = true;
                    document.getElementById('resultDiv').style.display = 'block';
                    this.loadResult = true;
                    this.message.info('请求已发送，请等待结果');
                }, error => {
                    console.log(error);
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
    }

    /**
     * 开启功能定义结果推送监听
     */
    _startWebSocket() {
        const ws = this.webSocketService.createObservableSocket(`${environment.WEBSOCKET_URL}` + '/control/websocket?token='
            + this.session.token + '&userNo=' + this.session.getUserSession().account)
            .subscribe(
                _data => {
                    const data = JSON.parse(_data);
                    console.log('功能定义websocket:', data);
                    console.log(data);
                    if (data.sessionId && data.sessionId != '') {
                        this.sessionId = data.sessionId;
                    } else if (data.pushFlag && data.pushFlag == '1') {
                        this._pushControlResult(data);
                    }
                }, error => {
                    console.log(error);
                    // this.webSocketService.ws.close();
                    this.message.error('获取结果出错');
                }
            );
    }

    /**
     * 将推送的结果保存到表中
     * @param data
     */
    _pushControlResult(data) {
        console.log('push:', data);
        this.selDevNum--;
        this.controlResult.push({
            no: data.devNo,
            ip: data.ip,
            result: data.retFlag,
            resultContent: data.retMsg,
            serial: this.resultSerial++,
        });
        console.log(this.selDevNum);
        if (this.selDevNum == 0) {
            this.loadResult = false;
        }
    }

    /**
     * 判断该功能是否存在，存在则选中
     * @param value
     */
    onFunctionSelect(value: string) {
        if (value == '1') {
            return true;
        } else {
            return false;
        }
    }

    selectAll() {
        this.atmFunctions.forEach( x => {
            x.checked = true;
        });
    }
    selectNull() {
        this.atmFunctions.forEach( x => {
            x.checked = false;
        });
    }
    reverse() {
        this.atmFunctions.forEach( x => {
            x.checked = x.checked == true ? false : true;
        });
    }
}
