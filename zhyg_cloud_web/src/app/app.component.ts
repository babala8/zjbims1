import { Component, HostBinding, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { ThemesService, SettingsService, TitleService } from '@zjft/theme';
import { filter } from 'rxjs/operators';
import {RelativeDrawService} from './core/relativeDraw.service';

@Component({
    selector: 'app-root',
    template: `<router-outlet></router-outlet>`
})
export class AppComponent implements OnInit {


    @HostBinding('class.layout-fixed') get isFixed() { return this.settings.layout.fixed; }
    @HostBinding('class.layout-boxed') get isBoxed() { return this.settings.layout.boxed; }
    @HostBinding('class.aside-collapsed') get isCollapsed() { return this.settings.layout.collapsed; }

    constructor(
        private theme: ThemesService,
        private settings: SettingsService,
        private router: Router,
        private relativeDraw: RelativeDrawService,
        private titleSrv: TitleService) {
    }

    ngOnInit() {
        this.router.events
            .pipe(filter(evt => evt instanceof NavigationEnd))
            .subscribe(() => this.titleSrv.setTitle());

        //  动态改变根字体 baxian 1rem 取值 20px 因为boostrap 用到rem布局设置 一些基本标签字体大小
        this.relativeDraw.startRelativeDraw(1920, 20);

    }
}




