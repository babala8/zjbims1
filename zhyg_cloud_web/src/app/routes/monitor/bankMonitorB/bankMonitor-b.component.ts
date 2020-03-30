import {Component, OnInit, ViewChild, ElementRef} from '@angular/core';
import {NzMessageService} from 'ng-zorro-antd';
import {NgxEchartsService} from 'ngx-echarts';
import {WebSocketService} from '../../remote/webSocketService';
import {BankMonitorBService} from './bankMonitor-b.service';
import {HttpResponse} from '@angular/common/http';
import {E} from '@angular/core/src/render3';

@Component({
    templateUrl: './bankMonitor-b.html',
    styleUrls: ['./bankMonitor-b.less']
})
export class BankMonitorBComponent implements OnInit {
    @ViewChild('bootRatioCharts') bootRatioCharts: ElementRef;
    @ViewChild('retainRatioCharts') retainRatioCharts: ElementRef;
    @ViewChild('faultAnalysisCharts') faultAnalysisCharts: ElementRef;
    @ViewChild('deviceNumCharts') deviceNumCharts: ElementRef;
    @ViewChild('cashInventoryBar') cashInventoryBar: ElementRef;
    @ViewChild('paperDownCharts') paperDownCharts: ElementRef;
    @ViewChild('CounterCharts') CounterCharts: ElementRef;
    @ViewChild('eachDayAddCaseCharts') eachDayAddCaseCharts: ElementRef;
    // 实时时间的显示
    curDateTime: Date;
    resourceUrl = '';
    option_counter: any;
    bootRatio_option: any;          // 实时开机率
    paperDowntime_option: any;       // 纸停机比率
    deviceNumPie_option: any;       // 设备数量
    deviceRetention_option: any;    // 设备吞卡率
    cashInventory_option: any;      // 现金库存
    retainRatio_option: any;
    faultAnalysis_option: any;       // 每日工单走势
    eachDayAddCase_option: any;       // 每日工单走势
    data_pie: any;

    devCount: any;
    nodeCount: any;
    // 表格数据
    dataSet = [];
    color1 = ['#4F6DCD', '#F88582', '#0DD4A5', '#FACE4B', '#66CC00', '#3300CC', '#660099'];

    color2 = ['#4F6DCD', '#F88582', '#0DD4A5', '#FACE4B', '#66CC00', '#3300CC', '#660099'];
//自动取款机  存取款一体机
    // catalogNames=['BSM','MTM','IST','BTS','SFM','CDT','STM','SQM','IAS','MDM','ATM'];
    // 需要循环展示开机率的类型名字
    catalogNames = ['ATM','CRS','STM','BSM','CDT'];
    // 当前类型名字对应的catalogNames列表序号
    catalogIndex = 0;


