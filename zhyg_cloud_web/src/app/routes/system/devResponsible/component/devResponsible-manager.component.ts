import {Component, OnInit} from '@angular/core';
import {DevResponsibleService} from '../devResponsible.service';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {Router} from '@angular/router';

@Component({
    templateUrl: './devResponsible-manager.html',
})
export class DevResponsibleManagerComponent implements OnInit {

    loading = false;
    item;
    i = 0;
    manager = [];
    service = [];
    managerfirst = [];
    tmpmanagerfirst = '';
    managersecond = [];
    tmpmanagersecond = '';
    managerthird = [];
    tmpmanagerthird = '';
    servicefirst = [];
    tmpservicefirst = '';
    servicesecond = [];
    tmpservicesecond = '';
    servicethird = [];
    tmpservicethird = '';



    constructor(
        private devResponsibleService: DevResponsibleService,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
        private router: Router) {
    }

    ngOnInit() {
        const params = {
            devNo: this.item.devNo,
            orgNo: this.item.orgNo,
        };
        console.log(this.manager);
        this.devResponsibleService.getSetDevResponsor(params).subscribe(
            data => {
                this.loading = false;
                console.log(data);
                console.log(data.data);
                if (data.data[0].manager) {
                    data.data[0].manager.forEach(data1 => {
                        this.manager.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                console.log(data.data);
                console.log(data.data[0].service);
                if (data.data[0].service) {
                    data.data[0].service.forEach(data1 => {
                        this.service.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                console.log('12345');
                console.log(this.service);
                if (data.data[0].managerfirst) {
                    data.data[0].managerfirst.forEach(data1 => {
                        this.managerfirst.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                if (data.data[0].managersecond) {
                    data.data[0].managersecond.forEach(data1 => {
                        this.managersecond.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                if (data.data[0].managerthird) {
                    data.data[0].managerthird.forEach(data1 => {
                        this.managerthird.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                if (data.data[0].servicefirst) {
                    data.data[0].servicefirst.forEach(data1 => {
                        this.servicefirst.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                if (data.data[0].servicesecond) {
                    data.data[0].servicesecond.forEach(data1 => {
                        this.servicesecond.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
                if (data.data[0].servicethird) {
                    data.data[0].servicethird.forEach(data1 => {
                        this.servicethird.push({
                            label: data1,
                            value: data1
                        });
                    });
                }
            }
            ,
            error => {
                this.loading = false;
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     *设置管机员一
     * @param evt
     */
    dataChangemanagerfirst(evt: any) {
        console.log(evt);
        if (evt) {
            this.manager = evt.resource;
            this.managerfirst = evt.target;
        }
    }

    /**
     *设置管机员二
     * @param evt
     */
    dataChangemanagersecond(evt: any) {
        console.log(evt);
        if (evt) {
            this.manager = evt.resource;
            this.managersecond = evt.target;
        }
    }

    /**
     *设置管机员三
     * @param evt
     */
    dataChangemanagerthird(evt: any) {
        console.log(evt);
        if (evt) {
            this.manager = evt.resource;
            this.managerthird = evt.target;
        }
    }

    /**
     *设置维护员一
     * @param evt
     */
    dataChangeservicefirst(evt: any) {
        console.log(evt);
        if (evt) {
            this.service = evt.resource;
            this.servicefirst = evt.target;
        }
    }

    /**
     *设置维护员二
     * @param evt
     */
    dataChangeservicesecond(evt: any) {
        console.log(evt);
        if (evt) {
            this.service = evt.resource;
            this.servicesecond = evt.target;
        }
    }

    /**
     *设置维护员三
     * @param evt
     */
    dataChangeservicethird(evt: any) {
        console.log(evt);
        if (evt) {
            this.service = evt.resource;
            this.servicethird = evt.target;
        }
    }

    /**
     *设置设备责任人
     * @param evt
     */
    submit() {
        for ( this.i = 0; this.i < this.managerfirst.length; (this.i)++) {
            this.tmpmanagerfirst = this.tmpmanagerfirst + this.managerfirst[this.i].value + '|';
        }
        this.tmpmanagerfirst = '|' + this.tmpmanagerfirst;

        for ( this.i = 0; this.i < this.managersecond.length; (this.i)++) {
            this.tmpmanagersecond = this.tmpmanagersecond + this.managersecond[this.i].value + '|';
        }
        this.tmpmanagersecond = '|' + this.tmpmanagersecond;

        for ( this.i = 0; this.i < this.managerthird.length; (this.i)++) {
            this.tmpmanagerthird = this.tmpmanagerthird + this.managerthird[this.i].value + '|';
        }
        this.tmpmanagerthird = '|' + this.tmpmanagerthird;

        for ( this.i = 0; this.i < this.servicefirst.length; (this.i)++) {
            this.tmpservicefirst = this.tmpservicefirst + this.servicefirst[this.i].value + '|';
        }
        this.tmpservicefirst = '|' + this.tmpservicefirst;

        for ( this.i = 0; this.i < this.servicesecond.length; (this.i)++) {
            this.tmpservicesecond = this.tmpservicesecond + this.servicesecond[this.i].value + '|';
        }
        this.tmpservicesecond = '|' + this.tmpservicesecond;

        for ( this.i = 0; this.i < this.servicethird.length; (this.i)++) {
            this.tmpservicethird = this.tmpservicethird + this.servicethird[this.i].value + '|';
        }
        this.tmpservicethird = '|' + this.tmpservicethird;
        const params = {
            devNo: this.item.devNo,
            managerfirst: this.tmpmanagerfirst,
            managersecond: this.tmpmanagersecond,
            managerthird: this.tmpmanagerthird,
            servicefirst: this.tmpservicefirst,
            servicesecond: this.tmpservicesecond,
            servicethird: this.tmpservicethird
        };
        console.log('9999999999');
        console.log(params);
        this.devResponsibleService.SetDevResponsor(params)
            .subscribe(_data => {
                this.loading = false;
                this.message.success(`修改设备责任人成功！`);
                this.nzModal.destroy('onOk');
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
