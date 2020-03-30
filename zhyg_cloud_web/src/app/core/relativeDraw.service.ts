/* 响应式 布局  使用 rem相对单位 兼容 ie9 baxian */
import {Injectable} from '@angular/core';
import {fromEvent} from 'rxjs/observable/fromEvent';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class RelativeDrawService {
 private designFont: number
    private isStartRelative = false
    // 第一个参数设计图尺寸，第二个参数要设置的根元素font-size大小
//      默认 1920 设计稿，根字体 20px 转换规则自己查阅 baxian
private intRemFont( pwidth, prem) {
    const html = document.getElementsByTagName( 'html' )[0];
    // 获取视窗宽度
   // 下面的代码是为了考虑兼容性
    // 在IE7、IE8、Firefox中，document.body.clientWidth以及 document.body.clientHeightzhi值为0，此时，可以使用 document.documentElement.clientHeight等代替。
     const oWidth = document.documentElement.clientWidth || document.body.clientWidth;
     html.style.fontSize = oWidth / pwidth * prem + 'px';

}
startRelativeDraw ( pwidth: number = 1920, prem: number= 20) {
     this.designFont = prem;
    // 初始化根字体大小
    this.intRemFont(pwidth, prem);
    window.onresize = () => {
       this.intRemFont(pwidth, prem);
     };
    this.isStartRelative = true;
}
// 获取当前比例，对于动态 设置px 的单位，只需要用在设计稿中的单位乘于当前比例即可得到最终的px
getRatio(): number {
    const htmlFontSize = parseInt ( getComputedStyle(window.document.documentElement)['font-size'], 10 );

    return +( htmlFontSize / this.designFont ).toFixed(3);
}
// 设置最终字体大小
setFinalFontSize( pxNum: number ) {
    return (this.isStartRelative ?  pxNum * this.getRatio() : pxNum).toFixed(3);
}
// 窗口变化监听
windowChange(): Observable <any> {
     return fromEvent(window, 'resize' );
}


}
