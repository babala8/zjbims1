import {Component, OnInit, TemplateRef, OnChanges} from '@angular/core';
import {NzMessageService, NzModalService} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {FormBuilder, FormGroup} from '@angular/forms';
import {OrgMonitorService} from './orgMonitor.service';
import {SessionService} from '@core/session.service';
import {Page} from '../../../models/page';
import {Router} from '@angular/router';


@Component({
    templateUrl: './orgMonitor.html',
    styles  : [
        `            
            .case-red {
                position: relative;
                -webkit-box-shadow: 0 1px 4px rgba(255,1,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                -moz-box-shadow: 0 1px 4px rgba(255,1,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                box-shadow: 0 1px 4px rgba(255,1,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                -o-box-shadow:0 1px 4px rgba(255,1,1,1),0 0 40px rgba(0,0,0,0.1) inset;
            }
            .case-yellow {
                position: relative;
                -webkit-box-shadow: 0 1px 4px rgba(255,255,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                -moz-box-shadow: 0 1px 4px rgba(255,255,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                box-shadow: 0 1px 4px rgba(255,255,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                -o-box-shadow:0 1px 4px rgba(255,255,1,1),0 0 40px rgba(0,0,0,0.1) inset;
            }
            .case-green {
                position: relative;
                -webkit-box-shadow: 0 1px 4px rgba(1,136,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                -moz-box-shadow: 0 1px 4px rgba(1,136,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                box-shadow: 0 1px 4px rgba(1,136,1,1),0 0 40px rgba(0,0,0,0.1) inset;
                -o-box-shadow:0 1px 4px rgba(1,136,1,1),0 0 40px rgba(0,0,0,0.1) inset;
            }
        `
    ]
})
export class OrgMonitorComponent implements OnInit {
    gridStyle = {
        textAlign: 'center',
        padding: '40px',
        width: '257px',
        height: '265px'
    };
    constructor(
        private router: Router,
    ) {
    }

    ngOnInit() {
    }



    showDetail() {
        this.router.navigateByUrl('/monitor/orgMonitor/detail');
    }
}
