import {Routes, RouterModule} from '@angular/router';
import {ModuleWithProviders} from '@angular/core';
import {DevmanageComponent} from './devmanage/devmanage.component';

const routes: Routes = [
    {
        path: 'devManager',
        component: DevmanageComponent,
        data: {text: '智慧设备'}
    }
];

export const PublicityRoutingModule: ModuleWithProviders = RouterModule.forChild(routes);
