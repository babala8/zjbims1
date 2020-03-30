import {Component, ElementRef, Renderer2, ViewEncapsulation} from '@angular/core';

@Component({
    selector: 'app-sidebar',
    encapsulation: ViewEncapsulation.Emulated,
    templateUrl: './sidebar.component.html',
    styleUrls: ['./sidebar.component.less']
})
export class SidebarComponent {
    constructor(private renderer: Renderer2, private _elementRef: ElementRef) {
        renderer.addClass(_elementRef.nativeElement, 'aside-metro');
    }
}
