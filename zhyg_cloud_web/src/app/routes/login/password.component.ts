import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NzMessageService} from 'ng-zorro-antd';
import {ActivatedRoute, Router} from '@angular/router';
import {SessionService} from '@core/session.service';
import {HttpClient, HttpResponse} from '@angular/common/http';
import {environment} from '@env/environment';
import {Md5} from 'ts-md5';

@Component({
    templateUrl: './password.html',
    styles: [`
        .style-form {
            padding-top: 5px;
            padding-left: 10px;
            border: 1px solid #d9d9d9;
            border-radius: 6px;
            margin: 20px 45px;
        }

        .style-text {
            margin-left: 10px;
        }
    `]
})
export class PasswordComponent implements OnInit {
    validateForm: FormGroup;
    loading = false;
    name;
    private url = `${environment.SERVER_URL}` + '/system/user/modPasswd';

    constructor(private session: SessionService,
                private fb: FormBuilder,
                private nzMessage: NzMessageService,
                private router: Router,
                private http: HttpClient,
                private route: ActivatedRoute
    ) {

    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            name: [this.session.getUserSession().name, [Validators.required]],
            oldPassword: [null, [Validators.required, Validators.pattern('^[A-Za-z0-9]{1,16}')]],
            newPassword: [null, [Validators.required,  Validators.pattern('^[A-Za-z0-9]{8,16}')]],
            repeatNewPassword: [null, [Validators.required, this.confirmationValidator]],
        });

    }

    updateConfirmValidator() {
        /** wait for refresh value */
        setTimeout(_ => {
            this.validateForm.controls.newPassword.updateValueAndValidity();
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
            no: this.route.snapshot.paramMap.get('userNo') ,
            oldPassword: this.validateForm.controls.oldPassword.value,
            passwd: (this.validateForm.controls.newPassword.value).toString()
        };

        this.loading = true;
        this.http.post(this.url, params)
            .subscribe(data => {
                this.loading = false;
                this.nzMessage.success('密码修改成功，请重新登录');
                console.log('loading guard: navigates to login...');
                this.router.navigate(['/login']);
            }, (error) => {
                console.log(error);
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.nzMessage.error(error.body.retMsg);
                }
            });
    }

    getFormControl(name) {
        return this.validateForm.controls[name];
    }

    confirmationValidator = (control: FormControl): { [s: string]: boolean } => {       // TODO: 注意这个函数的声明方式！
        if (!control.value) {
            return {required: true};
        } else if (control.value !== this.validateForm.controls.newPassword.value) {
            return {confirm: true, error: true};
        }
    }

    resetForm(evt: MouseEvent) {
        evt.preventDefault();       // TODO: 为什么第二个按钮还会触发提交事件？？
        this.validateForm.reset({
            name: this.session.getUserSession().name ,
            newPassword: '' ,
            repeatNewPassword: '' ,
        });
        console.log(this.validateForm);
    }

}
