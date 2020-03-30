import {
    Component, Input, ContentChildren, QueryList, AfterViewInit, HostBinding, Renderer2,
    ElementRef, OnInit
} from '@angular/core';
import {LayoutProcessor} from './sort';
import {TileComponent} from '../tile/tile.component';

@Component({
    selector: 'tile-group.tile-group',
    templateUrl: './tile.group.component.html'
})
export class TileGroupComponent implements AfterViewInit, OnInit {
    @Input()
    title: 'title';

    @ContentChildren(TileComponent) tileArray: QueryList<TileComponent>;

    @HostBinding('class.no-children') get noChildren(): boolean {
        return !this._childrenNum;
    }

    private _size: number;
    private _childrenNum = 0;

    constructor(private render2: Renderer2, private elementRef: ElementRef) {

    }

    set size(size) {
        this._size = size;
        let tileWidth = 'double';
        switch (size) {
            case 2:
                tileWidth = 'one';
                break;
            case 4:
                tileWidth = 'double';
                break;
            case 6:
                tileWidth = 'three';
                break;
            case 8:
                tileWidth = 'four';
                break;
        }
        this.render2.addClass(this.elementRef.nativeElement, tileWidth);
    }

    ngOnInit() {

    }

    ngAfterViewInit() {
        this.size = (new LayoutProcessor(this.tileArray.toArray())).groupWidth;
        setTimeout(() => {
            this._childrenNum = this.tileArray.length;
        });
    }

}



