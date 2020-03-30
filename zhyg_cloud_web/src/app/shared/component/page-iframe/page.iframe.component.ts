import {
    Component, OnInit, ElementRef, AfterViewInit
    , ViewChild, Input, Output, EventEmitter, DoCheck
} from '@angular/core';
import {DomSanitizer} from '@angular/platform-browser';
import {IframeLinkService} from './iframe.link.service';
import {NavigationEnd, Router} from '@angular/router';

@Component({
  selector: 'page-iframe',
  template: `<div style="position:relative; height: 100%; width:100%; overflow: hidden">
      <iframe #zjftIframe [src]="frameLink" height="100%" width="100%" frameborder="0"></iframe>
  </div>`
})
export class PageIframeComponent implements OnInit,  DoCheck {
  @ViewChild('zjftIframe') zjftIframe: ElementRef;
  @Input() srcUrl: string;
  @Input() userSession: any;
  @Input() linkKey: string;
  @Output('getdata') postFather = new EventEmitter<any>();
  frameLink: any;
  constructor(
    private linkService: IframeLinkService,
    private domSanitizer: DomSanitizer,
    private router: Router
  ) {
  }
  ngOnInit() {
    this.frameLink = this.domSanitizer.bypassSecurityTrustResourceUrl(this.srcUrl);
  }
    ngDoCheck() {
        const that = this;
        const doc = this.zjftIframe.nativeElement.contentWindow || this.zjftIframe.nativeElement.contentDocument ;
        that.linkService.dom = doc;
        that.linkService.getlink({
            url: that.srcUrl,
            key: that.linkKey,
            element: doc,
            fn1: that.getOrgVueCode,
            fn2: that.postMsg
        });
    }
  postMsg = () => {
    console.log('Angular中的session', this.userSession);
    const doc = this.zjftIframe.nativeElement.contentWindow || this.zjftIframe.nativeElement.contentDocument;
    this.linkService.postMes(this.srcUrl, this.userSession);
    return doc;
  }
  getOrgVueCode = (e) => {
    console.log(e);
    this.postFather.emit(e);
  }
  sendDataOuter(data: any) {
    console.log('父组件传递的指令', data);
    this.linkService.postMes(this.srcUrl, data);
  }

}
