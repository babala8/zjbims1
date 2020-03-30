import {Component, ElementRef, OnInit, TemplateRef, ViewChild} from '@angular/core';
import {DemoDashboardService} from './dashboard.service';
import {SessionService} from '@core/session.service';
import {HttpResponse} from '@angular/common/http';
import {NzMessageService} from 'ng-zorro-antd';
import {NgxEchartsService} from 'ngx-echarts';

declare var echarts: any;

@Component({
    selector: 'app-demo-dashboard',
    templateUrl: './dashboard.html',
    styleUrls: ['./dashboard.less']
})
export class DemoDashboardComponent implements OnInit {
    @ViewChild('rateCharts') rateCharts: ElementRef;
    @ViewChild('transTypeCharts') transTypeCharts: ElementRef;
    @ViewChild('monCharts') monCharts: ElementRef;
    @ViewChild('hotCharts') hotCharts: ElementRef;
    @ViewChild('pieCharts') pieCharts: ElementRef;
    @ViewChild('RateRkCharts') RateRkCharts: ElementRef;
    @ViewChild('TransRkCharts') TransRkCharts: ElementRef;
    @ViewChild('CounterCharts') CounterCharts: ElementRef;
    formModel = {};
    dateTimedata = [];
    weekdateTime = [];
    transCount = [];
    cashTransCount = [];
    mondateTime = [];
    montransCount = [];
    bfmontransCount = [];
    thermalDateTime = [];
    thermalData = [];
    thermal2Ddata = [];
    orgNameAry4Rate = [];
    openRateData = [];
    orgNameAry = [];
    transAmountData = [];
    resourceUrl = ''; // 资源路径

    option_counter: any;
    option_pie: any;
    option_linechart: any;
    option_Histogram: any;
    option_hotdisplay: any;
    option_volumeRk: any;
    option_rateRank: any;
    option_linechart4rate: any;

    devData: any = [];
    openrateData: any = [];
    transTypeData: any = [];
    colors = ['#f88582', '#face4b', '#4f6dcd', '#0dd4a5', 'pink', 'yellow', 'black', 'white'];
    /**
     * 布局收缩功能的实现
     */
    selectedValue;
    isCollapsed = true;
    triggerTemplate = null;
    @ViewChild('trigger') customTrigger: TemplateRef<void>;

    /** custom trigger can be TemplateRef **/
    changeTrigger(): void {
        this.triggerTemplate = this.customTrigger;
    }

    agencychange() {

    }

    /**
     * 实时时间的显示
     */
    curDateTime: Date;

    constructor(
        // private headerComponent: HeaderMenuComponent,
        private demoDashboardService: DemoDashboardService,
        private session: SessionService,
        private message: NzMessageService,
        private es: NgxEchartsService
    ) {

    }

