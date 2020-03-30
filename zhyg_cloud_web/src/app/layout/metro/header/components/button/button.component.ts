import {Component, OnInit, TemplateRef} from '@angular/core';
import {SessionService} from '@core/session.service';
import {SettingsService} from '@zjft/theme';
import {ButtonService} from './button.service';
import {NzModalService, NzNotificationService} from 'ng-zorro-antd';
import {Router} from '@angular/router';
import {WebSocketService} from '../../../../../routes/remote/webSocketService';
import {environment} from '@env/environment';

@Component({
    selector: 'header-button',
    templateUrl: './button.component.html',
    styleUrls: ['./button.component.less']
})
export class HeaderButtonComponent implements OnInit {
    dot = true;
    count = 0;
    constructor(private sessionService: SessionService,
                private btnService: ButtonService,
                private modal: NzModalService,
                private notification: NzNotificationService,
                private router: Router,
                private webSocketService: WebSocketService,
                public settings: SettingsService) {
    }

    toggle() {
        $('app-layout').toggleClass('aside-expanded');
        this.btnService.getRedisBulletin(this.sessionService.account).subscribe( data => {
            if (data.retCode) {
                this.count = data.data.count;
            }else {
                console.log(data.retMsg);
            }
        });

    }

    logout() {
        this.webSocketService.closeWebSockt(1000, '用户登出');
        this.sessionService.logout();
    }

    ngOnInit() {
        // 调用监听
        this._startWebSocket();
    }

    /**
     * 公告弹出框modal
     */
   showMessage() {
       const modal = this.modal.info({
           title: '系统公告',
           content: '您有新的系统公告，请注意查看',
           showConfirmLoading: true,
           cancelText: '知道了',
           closable: true,
           okText: '前往查看',

           onOk: () => {
               return new Promise(resolve => {
                   this.toggle();
                   this.router.navigateByUrl('/system/bulletin');
                    setTimeout(resolve, 1000);
               });

           }
       });
   }

    /**
     * 公告框弹出notification
     */
   showNotification() {
       this.notification.info('新的系统公告', '您有新的系统公告，请注意查看', {nzDuration: 5000});

   }

    /**
     * 开启监听，推送公告
     * @private
     */
   _startWebSocket() {
       const  ws = this.webSocketService.createObservableSocket(`${environment.WEBSOCKET_URL}` + '/system/websocket?token=' +
           this.sessionService.token + '&userNo=' + this.sessionService.account).subscribe(
           _data => {
               const data = JSON.parse(_data);
               console.log('websocket:', data);
               if (data.res == 'true') {
                   if (data.count != '-1') {
                       this.count = data.count;
                   }
                  // this.showMessage();
                   this.showNotification();
               }
       }, error => {
               console.log(error);
           }
           );

   }
}
