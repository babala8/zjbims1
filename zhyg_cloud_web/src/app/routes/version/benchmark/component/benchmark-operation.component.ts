import {Component, OnInit} from '@angular/core';

@Component({
    template: `
    <nz-tabset [nzTabPosition]="'top'" [nzType]="'card'" [nzSize]="'large'">
        <nz-tab>
            <ng-template #nzTabHeading>
                    <span style="font-size: large;">标杆详情</span>
            </ng-template>
            <benchmark-details></benchmark-details>
        </nz-tab>
        <nz-tab>
            <ng-template #nzTabHeading>
                <span style="font-size: large;">修改</span>
            </ng-template>
            <benchmark-modify></benchmark-modify>
        </nz-tab>
      <nz-tab>
      <ng-template #nzTabHeading>
          <span style="font-size: large;">分配</span>
        </ng-template>
        <benchmark-alloc></benchmark-alloc>
      </nz-tab>
      <nz-tab>
      <ng-template #nzTabHeading>
          <span style="font-size: large;">部署</span>
        </ng-template>
        <benchmark-deploy></benchmark-deploy>
      </nz-tab>
    </nz-tabset>
<router-outlet></router-outlet>
`,
    styles  : []
})
export class BenchmarkOperationComponent implements OnInit {

    ngOnInit() {
    }
}
