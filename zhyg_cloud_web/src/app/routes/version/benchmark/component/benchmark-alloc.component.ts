import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {NzMessageService, NzModalSubject} from 'ng-zorro-antd';
import {HttpResponse} from '@angular/common/http';
import {SessionService} from '@core/session.service';
import {ActivatedRoute, Router} from '@angular/router';
import {BenchmarkService} from '../benchmark.service';
import {Org} from '../../../../models/org';
import {OrgType} from '../../../../models/orgType';
import {Page} from '../../../../models/page';
import {BenchmarkComponent} from '../benchmark.components';

@Component({
    selector: 'benchmark-alloc',
    templateUrl: './benchmark-alloc.html'
})
export class BenchmarkAllocComponent implements OnInit {

    validateRangeForm: FormGroup;
    page = new Page();
    isVisible = false;
    loading = false;

    constructor(
        private fb: FormBuilder,
        private benchmarkService: BenchmarkService,
        private benchmarkComponent: BenchmarkComponent,
        private nzModal: NzModalSubject,
        private message: NzMessageService,
        private route: ActivatedRoute,
        private router: Router,
        private session: SessionService
    ) {
    }

    /**
     * 初始化表单
     */
    allDevBrand = [];
    allDevType = [];
    allDevCatalog = [];
    devdata = [];
    org = new Org();
    orgTypeList: OrgType[] = [];
    modelDevRangeData: {
        dev: string,
        org: string,
        type: string,
        vendor: string,
        catalog: string,
        id: string,
        select: any
    }[] = [];
    // 存放修改前的标杆设备范围,后续用于标杆同步
    firstQryFlag = true;
    rawDevRangeData = [];
    lastDevRangeData = [];
    orgs: { no: string, name: string }[] = [];
    isConfirmLoading = false;

    ngOnInit() {
        this.isConfirmLoading = false;
        this.validateRangeForm = this.fb.group({
            org: [
                {no: this.session.getUserSession().orgNo, name: this.session.getUserSession().orgName}, [Validators.required]],
            devType: [null],
            devBrand: [null],
            devModel: [null],
        });
        this.qryAllDevBrand();
        this.qryAllDevType();
        this.qryAllDevCatalog();
        this.qryOrgs();
        this.qryModelRange();
    }

    _allChecked = false;
    _indeterminate = false;
    _displayData = [];

