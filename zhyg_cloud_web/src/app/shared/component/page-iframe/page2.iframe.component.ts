/**
 * 用法 ：html: <page2-iframe
     [srcUrl]="vuelink"
    [linkKey]="linkKey"
    [initData]="initdata"
   (getdata)="getSonData($event)"
 ></page2-iframe>
 1，srcUrl (必填)，所需连接的页面的url
 2，linkKey (必填)，为了安全约定的口令，建议字符串。该值一定要唯一，不能和其他组件一样，否则可能会引起一些错误
 3，initData(非必填)， 成功连接后，angular主动下发的初始化数据（token usrNo 默认已经带上）
 4, 接受信息时会触发 getdata事件
 *
 *
 *
 *
 * 以下不属于用法，修改组件时查看
 * angular 和vue中通过组件维护每一个iframe连接，双方通过match 属性判断 是否允许通信传值
match 置true 参考 http 三次握手协议 --baxian*/

/**  传输数据格式：
*  需要约定格式，方便处理不同类型的数据（初始化数据，主动推送数据等。。）数据格式可以后续优化
* data :object
* {
*    type: '100', '101','200'..   //100  约定1开头代表angular发送的数据，2 为vue发送的数据
 *    linkKey:String|...  数据会附带linkKey 用来区分数据源
*    session:object ,  seession 只有初始传的值有这个字段
*    data :object|string..  数据主体
* }
*
*  //  初始 type 字符和含义
 *  angular :
 *    '100':初始化的数据:(session token等)
 *    '101': 非初始化数据
 *  vue:
 *    '200':普通的数据
 *    '210':请求初始化数据 （vue 连接成功后，需要向angular请求初始数据（token等初始化数据））
 *
*
 *
 * 本组件 为兼容本项目的特有特性如路由复用，改动量大时请慎重修改，以免使得现有的功能不能使用
*  */



import {
    Component, ElementRef, AfterViewInit, OnInit
    , ViewChild, Input, Output, EventEmitter, OnDestroy, HostListener
} from '@angular/core';
import {DomSanitizer} from '@angular/platform-browser';
import {IframeLinkService} from './iframe.link.service';
import {NavigationEnd, Router} from '@angular/router';
import {ReuseTabService} from '@zjft/abc';
import {SessionService} from '@core/session.service';
import {any} from 'codelyzer/util/function';

@Component({
    selector: 'page2-iframe',
    template: `<div style="position:relative; height: 100%; width:100%; overflow: hidden">
      <iframe #zjftIframe [src]="frameLink" height="100%" width="100%" frameborder="0"></iframe>
  </div>`
})
export class Page2IframeComponent implements OnInit , AfterViewInit, OnDestroy {
    @ViewChild('zjftIframe') zjftIframe: ElementRef;
    @Input() srcUrl: string;
    @Input() initData: any;  // 初始化传的值，session中的token和userNo 是默认必有的初始化数据
    @Input() linkKey: string; // 为了安全考虑和子iframe约定的连接口令
    @Output('getdata') postFather = new EventEmitter<any>();
    frameLink: any; // 所要通信的iframe地址 转换过的url
    private iframeDom: any; // 本组件的iframe 实例

// 是否成功连接
    private  match = false;


    constructor(
        private linkService: IframeLinkService,
        private domSanitizer: DomSanitizer,
        private router: Router,
        private mySession: SessionService,
        private resuse: ReuseTabService
    ) {

        // this.router.events
        //     .filter((event) => event instanceof NavigationEnd)
        //     .subscribe((event: NavigationEnd) => {
        //         //do something
        //         console.log('触发了路由时间', this.resuse);
        //         this.ngOnDestroy();
        //
        //     });
    }
    ngOnInit() {
        // iframe dom 引用 
        this.iframeDom = this.zjftIframe.nativeElement.contentWindow || this.zjftIframe.nativeElement.contentDocument ;
        this.frameLink = this.domSanitizer.bypassSecurityTrustResourceUrl(this.srcUrl);
    }
    ngAfterViewInit() {
        //   视图刷新钩子，主要获取@view child 元素

        // iframe dom 引用
        this.iframeDom = this.zjftIframe.nativeElement.contentWindow || this.zjftIframe.nativeElement.contentDocument ;
        this.frameLink = this.domSanitizer.bypassSecurityTrustResourceUrl(this.srcUrl);
    // //
    //     const that = this;
    //     window.addEventListener( 'message' ,);
    }
    // @hostListener 绑定的事件会在组件销毁阶段才能解绑，
    @HostListener('window:message', ['$event'])
    onMessage( e) {
        this.ExeMessage(e);
    }
    ngOnDestroy(): void {

    }

