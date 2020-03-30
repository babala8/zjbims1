import {Component, ElementRef, HostListener, Input} from '@angular/core';
import {LayoutMetroComponent} from '../../layout.metro.component';
import {Menu} from '@zjft/theme';

@Component({
    selector: 'tile-area',
    templateUrl: './tile.area.component.html'
})
export class TileAreaComponent {
    @Input() menu: Menu;

    constructor(private _elementRef: ElementRef,
                public layout: LayoutMetroComponent) {
        $(this._elementRef.nativeElement).addClass('tile-area fg-white');
    }


    @HostListener('click', ['$event.target'])
    onClick(area: HTMLElement) {
        if ($(area).is('tile-area,tile-group')) {
            this.layout.hideMenuPanel();
        }
    }
}



