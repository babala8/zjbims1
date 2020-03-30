
import {
    Component, Input, OnInit,
    forwardRef, ViewChild
} from '@angular/core';

import {ControlValueAccessor, NG_VALUE_ACCESSOR} from '@angular/forms';
import {TreeNode, TreeComponent} from 'angular-tree-component';

import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {TreeUtil} from '@core/utils';
import {SessionService} from '@core/session.service';
@Component({
    selector: 'org-tree',
    template: `
        <nz-popover [nzTrigger]="triggerEvent" [nzPlacement]="'bottomLeft'" [(nzVisible)]="_visible">
            <nz-input [nzSize]="'large'" [ngModel]="value" [nzId]="zjId" [nzReadonly]="true" [nzDisabled]="zjDisabled" nzMode="multiple"
                      nz-popover>
                <ng-template #addOnAfter>
                    <i class="anticon anticon-appstore-o"></i>
                </ng-template>
            </nz-input>
            <ng-template #nzTemplate>
                <nz-input *ngIf="!loading" [(ngModel)]="searchOrgValue" [nzPlaceHolder]="'搜索机构'" ></nz-input>
                <nz-spin *ngIf="loading"></nz-spin>
                <div [ngStyle]="treeStyle" *ngIf="!loading">
                    <tree-root #orgTree
                               [nodes]="njNodes"
                               [options]="zjOptions"
                               (activate)="nodeActivate($event)">
                    </tree-root>
                </div>
            </ng-template>
        </nz-popover>
    `,
    styles: [
            `:host ::ng-deep nz-spin > div {
            display: inline-block;
        }
        `
    ],
    providers: [
        {
            provide: NG_VALUE_ACCESSOR,
            useExisting: forwardRef(() => OrgTreeComponent),
            multi: true
        }
    ],
})
export class OrgTreeComponent implements OnInit, ControlValueAccessor {

    @ViewChild(TreeComponent)
    private orgTree: TreeComponent; // edit by baxian
    _visible;
    loading = true;
    njNodes: any[];


    @Input() onlyParentNode= false;
    @Input() zjId;
    @Input() zjDisabled = false;
    @Input() zjOptions = {
        useVirtualScroll: true,
        animateExpand: true,
        scrollOnActivate: true,
        animateSpeed: 60,
        animateAcceleration: 2
    };
    @Input() treeStyle = {'height.px': 350, 'min-width.px': 200, 'overflow': 'hidden'};

    triggerEvent = 'click';

    _value = {
        no: null,
        name: null
    };

    onChange(val) {
    }

    onTouched() {
    }

    get value() {
        return this._value.name;
    }

    set value(val) {
        this._value = val;
        this.onChange(val);
        this.onTouched();
    }
    // edit by baxian
    set  searchOrgValue(val){
        this.orgTree.treeModel.filterNodes(val);

    }
    nodeActivate(evt: any) {
        this.value = {
            no: evt.node.data.id,
            name: evt.node.data.name
        };
        this._visible = false;
        this.loading = false;
    }

    writeValue(value: any): void {
        if (value) {
            this.value = value;
        }
    }

    registerOnChange(fn: any): void {
        this.onChange = fn;
    }

    registerOnTouched(fn: any): void {
        this.onTouched = fn;
    }


    constructor(private http: HttpClient, private session: SessionService) {

    }

    ngOnInit() {
        if (this.zjDisabled) {
            this.triggerEvent = null;
            return;
        }
        let url = `${environment.SERVER_URL}` + '/system/org/qryOrgs';
        if (this.onlyParentNode) {
            url = `${environment.SERVER_URL}` + '/system/org/qryParentOrg';
        }
        // console.log('userOrgNo: ' + this.session.getUserSession().orgNo);
        this.http.get(url, {
            params: {
                userOrgNo: this.session.getUserSession().orgNo
            }
        }).subscribe(_data => {
            // @ts-ignore
            this.njNodes = TreeUtil.build(_data.data, 'no', 'name', 'parentOrgNo');
            this.loading = false;
        });
    }

}
