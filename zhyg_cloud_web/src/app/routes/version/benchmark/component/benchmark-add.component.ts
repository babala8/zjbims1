import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {Router} from '@angular/router';
import {BenchmarkService} from '../benchmark.service';

@Component({
    templateUrl: './benchmark-add.html'
})
export class BenchmarkAddComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;

    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private benchmarkService: BenchmarkService,
        private message: NzMessageService,
        private router: Router,
        private session: SessionService
    ) {
    }

    options = [];
    selectedOption;

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.options = this.benchmarkService.getModelType();
        this.validateForm = this.fb.group({
            org: [{no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}, [Validators.required]],
            modelName: [null, [Validators.required, Validators.minLength(1), Validators.maxLength(40)]],
            modelType: [null, [Validators.required]],
            modelDesc: [null]
        });
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    /**
     * 添加标杆
     */
    submitForm() {
        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }
        if (this.validateForm.invalid) {
            return;
        }

        const params = {
            modelName: this.validateForm.controls.modelName.value,
            modelType: this.validateForm.controls.modelType.value,
            description: this.validateForm.controls.modelDesc.value,
            orgNo: this.validateForm.controls.org.value.no,
            modelUser: this.session.getUserSession().account
        };
        this.loading = true;
        this.benchmarkService.addModel(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success(`添加标杆成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/version/benchmark']);

            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 分配范围
     */
    allocRange() {
        if (this.validateForm.invalid) {
            return;
        }

        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }

        const params = {
            modelName: this.validateForm.controls.modelName.value,
            modelType: this.validateForm.controls.modelType.value,
            description: this.validateForm.controls.modelDesc.value,
            orgNo: this.session.getUserSession().orgNo,
            userName: this.session.getUserSession().account
        };

        console.log(params);
        this.loading = true;
        this.benchmarkService.addModel(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success(`添加标杆成功！`);
                this.nzModal.destroy('onOk');
                this.router.navigate(['/version/benchmarkOperation/' + data.modelId]);
            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}

