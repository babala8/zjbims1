import {Component} from '@angular/core';

@Component({
    selector: 'header-logo',
    template: `
        <a routerLink="/dashboard">
            <span class="zijin-icon-logo"></span>
        </a>
    `,
    styleUrls: ['./logo.component.less']
})
export class HeaderLogoComponent {

    constructor() {
    }
}
