import {Component, Input, OnInit} from '@angular/core';
import {Menu} from '@zjft/theme';

@Component({
    selector: 'ul[nav-menu]',
    templateUrl: './nav.menu.component.html',
    host: {
        '[class]': '_class'
    }
})
export class NavMenuComponent implements OnInit {

    _class = '';

    @Input('source')
    data: Menu;

    constructor() {

    }

    toggle(item) {
        item._open = !item._open;
    }

    ngOnInit() {
        this._class = `nav nav-sub nav-depth${this.data._depth}`;
    }

    isShow(): boolean {
        return true;
    }
}