    ngOnInit() {
        this.resourceUrl = '../../../../assets';
        this.formModel['org'] = {no: this.session.orgNo, name: this.session.getUserSession().orgName};
        /*
        *网点设备量统计饼状图数据【完成】
        */
        this.option_pie = {
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'horizontal',
                top: '10%',
                left: '10%',
                textStyle: {
                    fontSize: '12px',
                    fontFamily: 'SimHei',
                    fontWeight: 'Regular',
                    color: '#ffffff',
                },
            },
            series: [
                {
                    name: '设备占比',
                    type: 'pie',
                    radius: '57%',
                    center: ['43%', '56%'],
                    data: this.devData
                }
            ]
        };
         // 柜面数据
        this.option_counter = {
            tooltip: {
                trigger: 'axis',
                formatter: '{b0}<br/>{a0}: {c0}%<br />{a1}: {c1}%<br />{a2}: {c2}%<br />{a3}: {c3}%'
            },
            grid: {
                top: '10%', // 距上边距
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            legend: {
                top: '3%',
                textStyle: {
                    color: ['#4F6DCD', '#FACE4B', '#F88582', '#0DD4A5']
                },
            },
            xAxis: {
                type: 'category',
                axisLabel: {
                    color: '#fff'
                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
                data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',
                    '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    show: true,
                    interval: 'auto',
                    color: '#fff',
                    formatter: '{value}%'
                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
                splitLine: {
                    show: false,
                    lineStyle: {
                        type: 'dashed'
                    }
                },
            },
                series: [
            {
                type: 'line',
                itemStyle: {color: '#4F6DCD'},
                data: [2, 7.2, 2, 5.32, 11.2, 9.8, 12.2, 20, 30, 40, 50, 60, 70, 80, 90, 75, 65, 55, 49, 33, 65, 56, 23, 54, 98, 75, 42,
                    62, 35, 15]
            },
            ]
        };
        /*
        *网点开机率【完成】
        */
        this.option_linechart4rate = {
            // title: {
            //     text: '网点开机率',
            //     left: 'center',
            //     textStyle: {
            //         fontSize: 21,
            //         color: '#d3f7ff',
            //         fontFamily:'SimHei',
            //         fontWeight:'Regular'
            //     }
            // },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    lineStyle: {
                        color: '#57617B'
                    }
                }
            },
            legend: {
                icon: 'roundRect',
                itemWidth: 25,
                itemHeight: 15,
                itemGap: 13,
                left: 'center',
                textStyle: {
                    fontSize: '12px',
                    fontFamily: 'SimHei',
                    fontWeight: 'Regular',
                    color: '#ffffff',
                },
            },
            grid: {
                left: '2%',
                right: '2%',
                bottom: '5%',
                top: '16%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: false,
                axisLine: {
                    lineStyle: {
                        color: '#57617B'
                    },
                },
                // data: this.dateTimedata,
                axisLabel: {
                    interval: 0,
                    rotate: 50,
                    textStyle: {
                        color: '#fff',
                        fontWeight: 'normal',
                        fontSize: 12
                    }
                },
            }],
            yAxis: [{
                type: 'value',
                interval: 20,
                max: 100,
                axisTick: {
                    show: false
                },
                axisLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#fff',
                        fontWeight: 'normal',
                        fontSize: 12
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                }
            }],
            // series: this.openrateData
        };

        /*
        *月交易明细
        */
        this.option_linechart = {
            // title: {
            //     text: '月交易明细',
            //     left: 'center',
            //     textStyle: {
            //         fontSize: 21,
            //         color: '#d3f7ff',
            //         fontFamily:'SimHei',
            //         fontWeight:'Regular'
            //     }
            // },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['本月', '上月'],
                top: '20', // 距离容器顶端的距离
                left: '35%',
                textStyle: {
                    fontSize: '12px',
                    fontFamily: 'SimHei',
                    fontWeight: 'Regular',
                    color: '#ffffff',
                },
            },
            grid: {
                top: '18%', // 距上边距
                left: '5%', // 距离左边距
                right: '12%', // 距离右边距
                bottom: '12%', // 距离下边距
                containLabel: true
            },
            xAxis: {
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#363e83',
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#fff',
                        fontWeight: 'normal',
                        fontSize: '12',
                    },
                },
                type: 'category',
                boundaryGap: false,         // 坐标轴两边留白策略
                splitLine: {                // 网格线 x轴对应的是否显示
                    show: false
                },
                data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',
                    '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
            },

            yAxis: {
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#363e83',
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#fff',
                        fontWeight: 'normal',
                        fontSize: '12',
                    },
                },
                type: 'value',
                name: '个',
                splitLine: {                // 网格线 y轴对应的是否显示
                    show: false
                }
            },

            series: [
                {
                    name: '本月',
                    type: 'line',
                    data: this.montransCount,
                    itemStyle: {
                        color: 'green'
                    }

                },
                {
                    name: '上月',
                    type: 'line',
                    data: this.bfmontransCount,
                    itemStyle: {
                        color: 'red'
                    }
                }
            ]
        };

        this.option_Histogram = {
            // title: {
            //     text: '交易量',
            //     left: 'center',
            //     textStyle: {
            //         fontSize: 21,
            //         color: '#d3f7ff',
            //         fontFamily:'SimHei',
            //         fontWeight:'Regular'
            //     }
            // },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'horizontal',
                top: '10%',
                left: '2%',
                textStyle: {
                    fontSize: '12px',
                    fontFamily: 'SimHei',
                    fontWeight: 'Regular',
                    color: '#ffffff',
                },
            },
            series: [
                {
                    name: '交易占比',
                    type: 'pie',
                    radius: '57%',
                    center: ['38%', '56%'],
                    data: this.transTypeData
                }
            ]
        };


