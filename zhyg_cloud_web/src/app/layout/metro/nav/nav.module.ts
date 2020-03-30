import {NgModule} from '@angular/core';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';


import {TileComponent} from './tile/tile.component';
import {TileGroupComponent} from './tile-group/tile.group.component';
import {TileAreaComponent} from './tile-area/tile.area.component';
import {MenuTargetDirective} from '../directives/menu-target';
import {SharedModule} from '@shared/shared.module';

const COMPONENTS = [
    MenuTargetDirective,
    TileAreaComponent,
    TileGroupComponent,
    TileComponent
];

@NgModule({
    imports: [
        BrowserAnimationsModule,
        SharedModule
    ],
    declarations: [
        ...COMPONENTS
    ],
    exports: [
        ...COMPONENTS
    ]
})
export class MetroNavModule {
}