    qryDevs(reset = false) {
        this.devdata = [];
        if (reset) {
            this.page.curPage = 1;
        }
        this.loading = true;
        const param = {
            orgNo: this.validateRangeForm.controls.org.value.no,
            devCatalog: this.validateRangeForm.controls.devType.value || '',
            devVendor: this.validateRangeForm.controls.devBrand.value || '',
            devType: this.validateRangeForm.controls.devModel.value || '',
            pageSize: this.page.pageSize,
            curPage: this.page.curPage
        };
        this.benchmarkService.qryDevInfo(param).subscribe(_data => {
            this.devdata = _data.data;
            if (this.devdata) {
                this.page.totalRow = _data.page.totalRow;
                this.devdata.forEach(dev => {
                    if (this.devRange.indexOf(dev.no) != -1) {
                        dev.disabled = true;
                    }
                });
            } else {
                this.page.totalRow = 0;
                this.devdata = [];
            }
            this.loading = false;
        }, (error) => {
            this.loading = false;
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    showModal() {
        this.isVisible = true;
        this.qryDevs(true);
    }

    /**
     * 选择设备
     * @param event
     * @param devNo
     */
    selectDevNo(event, devNo) {
        if (event) {
            if (!this.selectDev.includes(devNo)) {
                this.selectDev.push(devNo);
            }
        } else {
            this.selectDev.splice(this.selectDev.indexOf(devNo), 1);
        }
    }

    _displayDataChange($event) {
        this._displayData = $event;
        this._refreshStatus();
    }

    _refreshStatus() {
        const allChecked = this._displayData.every(value => value.checked === true);
        const allUnChecked = this._displayData.every(value => !value.checked);
        this._allChecked = allChecked;
        this._indeterminate = (!allChecked) && (!allUnChecked);
    }
    devRange = [];
    selectDev = [];

    reset() {
        this.validateRangeForm.reset();
        this.validateRangeForm.controls.org.setValue({
            no: this.session.getUserSession().orgNo,
            name: this.session.getUserSession().orgName});
        this.validateRangeForm.controls.devType.setValue('');
        this.validateRangeForm.controls.devBrand.setValue('');
        this.validateRangeForm.controls.devModel.setValue('');
    }

    /**
     * 标杆范围同步
     */
    syn() {

        // const modelNo = this.route.snapshot.paramMap.get('no');
        const modelNo = this.benchmarkComponent.editModel.logicId;
        // console.log(this.rawDevRangeData);
        // console.log(this.lastDevRangeData);

        const oldmodelRange = [];
        const laastmodelRange = [];
        this.rawDevRangeData.forEach(rawData => {
            oldmodelRange.push({
                devNo: rawData.dev,
                orgNo: rawData.org,
                devType: rawData.type,
                devVendor: rawData.vendor,
                devCatalog: rawData.catalog
            });
        });
        this.lastDevRangeData.forEach(lastData => {
            laastmodelRange.push({
                devNo: lastData.dev,
                orgNo: lastData.org,
                devType: lastData.type,
                devVendor: lastData.vendor,
                devCatalog: lastData.catalog
            });
        });
        console.log(oldmodelRange);
        console.log(laastmodelRange);


        const params = {
            modelId: modelNo,
            userNo: this.session.getUserSession().account,
            oldRange: oldmodelRange,
            range: laastmodelRange
        };

        this.benchmarkService.synModel(params)
            .subscribe(
                data => {
                    this.message.success(`标杆范围同步成功！`);
                    this.nzModal.destroy('onOk');
                    this.firstQryFlag = true;
                }, error => {
                    this.message.error(error.body.retMsg);
                }
            );
    }

    /**
     * 保存选择的设备范围
     */
    saveRange() {
        if (this.selectDev.length == 0) {
            this.message.warning('请选择设备！');
            return;
        }
        this.isVisible = false;
        const modelNo = this.benchmarkComponent.editModel.logicId;
        const devList: any[] = [];
        let devs = '';
        this.selectDev.forEach(data2 => {
            devs += data2 + ',';
        });
        devs = devs.substring(0, devs.length - 1);
        devList.push({
            devNo: devs
        });
        const params = {
            modelId: modelNo,
            range: devList
        };
        this.benchmarkService.rangeModel(params)
            .subscribe(data => {
                this.message.success(`添加标杆范围成功！`);
                this.nzModal.destroy('onOk');
                this.qryModelRange();
            }, (error) => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    /**
     * 取消保存范围
     */
    cancel() {
        this.isVisible = false;
        this.validateRangeForm.reset();
        this.validateRangeForm.controls.org.setValue({
            no: this.session.getUserSession().orgNo,
            name: this.session.getUserSession().orgName});
        this.selectDev = [];
    }

    /**
     * 选择设备品牌后，查询用户可选的设备类型
     * @param evt
     */
    selectDevType() {
        const params = {
            devVendor: this.validateRangeForm.controls.devBrand.value || '',
            devCatalog: this.validateRangeForm.controls.devType.value || '',
        };
        console.log(params);
        this.benchmarkService.getDevTypeByVendor(params).subscribe(
            _data => {
                this.allDevType = _data.data;
            }, error => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            }
        );
    }

    qryAllDevBrand() {
        const param = {};
        this.benchmarkService.qryAllBrand(param).subscribe(_data => {
            this.allDevBrand = _data.data;
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    qryAllDevType() {
        const param = {};
        this.benchmarkService.qryAllType(param).subscribe(_data => {
            this.allDevType = _data.data;
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    qryAllDevCatalog() {
        const param = {};
        this.benchmarkService.qryAllCatalog(param).subscribe(_data => {
            this.allDevCatalog = _data.data;
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    /**
     * 查询所有下级机构，获取机构名
     */
    qryOrgs() {
        this.benchmarkService.getOrgs({
            orgNo: this.session.getUserSession().orgNo
        }).subscribe(
            _data => {
                this.orgs = _data.data;
            }, (error) => {
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }

    delIndexRange() {
        const modelNo = this.benchmarkComponent.editModel.logicId;
        const delData = [];
        this.modelDevRangeData.forEach(data => {
            if (data.select) {
                delData.push(data.id);
            }
        });
        console.log(delData);
        if (delData.length == 0) {
            this.message.warning(`请选择要移除的设备！`);
            return;
        }
        const param = {
            modelId: modelNo,
            logicIds: delData
        };
        this.benchmarkService.delModelRange(param).subscribe(data => {
            this.message.success(`删除标杆范围成功！`);
            this.qryModelRange();

        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });

    }

    selectOrg(evt: any) {
        if (evt) {
            const orgNo = evt.no;
            const params = {
                orgNo: orgNo,
                userOrgNo: this.session.getUserSession().orgNo

            };
            this.benchmarkService.getOrg(params)
                .subscribe(_data => {
                        this.org = _data.data[0];
                        if (this.org.orgGrade === '6') {
                            this.message.error('所选机构不允许作为上级机构!', {nzDuration: 2000});
                        } else {
                            this.benchmarkService.getOrgTypesByGrade(this.org.orgGrade).subscribe(
                                _ret => {
                                    this.orgTypeList = _ret.data;
                                },
                                error => {
                                    this.message.error(error.body.retMsg);
                                }
                            );
                        }
                    }
                );
        }
    }

    /**
     * 查询模板已分配范围
     */
    qryModelRange() {
        this.page.curPage = 1;
        this.modelDevRangeData = [];
        this.selectDev = [];
        this.devRange = [];
        const modelNo = this.benchmarkComponent.editModel.logicId;
        const modelOrg = this.benchmarkComponent.editModel.orgNo;
        let devNos = [];
        this.benchmarkService.qrySelectedDevNo({orgNo: modelOrg}).subscribe(_data => {
            devNos = _data.data;
            devNos.forEach(a => {
                this.devRange.push(a);
            });
        });
        const param = {
            modelId: modelNo,
            curPage: this.page.curPage,
            pageSize: this.page.pageSize,
        };
        let existModelRange = [];
        let orgName: string;
        let typeName: string;
        let vendorName: string;
        let catalogName: string;
        let devno: string;
        let logicid: string;
        this.benchmarkService.qryModelRange(param).subscribe(_data => {
            existModelRange = _data.data;
            this.page.totalRow = _data['totalRow'];
            existModelRange.forEach(e => {
                orgName = e.orgno;
                typeName = e.type;
                vendorName = e.vendor;
                catalogName = e.catalog;
                devno = e.devno;
                logicid = e.logicid;
                
                for (let i = 0; i < this.orgs.length; i++) {
                    if (this.orgs[i].no == e.orgno) {
                        orgName = this.orgs[i].name;
                        break;
                    }
                }
                this.allDevType.forEach(devType => {
                    if (devType.no === e.type) {
                        typeName = devType.name;
                    }
                });

                this.allDevCatalog.forEach(catalog => {
                    if (catalog.no === e.catalog) {
                        catalogName = catalog.name;
                    }
                });

                this.allDevBrand.forEach(vendor => {
                    if (vendor.no === e.vendor) {
                        vendorName = vendor.name;
                    }
                });

                this.modelDevRangeData.push({
                    org: orgName,
                    type: typeName,
                    vendor: vendorName,
                    catalog: catalogName,
                    dev: devno,
                    id: logicid,
                    select: false
                });
            });
        }, (error) => {
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    return() {
        this.benchmarkService.back();
    }

    backModel() {
        this.benchmarkComponent.flag = true;
    }
}
