import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {BenchmarkService} from '../benchmark.service';

@Component({
    selector: 'benchmark-modify',
    templateUrl: './benchmark-modify.html'
})
export class BenchmarkModifyComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    modelId: string;
    modelName: string;
    modelDesc: string;
    constructor(
        private fb: FormBuilder,
        private nzModal: NzModalSubject,
        private benchmarkService: BenchmarkService,
        private message: NzMessageService
    ) {
    }

    /**
     * 初始化表单
     */
    ngOnInit() {
        this.validateForm = this.fb.group({
            modelName: [null, [Validators.required, Validators.minLength(1), Validators.maxLength(40)]],
            modelDesc: [null]
        });
        this.qryModelById();
    }

    submitForm() {

        for (const i in this.validateForm.controls) {
            if (this.validateForm.controls[i]) {
                this.validateForm.controls[i].markAsDirty();
            }
        }

        if (this.validateForm.invalid) {
            return;
        }

        const modelNo = this.modelId;
        const params = {
            modelId: modelNo,
            modelName: this.validateForm.controls.modelName.value,
            description: this.validateForm.controls.modelDesc.value,
        };

        console.log(params);
        this.loading = true;
        this.benchmarkService.modifyModel(params)
            .subscribe(data => {
                this.loading = false;
                this.message.success(`修改标杆成功！`);
                this.nzModal.destroy('onOk');

            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    qryModelById() {
        // const modelNo = this.route.snapshot.paramMap.get('no');
        const modelNo = this.modelId;
        const params = {
            modelId: modelNo
        };
        this.benchmarkService.qryModelById(params)
            .subscribe(data => {
                this.modelName = data.data.modelName;
                this.modelDesc = data.data.description;

            }, (error) => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    cancel() {
        this.nzModal.destroy('onCancel');
    }
}

