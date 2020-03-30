import {Component, Inject, OnInit} from '@angular/core';
import {Router} from '@angular/router';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {SessionService} from '@core/session.service';
import {NzMessageService, NzModalService, NzNotificationService} from 'ng-zorro-antd';
import {DA_SERVICE_TOKEN, ITokenService} from '@zjft/auth';
import {LoginService} from './login.service';
import {HttpResponse} from '@angular/common/http';
import {HttpClient} from '@angular/common/http';


@Component({
    selector: 'login',
    templateUrl: './login.html',
    styleUrls: ['./login.less'],
    providers: [LoginService]
})
export class LoginComponent implements OnInit {
    loading = false;
    loginForm: FormGroup;

    constructor(private router: Router,
                private session: SessionService,
                private loginService: LoginService,
                private fb: FormBuilder,
                private modal: NzModalService,
                private message: NzMessageService,
                private http: HttpClient,
                private notification: NzNotificationService,
                @Inject(DA_SERVICE_TOKEN) private tokenService: ITokenService,
    ) {
    }

    submitForm() {
        for (const i in this.loginForm.controls) {
            if (this.loginForm.controls[i]) {
                this.loginForm.controls[i].markAsDirty();
            }
        }

        if (this.loginForm.invalid) {
            return;
        }
        this.loading = true;
        const params = {
            no: this.loginForm.controls.userNo.value,
            passwd: this.loginForm.controls.password.value,
        };
        this.loginService.login(params)
            .subscribe(
                _data => {
                    const data = _data.data;
                    this.loading = false;
                    if (data.btnList) {
                        data.btnList = data.btnList.map(x => x.button.menu.name + x.button.name);
                        console.log(data.btnList);
                    }
                    this.session.parseData(data);
                    if (data.user.status === '2') {
                        this.router.navigate(['/password/' + this.loginForm.controls['userNo'].value]);
                    } else {
                        this.router.navigate(['/dashboard']);
                        // this.router.navigate([this.tokenService.redirect || '/userNo']);
                        if (data.outDate <= 30) {
                            this.notification.warning('密码到期提示', '你到密码到期还有' + data.outDate + '天', { nzDuration: 0});
                        }
                    }
                },
                error => {
                    this.loading = false;
                    if (error instanceof HttpResponse) {
                        this.message.error(error.body.retMsg);
                    }
                }
            );
    }


    ngOnInit() {

       // @ts-ignore
        if (window.btsTimers != null) {
            // @ts-ignore
            window.clearInterval(window.btsTimers.interval);
        }
        // @ts-ignore
        if (window.devTimers != null) {
            // @ts-ignore
            window.clearInterval(window.devTimers.interval);
        }
        this.session.logout();
        this.loginForm = this.fb.group({
            userNo: [null, [Validators.required]],
            password: [null, [Validators.required]]
        });
    }

}