    // 监听函数的句柄
    ExeMessage = (e) => {

        // 更新dom（防止angular iframe地址更变，但组件缓存，无法触发钩子）
        this.iframeDom = this.zjftIframe.nativeElement.contentWindow || this.zjftIframe.nativeElement.contentDocument ;
        // 没有iframeDom的引用默认为不执行监听
        if (!this.iframeDom) {
            return;
        }
        // 目标url地址判断 （剔除非目标ip发送的信息）
        // console.log('当前组件承载的iP', this.srcUrl);
        if (e.origin == this.srcUrl || this.srcUrl.indexOf(e.origin) >= 0) {
            // console.log('目标子iframe传来的值',  e.data);
            // console.log('目标子iframe应该传的值',  keyword);

            // 初始化
            //  未连接状态（match为false时）
            if (!this.match) {
                // match为false 时 接受值应该是 linkKey用来请求连接 ，如果不是 则终止
                // 是否是连接口令
                if (e.data.type === '222' && e.data.linkKey !== this.linkKey) {
                    // console.log('和目标约定的口令不一致！');
                    return false;
                } else if (e.data.type === '222' && e.data.linkKey === this.linkKey) {
                    // 口令一致 angular方连接成功 将本方的match 置true
                    this. match = true;
                    console.log('第一步:接受目标子iframe连接请求，并应答：(linkKey)',this.iframeDom);
                    // 发送连接关键字 帮助 对方（vue） 将match置true
                    const obj = {
                        type : '111',
                        linkKey: this.linkKey
                    };

                    this.iframeDom.postMessage(obj, this.srcUrl);
                    // // 如果有连接成功主动执行的回调函数则执行
                    //     this.getLinked();
                }

                // 连接成功之后（match为true） 的数据处理
            } else {
                // 如果子iframe又发送 连接指令 ，则进行重新连接( 1可能是iframe 承载的的服务重启或者崩溃（概率低）2，angular iframe重新加载)
                if (e.data.type === '222' && e.data.linkKey === this.linkKey) {
                    // 重新连接请求

                    // 发送 连接关键字 帮助 对方（vue）将match置true
                    const obj1 = {
                        type : '111',
                        linkKey: this.linkKey
                    };
                    this.iframeDom.postMessage(obj1, this.srcUrl);


                    //    这一步是所有异常情况排除在外的正常通信了 所有信息处理都在这里

                } else if (e.data.type !== '222' && e.data.linkKey === this.linkKey) {
                    console.log('来自目标子框架的信息', e.data);
                    switch (e.data.type) {
                        // 索取 初始化信息
                        case '210':
                            this.postInitData();
                            break;
                        case '200':
                            this.getDataFromIframe(e.data.data);
                            break;
                        default:
                            break;
                    }
                }
            }

        }
    }
    // 发送初始数据
    postInitData() {
        const  initData = {
            type: '100',
            linkKey: this.linkKey,
            session: {
                userNo: this.mySession.getUserSession().account,
                token: this.mySession.token
            },
            data: this.initData || ''
        };
        this.iframeDom.postMessage(initData, this.srcUrl);
    }
    // angular 建立连接后的，收到数据的监听函数
    getDataFromIframe= (e) => {
        this.postFather.emit(e);
    }
//     组件 主动推送 数据
    selfPostData(data) {
        if (this.match) {
            const selfData = {
                type: '101',
                linkKey: this.linkKey,
                data: data,
            }
            this.iframeDom = this.zjftIframe.nativeElement.contentWindow || this.zjftIframe.nativeElement.contentDocument ;
            this.iframeDom.postMessage(selfData, this.srcUrl);
        }else {
            console.log('未连接状态，不支持发送数据')
        }
    }





}