    constructor(
        private bankMonitorBService: BankMonitorBService,
        private message: NzMessageService,
        private es: NgxEchartsService,
        private websocketService: WebSocketService,
    ) {
        // 仪表盘 开机率
        this.bootRatio_option = {

            tooltip: {
                formatter: '{a} <br/> {b} : {c}%'
            },
            axisLabel: {
                color: '#ff0' // 刻度线标签颜色
            },
            series: [
                {
                    title: {
                        color: '#fff',
                        fontWeight: 'bolder',
                        offsetCenter: ['-100%', '-100%'],
                        fontSize: 20,
                    },
                    startAngle:160,
                    endAngle:20,
                    axisLine:{
                        lineStyle:{
                            color:[[0.2, '#4F6DCD'], [0.8,   '#0DD4A5'], [1,   '#FACE4B']],
                            width:10,
                        },
                    },
                    splitNumber:5,
                    pointer:{
                        length:'80%',
                        width:'2',

                    },
                    name: '开机率',
                    type: 'gauge',
                    center: ['50%', '45%'],
                    radius: '80%',

                    detail: {
                        show:true,
                        formatter: '{value}%',
                        offsetCenter: [0, '-30%'],// 显示位置
                        fontSize:20
                    },
                    data: [
                        {
                            name: '',
                            value: ''
                        }
                    ]
                },
                {
                    title: {
                        color: '#fff',
                        fontWeight: 'bolder',
                        offsetCenter: ['-100%', '-100%'],
                        fontSize: 20,
                    },
                    startAngle:160,
                    endAngle:20,
                    axisLine:{
                        lineStyle:{
                            color:[[0.2, '#4F6DCD'], [0.8,   '#0DD4A5'], [1,   '#FACE4B']],
                            width:10,
                        },
                    },
                    splitNumber:5,
                    pointer:{
                        length:'80%',
                        width:'2',

                    },
                    name: '开机率',
                    type: 'gauge',
                    center: ['50%', '90%'],
                    radius: '80%',

                    detail: {
                        show:true,
                        formatter: '{value}%',
                        offsetCenter: [0, '-30%'],
                        fontSize:20
                    },
                    data: [
                        {
                            name: '',
                            value: ''
                        }
                    ]
                }
            ]
        };
        // 纸停机比率  折线图
        this.paperDowntime_option = {
            // title: {
            //     text: '缺纸停机率',
            //     x: 'center',
            //     textStyle: {
            //         fontSize: 18,
            //         color: '#afeeee'
            //     }
            // },
            tooltip: {
                trigger: 'axis',
                formatter: '{b0}<br/>{a0}: {c0}%<br />{a1}: {c1}%<br />{a2}: {c2}%<br />{a3}: {c3}%'
            },
            grid: {
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
                data: ['自动取款机', '自动存款机', '存取款一体机', '多媒体自助设备' ]
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
                data: ['07-24', '07-25', '07-26', '07-27', '07-28', '07-29', '07-30']
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
                    name: '自动取款机',
                    type: 'line',
                    itemStyle: {color: '#4F6DCD'},
                    data: [2, 7.2, 2, 5.32, 11.2, 9.8, 12.2]
                },
                {
                    name:  '自动存款机',
                    type: 'line',
                    itemStyle: {color: '#FACE4B'},
                    data: [12, 12, 8.2, 12, 13.2, 12, 10.2]
                },
                {
                    name:  '存取款一体机',
                    type: 'line',
                    itemStyle: {color: '#F88582'},
                    data: [4.2, 9.8, 12, 3.2, 5.2, 11.9, 9.2]
                },
                {
                    name:  '多媒体自助设备',
                    type: 'line',
                    itemStyle: {color: '#0DD4A5'},
                    data: [9, 13, 10.6, 13.9, 15.2, 14.2, 13.2]
                }
            ]
        };
        // 设备数量 饼图
        this.deviceNumPie_option = {
            // title: {
            //     text: '设备数量',
            //     x: 'center',
            //     textStyle: {
            //         fontSize: 18,
            //         color: '#afeeee'
            //     }
            // },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c}'
            },
            legend: {
                orient: 'horizontal',
                top: '4%',
                left: '5%',
                textStyle: {
                    color: '#ffffff',
                    fontSize:'12',
                    fontFamily:'SimHei,Regular',
                },
                data: ['自动取款机', '存取款一体机', '多媒体自助设备', '自动存款机']
            },
            series: [
                {
                    name: '设备数量',
                    type: 'pie',
                    radius: '70%',
                    center: ['50%', '58%'],
                    label: {
                        position: 'inside'
                    },
                    data: [
                        {
                            value: 335,
                            name: '自动取款机',
                            itemStyle: {color: this.color2[0],opacity:1, },
                            label: {
                                normal: {
                                    show: true,
                                    position: 'inner',
                                    formatter: '{c}'
                                }
                            }
                         },
                        {
                            value: 310,
                            name: '存取款一体机',
                            itemStyle: {color: this.color2[1], opacity:1,},
                            label: {
                                normal: {
                                    show: true,
                                        position: 'inner',
                                        formatter: '{c}'
                                }
                            }
                        },
                        {
                            value: 234,
                            name: '多媒体自助设备',
                            itemStyle: {color: this.color2[2], opacity:1,},
                            label: {
                                normal: {
                                    show: true,
                                    position: 'inner',
                                    formatter: '{c}'
                                }
                            }
                        },
                        {
                            value: 135,
                            name: '自动存款机',
                            itemStyle: {color: this.color2[3], opacity:1,},
                            label: {
                                normal: {
                                    show: true,
                                    position: 'inner',
                                    formatter: '{c}'
                                }
                            }
                        }
                    ]
                }
            ]
        };
        // 设备吞卡率 表格
        this.deviceRetention_option = {};
        // 设备现金库存 柱状图
        this.cashInventory_option = {
            // title: {
            //     text: '设备现金库存',
            //     x: 'center',
            //     textStyle: {
            //         fontSize: 18,
            //         color: '#afeeee'
            //     }
            // },
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'line'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                top: '3%',
                textStyle: {
                    color: '#ffffff',
                    fontSize:'12px',
                    fontFamily:'SimHei,Regular',
                },
                data: ['自动取款机',  '自动存款机', '存取款一体机', '多媒体自助设备']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    color: '#fff'
                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                }
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
                data: ['07-20', '07-21', '07-22', '07-23', '07-24', '07-25', '07-26', '07-27', '07-28', '07-29']
            },
            series: [
                {
                    name: '自动取款机',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    itemStyle: {
                        color: this.color2[0],
                        width:'23px',
                        height:13,
                        borderRadius:3,
                    },
                    data: [293, 330, 340, 320, 302, 301, 334, 390, 330, 320]
                },
                {
                    name: '自动存款机',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    itemStyle: {
                        color: this.color2[3],
                        width:'23px',
                        height:13,
                        borderRadius:3,
                    },
                    data: [900, 890, 790, 980, 832, 901, 934, 1290, 1330, 1320]
                },
                {
                    name: '存取款一体机',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    itemStyle: {
                        color: this.color2[1],
                        width:'23px',
                        height:13,
                        borderRadius:3,},
                    data: [200, 210, 105, 220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: '多媒体自助设备',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    itemStyle: {
                        color: this.color2[2],
                        width:'23px',
                        height:13,
                        borderRadius:3,},
                    data: [234, 123, 320, 150, 212, 201, 154, 190, 330, 410]
                }
            ]
        };
        // 工单走势 折线图
        this.faultAnalysis_option = {
            // title: {
            //     text: '每日工单走势（7天）',
            //     left: 'center',
            //     textStyle: {
            //         color: '#afeeee',
            //         fontSize: 18
            //     }
            // },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                top: '3%',
                data: ['每日新增', '每日关闭'],
                textStyle: {
                    color: '#fff'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
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
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    color: '#fff'
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
                    name: '每日新增',
                    type: 'line',
                    itemStyle: {color: this.color2[2]},
                    data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name:  '每日关闭',
                    type: 'line',
                    itemStyle: {color: this.color2[3]},
                    data: [120, 132, 101, 134, 90, 230, 210]
                }
            ]
        };
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
                    data: [2, 7.2, 2, 5.32, 11.2, 9.8, 12.2,20,30,40,50,60,70,80,90,75,65,55,49,33,65,56,23,54,98,75,42,62,35,15]
                },
            ]
        }
    }
    showEchart() {

        console.log(this.es.getInstanceByDom(this.deviceNumCharts.nativeElement));
    }
    back() {
        this.exitfullscreen();
        history.go(-1); // 返回上一层
    }

    ngOnInit() {
        this.fullscreenToggle();
        this.curDateTime = new Date();
        setInterval(date => {
            this.curDateTime = new Date();
        }, 1000);
        // 表格数据
        this.updateRetainRatio();
        // 实时开机率
        this.updateBootRatio('ATM', 0);
        this.updateBootRatio(this.catalogNames[0], 1);
        setInterval(date => {
            this.changeBootRatio();
        }, 1000*5);
        this.updatedeviceNumPie();
        this.updateEachDayAddCase();
    }

    public fullscreenToggle(elem: any = document.activeElement): void {
        if (!document.fullscreenElement && !document.webkitCurrentFullScreenElement) {
            const docElm = elem;
            if (docElm.requestFullscreen) {
                docElm.requestFullscreen();
            } else if (docElm.mozRequestFullScreen) {
                docElm.mozRequestFullScreen();
            } else if (docElm.webkitRequestFullScreen) {
                docElm.webkitRequestFullScreen();
            } else if (docElm.requestFullscreen) {
                docElm.requestFullscreen();
            }
        }
    }
    public exitfullscreen (elem: any = document.activeElement){
        if (document.fullscreenElement && document.webkitCurrentFullScreenElement) {
            const docElm = elem;
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            }
        }
    }

    // 表格数据
    updateRetainRatio() {
        this.bankMonitorBService.getRetainRatio().subscribe(back => {
            this.dataSet = back.data;
            // this.es.getInstanceByDom(this.retainRatioCharts.nativeElement).setOption(this.retainRatio_option);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    // 实时开机率
    updateBootRatio(catalogName, index) {
        const params = {
            catalogName: catalogName
        };
        this.bankMonitorBService.getBootRatio(params).subscribe(back => {
            this.bootRatio_option.series[index].data[0].name = back.data.name;
            this.bootRatio_option.series[index].data[0].value = back.data.value * 100;
            // this.es.getInstanceByDom(this.bootRatioCharts.nativeElement).setOption(this.bootRatio_option);
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }

    // 更新饼状图 设备数量 数据
    updatedeviceNumPie() {
        this.bankMonitorBService.getCatalogScale().subscribe(catalogScale => {
            this.data_pie = catalogScale.data.pieList;
            this.deviceNumPie_option.title.text = '设备总量：' + catalogScale.data.devcount + ' | 网点数量：' + catalogScale.data.nodecount;
            if (this.data_pie != null || this.data_pie != []) {
                for (let i = 0; i < this.data_pie.length; i++) {
                    this.deviceNumPie_option.legend.data.push(this.data_pie[i].name);
                    this.deviceNumPie_option.series[0].data.push(
                        {
                            value: this.data_pie[i].devcount,
                            name: this.data_pie[i].name,
                            itemStyle: {color: this.color2[i]},
                            label: {
                                normal: {
                                    show: true,
                                    position: 'inner',
                                    formatter: '{d}%'
                                }
                            }
                        }
                    );
                }
                this.es.getInstanceByDom(this.deviceNumCharts.nativeElement).setOption(this.deviceNumPie_option);
            }
        });
    }

    updateEachDayAddCase() {
        this.bankMonitorBService.eachDayAddCase().subscribe(back => {
            this.faultAnalysis_option.xAxis.data = back.data.openTimes;
            this.faultAnalysis_option.series.push({
                data: back.data.caseCounts,
                type: 'line'
            });
            this.es.getInstanceByDom(this.eachDayAddCaseCharts.nativeElement).setOption(this.faultAnalysis_option);
        }, error => {
            console.log(error);
            this.message.error('交易分析异常');
        });
    }

    changeBootRatio(){
        let index = this.catalogIndex % 3;
        this.updateBootRatio(this.catalogNames[index],1);
        this.catalogIndex++;
    }

}
