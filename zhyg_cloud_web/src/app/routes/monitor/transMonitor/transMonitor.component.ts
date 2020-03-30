import {Component, OnDestroy, OnInit} from '@angular/core';
import {NzMessageService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
import {WebSocketService} from '../../remote/webSocketService';
import {SessionService} from '@core/session.service';

@Component({
    templateUrl: './transMonitor.html',
})
export class TransMonitorComponent implements OnInit, OnDestroy {
    loading = false;
    dataSet = [];
    maxLen = 20;
    color= '';

    constructor(
        private message: NzMessageService,
        private websocketService: WebSocketService,
        private session: SessionService
    ) {
    }

    ngOnInit(): void {
        this._startWebSocket();
    }

    ngOnDestroy(): void {
        this.websocketService.ws.close();
    }

    _startWebSocket() {
        // console.log('hello?');
        this.websocketService.createObservableSocket(`${environment.WEBSOCKET_URL}` + '/monitor/websocket/trans?token='
            + this.session.token + '&userNo=' + this.session.getUserSession().account)
            .subscribe(
                _data => {
                    const data = JSON.parse(_data);
                    // console.log('transInfo:', data);
                    this.dataSet.unshift(data);
                    if (this.dataSet.length > this.maxLen) {
                        this.dataSet.pop();
                    }
                }, error => {
                    console.log(error);
                    this.websocketService.ws.close();
                    this.message.error('交易信息推送异常');
                }
            );
    }


    checkBtn(color: string): boolean {

            if (color != '00') {
                this.color = 'red';
                return true;
            } else {
                this.color = '';
                return true;
            }

    }

}

