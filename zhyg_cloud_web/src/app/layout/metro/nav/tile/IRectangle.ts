import {Input, HostBinding, OnInit} from '@angular/core';

export const typeSizeXMap = {
    'tile-small': 1,
    'tile': 2,
    'tile-wide': 4,
    'tile-large': 4
};

export const typeSizeYMap = {
    'tile-small': 1,
    'tile': 2,
    'tile-wide': 2,
    'tile-large': 4
};

export interface IRectangle {
    getType(): any;

    enable(): boolean;

    width(): number;

    height(): number;

    offset(x: number, y: number);
}

export type TileType = 'tile-small' | 'tile' | 'tile-square' | 'tile-wide' | 'tile-large';

export abstract class Tile implements IRectangle, OnInit {
    private _type: TileType = 'tile';
    @HostBinding('class.custom-tile') customTile = true;
    protected $element: any; // JQuery

    @Input()
    set size(value) {
        this._type = (value === 'tile-square') ? 'tile' : value;
    }

    @Input('bg')
    private bg = '';
    @Input('fg')
    private fg = '';

    _class = '';

    getType(): any {
        return this._type;
    }

    enable() {
        return true;
    }

    width() {
        return typeSizeXMap[this._type];
    }

    height() {
        return typeSizeYMap[this._type];
    }

    // 这里设置方块之间的间隔
    offset(x: number, y: number) {
        this.$element.css({
            left: 55 * x + 5,
            top: 55 * y + 5
        });
    }

    ngOnInit() {
        this._setClass();
    }

    private _setClass(): void {
        this._class = [this._type, this.bg, this.fg].join(' ');
    }

}
