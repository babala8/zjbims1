import {Component, OnInit} from '@angular/core';
import {CatalogService} from '../catalog.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './catalog-modify.html'
})
export class CatalogModifyComponent implements OnInit {


    validateForm: FormGroup;
    catalog;
    org: Org;
    loading = false;
    showFlag = 0;
    upper = '';
    i = 0;
    before;

    constructor(private fb: FormBuilder,
                private catalogService: CatalogService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, Validators.pattern('^[^ ]+$'), Validators.maxLength(5)]],
            enname: [null, [Validators.required, Validators.pattern('^[a-zA-Z0-9\u4e00-\u9fa5][\\S]*$'), Validators.maxLength(20)]],
        });


        this.loading = true;
        this.catalogService.getCatalog(this.catalog.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.catalog = data.data;
                this.before = data.data;
                this.validateForm.controls.no.setValue(this.catalog.no);
                this.validateForm.controls.enname.setValue(this.catalog.enname);
            },
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    _submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }

        if (this.validateForm.invalid) {
            return;
        }
        const params = {
            no: this.validateForm.controls.no.value,
            enname: this.validateForm.controls.enname.value,
        };
        this.loading = true;
        this.catalogService.modCatalog(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改设备类型成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/catalog']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    getFormControl(enname) {
        return this.validateForm.controls[enname];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['enname'].updateValueAndValidity();
        });
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
