import {Injectable, Injector} from '@angular/core';
import {Router} from '@angular/router';
import {
    HttpInterceptor, HttpRequest, HttpHandler, HttpErrorResponse,
    HttpSentEvent, HttpHeaderResponse, HttpProgressEvent, HttpResponse, HttpUserEvent, HttpHeaders
} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {of} from 'rxjs/observable/of';
import {_throw} from 'rxjs/observable/throw';
import {mergeMap, catchError, debounceTime, filter} from 'rxjs/operators';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {environment} from '@env/environment';
import {SessionService} from '@core/session.service';
import * as _ from 'lodash';
import * as moment from 'moment';
import {RET_CODE} from './../constant';

/**
 * 默认HTTP拦截器，其注册细节见 `app.module.ts`
 */
@Injectable()
export class DefaultInterceptor implements HttpInterceptor {
    private msgChange$: BehaviorSubject<string> = new BehaviorSubject<string>(null);
    private errorCount = 0;
    constructor(private injector: Injector,
                private confirmServ: NzModalService) {
        this.msgChange$.pipe(debounceTime(1000), filter(value => !!value)).subscribe(
            msg => this.msg.error(msg)
        );
    }

    get msg(): NzMessageService {
        return this.injector.get(NzMessageService);
    }

    get session(): SessionService {
        return this.injector.get(SessionService);
    }

    private goTo(url: string) {
        setTimeout(() => this.injector.get(Router).navigateByUrl(url));
    }

    private handleData(event: HttpResponse<any>): Observable<any> {
        // 可能会因为 `throw` 导出无法执行 `_HttpClient` 的 `end()` 操作
        const body = event.body;
        if (body && body.retCode) {
            if (!body.retCode.startsWith(RET_CODE.SUCCESS)) {
                if (body.retCode === RET_CODE.TIMEOUT) {
                    this.session.clear();
                    this.goTo('/401');
                }
                // 继续抛出错误中断后续所有 Pipe、subscribe 操作，因此：
                // this.http.get('/').subscribe() 并不会触发
                return _throw(event);
            } else if (body.retCode.startsWith(RET_CODE.SUCCESS) && _.isNumber(body.curPage)) {
                body.curPage++;
            }
        }
        return of(event);
    }

    private handleError(event: HttpResponse<any> | HttpErrorResponse): Observable<any> {
        this.errorCount++;
        // 临时关闭错误处理，因为大屏展示后端为完成，会导致无法登陆
        switch (event.status) {
            case 200:
                break;
            case 401: // 未登录/会话超时状态码
                this.showMsg();
                this.goTo(this.session.login_url);
                break;
            // case 0:
            //     this.msgChange$.next('服务器连接异常');
            //     break;
            case 403:
            case 404:
            case 500:
                this.goTo(`/${event.status}`);
                break;
            case 900:
            case 901:
                this.goTo(this.session.login_url);
                break;
        }
        return _throw(event);
    }

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpSentEvent | HttpHeaderResponse | HttpProgressEvent
        | HttpResponse<any> | HttpUserEvent<any>> {
        // 统一加上服务端前缀
        let url = req.url;
        console.log('request:', url);
        if (!url.startsWith('https://') && !url.startsWith('http://')) {
            url = environment.SERVER_URL + url;
        }
        let headers = req.headers;
        // 从session获取userNo放入headers，token在delon.module中已经存入
        if (this.session.getUserSession() && this.session.getUserSession().account) {
            headers = headers.set('userNo', this.session.getUserSession().account);
            headers = headers.set('cache-control', 'no-cache');
        }
        const newReq = req.clone({
            url: url,
            withCredentials: true,
            body: req.body,
            headers: headers
        });
        return next.handle(newReq).pipe(
            mergeMap((event: any) => {
                // console.log('mergeMap', event);
                // 允许统一对请求错误处理，这是因为一个请求若是业务上错误的情况下其HTTP请求的状态是200的情况下需要
                if (event instanceof HttpResponse && event.status === 200) {
                    return this.handleData(event);
                }
                // 若一切都正常，则后续操作
                return of(event);
            }), catchError((err) => this.handleError(err))
        );
    }

    showMsg = () => {
        this.errorCount++;
        if (this.errorCount == 1) {
            const modal = this.confirmServ.info({
                title: '权限验证失败',
                content: '请重新登录',
                onOk: () => {
                    this.errorCount = 0;
                },
                onCancel: () => {
                    this.errorCount = 0;
                },
            });
        }
    }

}
