import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class WebSocketService {
    ws: WebSocket;

    createObservableSocket(url: string): Observable<any> {
        // 创建连接
        this.ws = new WebSocket(url);
        return new Observable(
            observer => {
                // 收到服务端消息回调
                this.ws.onmessage = (event) => observer.next(event.data);
                // 出错回调
                this.ws.onerror = (event) => observer.error(event);
                // 关闭连接回调
                this.ws.onclose = () => {
                    console.log('推送服务已断开');
                    observer.complete();
                };
                // 连接上服务器时回调
                this.ws.onopen = () => {
                    console.log('已连接推送服务');
                };
                // 关闭连接
                return () => this.ws.close();
            }
        );
    }

    closeWebSockt(code, reason) {
        console.log('主动关闭websocket连接');
        this.ws.close(code, reason);
    }

    // 向服务端发送数据
    sendMessage(message: any) {
        // 将json对象转换为string后发送
        this.ws.send(JSON.stringify(message));
    }
}
