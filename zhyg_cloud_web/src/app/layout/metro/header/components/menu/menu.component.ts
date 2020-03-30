import {AfterViewInit, Component, ElementRef} from '@angular/core';
import {Menu, MenuService} from '@zjft/theme';
import {LayoutMetroComponent} from '../../../layout.metro.component';

let allowScroll = false; // 定义一个函数外部变量供startScroll使用 edit by baxian
@Component({
    selector: 'header-menu',
    templateUrl: './menu.component.html',
    styleUrls: ['./menu.component.less']
})
export class HeaderMenuComponent implements AfterViewInit {

    $element: JQuery;
    $scrollWrapper: JQuery;
    menuArray: Array<Menu> = [];
    currentIndex = 0; // edit baxian

    constructor(private _elementRef: ElementRef,
                private _menuService: MenuService,
                private _layout: LayoutMetroComponent) {
        this._menuService.change.subscribe(menus => {
            this.menuArray = menus[0].children.filter(value => {
                return !value._hidden && value.text !== '首页';
            });
        });
        this.$element = $(this._elementRef.nativeElement);
    }

    // 左右箭头点击事件-- edit by baxian
    // 滚动效果-- edit by baxian

    startScroll(isRight) {
        const that = this;

        let duration = 100;

        if (allowScroll) {
            return;
        }
        allowScroll = true;
        that.focusMenus(isRight);
        if (!isRight) {
            duration = -duration;
        }
        // this.$scrollWrapper.scrollLeft(this.$scrollWrapper.scrollLeft() +  100);
        this.$scrollWrapper.animate(
            {scrollLeft: that.$scrollWrapper.scrollLeft() + duration},
            400,
            function () {
                allowScroll = false;

            });

    }

    // 聚焦菜单
    focusMenus = (isRight) => {
        const maxlength = this.menuArray.length - 1;
        let willIndex = this.currentIndex;
        if (!isRight) {
            willIndex--;
            if (willIndex < 0) {
                return;
            }
            this._layout.showMenuPanel(--this.currentIndex);
        } else {
            willIndex++;
            if (willIndex > maxlength) {
                return;

            }
            this._layout.showMenuPanel(++this.currentIndex);

        }


    };

    leftMove() {
        // console.log()
        this.startScroll(false);


    }

    rightMove() {
        this.startScroll(true);

    }


    doShow(index) {

        this.currentIndex = index;
        this._layout.showMenuPanel(index);
    }

    ngAfterViewInit() {
        setTimeout(() => {
            this.$scrollWrapper = this.$element.find('.scroll-wrapper');
            this.$element.find('li:first-child').addClass('active').siblings().removeClass('active');
            this.addMouseWheel();
        }, 0);
    }

    get leftHidden() {
        if (this.$scrollWrapper) {
            return this.$scrollWrapper.scrollLeft() > 10;
        }
        return false;
    }

    get rightHidden() {
        if (this.$scrollWrapper) {
            // const innerWidth = this.$element.find('ul').width();
            // return this.$scrollWrapper.scrollLeft() + this.$scrollWrapper.width() + 10 < innerWidth;
            // IE11 菜单右侧小箭头不显示
            const liNum = this.$element.find('ul li').width();
            const liLen = this.$element.find('ul li').length - 1;
            return this.$scrollWrapper.scrollLeft() + this.$scrollWrapper.width() + 10 < liNum * liLen;
        }
        return false;
    }

    addMouseWheel() {
        this.$scrollWrapper.mousewheel((event, delta, deltaX, deltaY) => {
            this.$scrollWrapper.scrollLeft(this.$scrollWrapper.scrollLeft() - delta * 20);
            return false;
        });
    }

}
