import {Component, OnInit} from '@angular/core';
import {FormControl} from '@angular/forms';
import {FactoryService} from '../factory.service';
import {Org} from '../../../../models/org';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';


@Component({
    templateUrl: './factory-modify.html'
})
export class FactoryModifyComponent implements OnInit {


    validateForm: FormGroup;
    factorys;
    org: Org;
    loading = false;
    devServiceManagerList = [];
    statusList = [];
    showFlag = 0;
    tmp;
    upper = '';
    i = 0;
    before;

    constructor(private fb: FormBuilder,
                private factoryService: FactoryService,
                private nzModal: NzModalSubject,
                private session: SessionService,
                private message: NzMessageService,
                private route: ActivatedRoute,
                private router: Router) {

    }


    ngOnInit(): void {
        this.factoryService.getDevServiceManagers({}).subscribe(
            data => {
                this.devServiceManagerList = data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
        this.statusList = this.factoryService.getStatus();

        // 初始化表单

        this.validateForm = this.fb.group({
            no: [null, [Validators.required, ]],
            name: [null, [Validators.required, Validators.maxLength(20), Validators.minLength(2),
                Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$')]],
            devServiceManager: [null, [Validators.required]],
            status: [null, [Validators.required]],
            phone: [null, [Validators.required, Validators.pattern('^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$')]],
            mobile: [null, [Validators.required, Validators.pattern('^1(3|4|5|7|8|9)\\d{9}$')]],
            email: [null, [Validators.pattern('^\\w+((.\\w+)|(-\\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$')]],
            leader: [null, [Validators.maxLength(20), Validators.minLength(2),
                Validators.pattern('^[\s\u4e00-\u9fa5a-z0-9_-]{0,}$')]]
        });

        this.tmp = [
            {
                no: '',
                name: ''
            }
        ];

        // 获取机构详细信息
        this.loading = true;
        this.factoryService.getFactory(this.factorys.no).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                this.factorys = data.data;
                this.before = data.data;
                this.validateForm.controls.no.setValue(this.factorys.no);
                this.validateForm.controls.name.setValue(this.factorys.name);
                this.validateForm.controls.devServiceManager.setValue(this.factorys.belongToNo);
                this.validateForm.controls.status.setValue(this.factorys.status);
                this.validateForm.controls.phone.setValue(this.factorys.phone || '');
                this.validateForm.controls.mobile.setValue(this.factorys.mobile || '');
                this.validateForm.controls.email.setValue(this.factorys.email || '');
                this.validateForm.controls.leader.setValue(this.factorys.leader || '');
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
            name: this.validateForm.controls.name.value,
            belongToNo: this.validateForm.controls.devServiceManager.value,
            status: this.validateForm.controls.status.value,
            phone: this.validateForm.controls.phone.value,
            mobile: this.validateForm.controls.mobile.value,
            email: this.validateForm.controls.email.value,
            leader: this.validateForm.controls.leader.value,
        };
        this.loading = true;
        this.factoryService.modFactory(this.before, params)
            .subscribe(data => {
                this.loading = false;
                this.message.success('修改厂商维护人员成功！');
                this.nzModal.destroy('onOk');
                this.router.navigate(['/system/factory']);
            }, (error) => {
                this.loading = false;
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    updateConfirmValidator() {
        setTimeout(() => {
            this.validateForm.controls['name'].updateValueAndValidity();
        });
    }


    cancel() {
        this.nzModal.destroy('onCancel');
    }

}
