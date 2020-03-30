import {Component, OnInit, ElementRef, ViewChild} from '@angular/core';
import {environment} from '@env/environment';
@Component({
    template: `
        <page2-iframe 
            #deviframe 
            [srcUrl]="vuelink" 
            [linkKey]="linkKey" 
            [initData]="initdata" 
            (getdata)="getSonData($event)"
        ></page2-iframe>
    `,
    styles: [`
        :host {
            height: 100%;
        }
    `]
})
export class DevmanageComponent implements OnInit {
    @ViewChild('orgiframe') deviframe: ElementRef;
    private link = `${environment.VUE_EXTEND_LINK}`;
    vuelink: any;
    linkKey: any;
    initdata: any;

    constructor(
    ) {
    }

    ngOnInit() {
        this.vuelink = this.link;
        this.initdata = {init: 1010101010};
        this.linkKey = 'publicity-link';
    }
    getSonData(e) {
        console.log(e);
    }
}