// 设备交易热力图
        const devCataloglist: string[] = ['ATM','CRS', 'CDT','BSM'];

        this.option_hotdisplay = {
            // title: {
            //     text: '设备交易热力图',
            //     left: 'center',
            //     textStyle: {
            //         fontSize: 21,
            //         color: '#d3f7ff',
            //         fontFamily:'SimHei',
            //         fontWeight:'Regular'
            //     }
            // },
            tooltip: {
                position: 'top'
            },
            animation: false,
            grid: {
                top: '25%', // 距上边距
                left: '10%', // 距离左边距
                right: '10%', // 距离右边距
                bottom: '12%', // 距离下边距
            },
            xAxis: {
                type: 'category',
                data: this.thermalDateTime,
                splitArea: {
                    show: true
                },
                axisLabel: {
                    textStyle: {
                        color: '#fff',
                        fontWeight: 'normal',
                        fontSize: '12',
                    },
                },
            },
            yAxis: {
                type: 'category',
                data: devCataloglist,
                splitArea: {
                    show: true
                },
                axisLabel: {
                    textStyle: {
                        color: '#fff',
                        fontWeight: 'normal',
                        fontSize: '12',
                    },
                },
            },

            visualMap: {
                min: 0,
                max: 200,
                calculable: true,
                orient: 'horizontal',
                left: 'center',
                top: '-5%',
                bottom: '15%',
                textStyle: {
                    color: '#fff'
                },
            },
            series: [{
                type: 'heatmap',
                data: this.thermal2Ddata,
                label: {
                    normal: {
                        show: true
                    }
                },
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }]
        };

        /*
        *开机率网点排名
        */
        const valdata = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.option_rateRank = {
            // title: {
            //     text: '开机率排名',
            //     left: 'center',
            //     show: true,
            //     textStyle: {
            //         fontSize:'21px',
            //         color: '#d3f7ff',
            //         fontFamily:'SimHei',
            //         fontWeight:'Regular'
            //     }
            // },
            grid: {
                left: '1%',
                right: '1%',
                bottom: '1%',
                top: '8%',
                containLabel: true
            },
            tooltip: {
                trigger: 'axis',
                formatter: function (c) {
                    let d;
                    for (let i = 0; i < c.length; i++) {
                        if (c[i].axisIndex === 0) {
                            d = c[i].axisValue + ' : ' + c[i].data + '%';
                        }
                    }
                    return d;
                },
                axisPointer: {
                    type: 'none'
                }
            },
            xAxis: {
                show: false
            },
            yAxis: [{
                show: true,
                data: this.orgNameAry4Rate,
                inverse: true,
                max: 10,
                axisLabel: {
                    textStyle: {
                        fontSize: 12,
                        color: '#fff'
                    }
                },
                axisLine: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                axisTick: {
                    show: false
                }
            }, {
                show: true,
                inverse: true,
                data: valdata,
                max: 10,
                axisLabel: {
                    textStyle: {
                        fontSize: 12,
                        color: '#fff'
                    }
                },
                axisLine: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                axisTick: {
                    show: false
                }
            }],
            series: [{
                name: '条',
                type: 'bar',
                yAxisIndex: 0,
                data: this.openRateData,
                barWidth: 18,
                itemStyle: {
                    normal: {
                        color: '#2835B8',
                        barBorderRadius: [0, 15, 15, 0]
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: 'inside',
                        formatter: '{c}%'
                    }
                },
                z: 100
            }, {
                name: '框',
                type: 'bar',
                yAxisIndex: 1,
                data: [100, 100, 100, 100, 100, 100, 100, 100, 100, 100],
                barWidth: 18,
                itemStyle: {
                    normal: {
                        color: 'rgba(18,30,60,0.1)', // 整条进度条改为半透明就可以解决位置被覆盖的问题
                        borderColor: '#121E3C',
                        barBorderRadius: [0, 15, 15, 0]
                    }
                },
                label: {
                    normal: {
                        show: false
                    }
                },
                z: 101
            }]
        };
        /*
         *各支行网点交易量排名
         */
        this.option_volumeRk = {
            color: ['#2adecf'],
            textStyle: {
                color: 'rgb(222, 222, 222)',
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '3%',
                bottom: '3%',
                top: '10%',
                containLabel: true
            },
            // title: {
            //     text: '交易量网点排名',
            //     left: 'center',
            //     textStyle: {
            //         fontSize: 21,
            //         color: '#d3f7ff',
            //         fontFamily:'SimHei',
            //         fontWeight:'Regular'
            //     }
            // },
            yAxis: [{
                data: this.orgNameAry,
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                axisLabel: {
                    interval: 0,
                }
            },
                {
                    data: this.transAmountData,
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    splitLine: {
                        show: false
                    },
                    axisLabel: {
                        interval: 0,
                    }
                }
            ],
            xAxis: [{
                type: 'value',
                name: '',
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                axisLabel: {
                    show: false,
                    interval: 0
                },
            }],
            series: [{
                name: '',
                type: 'bar',
                barGap: '10%',
                barCategoryGap: '60%',
                itemStyle: {
                    normal: {
                        barBorderRadius: [0, 30, 30, 0],
                        color: new this.es.echarts.graphic.LinearGradient(
                            1, 0, 0, 0, [{
                                offset: 0,
                                color: '#90e6ff'
                            },
                                {
                                    offset: 1,
                                    color: '#6eb2fe'
                                }
                            ]
                        )
                    }
                },
                data: this.transAmountData,
                zlevel: 11
            }]
        };

        this.refreshData();
        this.getWdData();
    }

    refreshData() {
        this.curDateTime = new Date();
        setInterval(date => {
            this.curDateTime = new Date();
        }, 1000);

        /**
         * 网点交易量排名
         */
        const params = '';
        this.demoDashboardService.getWdTransInfoRanking(params)
            .subscribe(TransInfoRank => {
                TransInfoRank.data.forEach(TransInfoRankList => {
                    this.orgNameAry.push(TransInfoRankList.name);
                    this.transAmountData.push(TransInfoRankList.transcount);
                });
                this.es.getInstanceByDom(this.TransRkCharts.nativeElement).setOption({
                    yAxis: [{
                        data: this.orgNameAry
                    }, {
                        data: this.transAmountData
                    }],
                    series: [{
                        data: this.transAmountData
                    }]
                });
            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });

        /**
         *开机率排名
         */
        this.demoDashboardService.getWdOpenRateRanking(params)
            .subscribe(OpenRateRank => {
                console.log(OpenRateRank);
                OpenRateRank.data.forEach(OpenRateRankList => {
                    this.orgNameAry4Rate.push(OpenRateRankList.orgName);
                    this.openRateData.push(OpenRateRankList.openrate);
                });
                console.log(this.openRateData);
                this.es.getInstanceByDom(this.RateRkCharts.nativeElement).setOption({
                    yAxis: [{
                        show: true,
                        data: this.orgNameAry4Rate,
                        inverse: true,
                        max: 10,
                    }],
                    series: [{
                        data: this.openRateData
                    }]
                });
            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });
    }

    /**
     * 获取登录用户所属机构下所有网点的信息
     */
    getWdData() {
        const Rateparams = {
            orgNo: this.session.getUserSession().orgNo,
        };
        /**
         * 网点开机率
         */
        this.demoDashboardService.getWdOpenRate(Rateparams)
            .subscribe(ratedata => {
                console.log(ratedata);
                ratedata.data.forEach((openRatelist, index) => {
                    const tmpRate = [];
                    this.dateTimedata = [];
                    openRatelist.openRate.forEach( openrate => {
                        tmpRate.push(openrate.openrate);
                        this.dateTimedata.push(openrate.dateTime);
                    });
                    this.openrateData.push(
                        {
                            name: openRatelist.name,
                            type: 'line',
                            smooth: true,
                            lineStyle: {
                                normal: {
                                    width: 2
                                }
                            },
                            areaStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                        offset: 0,
                                        color: 'rgba(82, 191, 255, 0.3)'
                                    }, {
                                        offset: 0.8,
                                        color: 'rgba(82, 191, 255, 0)'
                                    }], false),
                                    shadowColor: 'rgba(228, 139, 76, 0.1)',
                                    shadowBlur: 10
                                }
                            },
                            symbolSize: 4,
                            itemStyle: {
                                normal: {
                                    color: this.colors[index],
                                    borderColor: '#e48b4c'
                                },
                            },
                            data: tmpRate,
                        }
                    );
                });
                this.es.getInstanceByDom(this.rateCharts.nativeElement).setOption({
                    xAxis: [{
                        data: this.dateTimedata,
                    }],
                    series: this.openrateData
                });
            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });

        /**
         * 交易类型占比统计
         */
        this.demoDashboardService.getWdTransType(Rateparams)
            .subscribe(transTypeList => {
                transTypeList.data.forEach((transType, index) => {
                    this.transTypeData.push({
                        value: transType.transcount,
                        name: transType.name,
                        itemStyle: {color: this.colors[index]},
                        label: {
                            normal: {
                                show: true,
                                position: 'inner',
                                formatter: '{d}%'
                            }
                        }});
                });
                this.es.getInstanceByDom(this.transTypeCharts.nativeElement).setOption({
                    series: [
                        {
                            data: this.transTypeData
                        }
                    ]
                });
            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });

        /**
         * 月交易明细
         */
        this.demoDashboardService.getWdMonthTransInfo(Rateparams)
            .subscribe(TransInfo => {
                TransInfo.data.monthTransList.forEach(monthTransInfo => {
                    this.montransCount.push(monthTransInfo.transCount);
                });
                TransInfo.data.beforeMonthTransList.forEach(beforeMonthTrans => {
                    this.bfmontransCount.push(beforeMonthTrans.transCount);
                });
                this.es.getInstanceByDom(this.monCharts.nativeElement).setOption({
                    series: [{
                        data: this.montransCount,
                    }, {
                        data: this.bfmontransCount,
                    }]
                });

            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });

        /**
         * 设备交易热力图
         */
        this.demoDashboardService.getWdDevCatalogTransUsedInfo(Rateparams)
            .subscribe(DevCatalogTransUsedInfo => {
                let i = 0;
                let j = 0;
                let k = 0;
                DevCatalogTransUsedInfo.data.forEach(DevTransInfoList => {
                    if (k == 0) {
                        this.thermalDateTime.push(DevTransInfoList.datetime);
                    }
                    if (DevTransInfoList.name === 'ATM') {
                        i = 0;
                        this.thermalData.push(j);
                        this.thermalData.push(i);
                        this.thermalData.push(DevTransInfoList.transcount);
                        this.thermal2Ddata.push(this.thermalData);
                        this.thermalData = [];
                    } else if (DevTransInfoList.name === 'CRS') {
                        i = 1;
                        this.thermalData.push(j);
                        this.thermalData.push(i);
                        this.thermalData.push(DevTransInfoList.transcount);
                        this.thermal2Ddata.push(this.thermalData);
                        this.thermalData = [];
                    } else if (DevTransInfoList.name === 'CDT') {
                        i = 2;
                        this.thermalData.push(j);
                        this.thermalData.push(i);
                        this.thermalData.push(DevTransInfoList.transcount);
                        this.thermal2Ddata.push(this.thermalData);
                        this.thermalData = [];
                    } else if (DevTransInfoList.name === 'BSM') {
                        i = 3;
                        this.thermalData.push(j);
                        this.thermalData.push(i);
                        this.thermalData.push(DevTransInfoList.transcount);
                        this.thermal2Ddata.push(this.thermalData);
                        this.thermalData = [];
                    }
                    k++;
                    if (k === 2) {
                        k = 0;
                        j++;
                    }
                });
                this.es.getInstanceByDom(this.hotCharts.nativeElement).setOption({
                    xAxis: {
                        data: this.thermalDateTime,
                    },
                    series: [{
                        data: this.thermal2Ddata,
                    }]
                });
            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });

        /**
         * 设备量统计
         */
        this.demoDashboardService.getWdDevCatalog(Rateparams)
            .subscribe(devCatalogInfo => {
                devCatalogInfo.data.forEach((devCatalog, index) => {
                    this.devData.push({
                        value: devCatalog.count,
                        name: devCatalog.name,
                        itemStyle: {color: this.colors[index]},
                        label: {
                            normal: {
                                show: true,
                                position: 'inner',
                                formatter: '{d}%'
                            }
                        }});
                });
                this.es.getInstanceByDom(this.pieCharts.nativeElement).setOption({
                    series: [
                        {
                            data: this.devData
                        }
                    ]
                });
            }, (error) => {
                console.log(error);
                /*if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }*/
            });
    }
}
