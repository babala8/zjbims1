import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {RouterModule} from '@angular/router';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {SharedModule} from '@shared/shared.module';

import {HeaderModule} from './header/header.module';
import {SidebarModule} from './sidebar/sidebar.module';
import {LayoutMetroComponent} from './layout.metro.component';
import {MetroNavModule} from './nav/nav.module';

@NgModule({
    imports: [
        CommonModule,
        BrowserAnimationsModule,
        RouterModule,
        SharedModule,
        HeaderModule,
        MetroNavModule,
        SidebarModule
    ],
    declarations: [
        LayoutMetroComponent
    ],
    exports: [
        LayoutMetroComponent,
    ]
})
export class LayoutMetroModule {
}
