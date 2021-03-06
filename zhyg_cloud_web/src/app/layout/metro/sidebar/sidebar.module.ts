import {NgModule} from '@angular/core';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {RouterModule} from '@angular/router';

import {SidebarComponent} from './sidebar.component';
import {SidebarNavComponent} from './nav/nav.component';
import {NavGroupItemComponent} from './nav/nav.group.item.component';
import {NavMenuComponent} from './nav/nav.menu.component';
import {SharedModule} from '@shared/shared.module';


const SidebarComponents = [
    SidebarComponent,
    SidebarNavComponent,
    NavGroupItemComponent,
    NavMenuComponent
];

@NgModule({
    imports: [
        SharedModule,
        RouterModule],
    declarations: [
        ...SidebarComponents
    ],
    exports: [
        ...SidebarComponents,
    ]
})
export class SidebarModule {
}
