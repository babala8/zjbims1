import {
    Component,
    ViewChild,
    ElementRef,
    AfterViewInit
} from '@angular/core';
import {NavigationEnd, NavigationError, RouteConfigLoadStart, Router} from '@angular/router';
import {ScrollService, MenuService, Menu} from '@zjft/theme';
import {NzMessageService} from 'ng-zorro-antd';

import 'rxjs/add/operator/delay';

@Component({
    selector: 'app-layout',
    templateUrl: './layout.metro.component.html',
    styleUrls: ['./layout.metro.component.less']
})
export class LayoutMetroComponent implements AfterViewInit {
    isFetching = false;

    @ViewChild('metroMenuWrapper') metroMenuWrapper: ElementRef;
    $menuWrapper: JQuery;
    $menuList: JQuery;
    menus: Menu[];

    constructor(router: Router,
                scroll: ScrollService,
                private menuService: MenuService,
                private _message: NzMessageService) {

        // scroll to top in change page
        router.events.subscribe(evt => {
            if (!this.isFetching && evt instanceof RouteConfigLoadStart) {
                this.isFetching = true;
            }
            if (evt instanceof NavigationError) {
                this.isFetching = false;
                _message.error(`无法加载${evt.url}路由`, {nzDuration: 1000 * 3});
                return;
            }
            if (!(evt instanceof NavigationEnd)) {
                return;
            }
            setTimeout(() => {
                scroll.scrollToTop();
                this.isFetching = false;
            }, 100);
        });
    }

    _left = 0;
    show = false;
    animating: false;

    showMenuPanel(index) {
        // console.log(this.$menuList);
        const $menuWrapper = this.$menuWrapper,
            $list = this.$menuList,
            offsetLeft = this._left = $list.children().eq(index).position().left;
        this.refresh(index, 'num');
        if (this.show) {
            // metro菜单显示 动画效果滑动到指定位置
            $list.transitionOnce({
                'transform': `translateX(-${offsetLeft}px)`,
                'transition': ' all 0.3s ease-in-out 0s'
            });
        } else {
            // metro菜单隐藏 直接跳转到指定位置
            // 显示metro菜单
            $list.css({
                'transform': `translateX(-${offsetLeft}px)`
            });
            $menuWrapper.addClass('menu-activated');
            this.show = true;
        }
    }

    hideMenuPanel() {
        this.$menuWrapper.removeClass('menu-activated');
        this.show = false;
    }

    ngAfterViewInit() {
        this.menuService.change.delay(0).subscribe(menus => {
            this.menus = menus[0].children.filter(value => !value._hidden);
        });
        this.$menuWrapper = $(this.metroMenuWrapper.nativeElement);
        this.$menuList = this.$menuWrapper.children('div.menu-list');
        this.addMouseWheel(this.$menuWrapper, this.$menuList);
    }

    addMouseWheel($menuWrapper: any, $menuList: any) {
        $menuWrapper.mousewheel((event, delta) => {
            this._left = Math.max(this._left - delta * 30, 0);
            const maxWidth = Math.max($menuList.width() - $menuWrapper.width(), 0);
            this._left = Math.min(this._left, maxWidth);
            this.refresh(null, 'mouse');
            $menuList.transitionOnce({
                'transform': `translateX(${-this._left}px)`,
                'transition': ' all 0.01s linear'
            });
            return false;
        });
    }

    refresh(num: any, type: any) {
        const left = Math.round(this._left),
            listItems = this.$menuList.children(),
            $slideBox = $('.slide-block');
        if (type === 'mouse') {
            this.menus.forEach((menu: Menu, index) => {
                const $element = listItems.eq(index);
                if (!$element) {
                    return false;
                }
                menu._selected = false;
                const offsetLeft = Math.round($element.position().left);
                if ((left >= offsetLeft + 10) && (left <= offsetLeft + $element.width())) {
                    menu._selected = true;
                    $slideBox.transitionOnce({
                        'transform': `translateX(${$('header-menu ul>li').eq(index).position().left}px)`
                    });
                }
            });
            return false;
        }
        this.menus.forEach((menu: Menu, index) => {
            const $element = listItems.eq(index);
            if (!$element) {
                return false;
            }
            menu._selected = false;
            // const offsetLeft = Math.round($element.position().left);
            // if ((left >= offsetLeft) && (left <= offsetLeft + $element.width())) {
            if (num === index) {
                menu._selected = true;
                $slideBox.transitionOnce({
                    'transform': `translateX(${$('header-menu ul>li').eq(index).position().left}px)`
                });
            }
        });
    }
}
