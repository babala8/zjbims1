import {Component, OnInit, OnDestroy, ViewChild, ElementRef} from '@angular/core';
import {NzMessageService} from 'ng-zorro-antd';
import {NgxEchartsService} from 'ngx-echarts';
import {BankMonitorAService} from './bankMonitor-a.service';
import {WebSocketService} from '../../remote/webSocketService';
import {CountUp} from 'countup.js';
import {HttpResponse} from '@angular/common/http';
import {deepCopy} from '@zjft/abc/utils/utils';
import {SessionService} from '@core/session.service';
import {log} from 'util';

@Component({
    templateUrl: './bankMonitor-a.html',
    selector: 'nz-demo-table-basic',
    styleUrls: ['./bankMonitor-a.less']
})
export class BankMonitorAComponent implements OnInit, OnDestroy {
    @ViewChild('pieHistogramCharts') pieCharts: ElementRef;
    @ViewChild('HotMapCharts') HotMapCharts: ElementRef;
    @ViewChild('histogramCharts') histogramCharts: ElementRef;
    @ViewChild('transCountRankCharts') transCountRankCharts: ElementRef;
    private time;
    countSub1:any;// 动态数字订阅
    countSub:any;// 饼状图 实时订阅
    resourceUrl: any; // 资源路径
    // 实时时间的显示
    curDateTime: Date;
    // 饼状图s
    option_pie: any;
    echarts: any;
    data_pie = [];
    // 30天交易量柱状图：全行，存款、取款、转账，30天内滚动的柱状图
    transHistogram_option: any;
    // 全行当天已叫号人次，全行实时排队人次 todo 改成初始值0
    callCount = {called: 0, wait: 0};

    fla = true;
    // 饼状图内嵌柱状图 24小时内滚动
    init_option_pie_histogram: any;

    // 交易总金额和数量，实时推送
    transData = {transAmount: 0, transCount: 0};
    /**
     * 根据字段名获取表单字段值
     * @param num
     */
        // 交易类型排名
    transCountRank: any;
    indexMap = [
        {
            name: 'china',
            mapData: []
        },
        {
            name: '上海',
            mapData: []
        },
        {
            name: '浙江',
            mapData: []
        },
        {
            name: '安徽',
            mapData: []
        },
    ];
    color1 = ['#d67786', '#4763c5', '#d5b259', '#10b9a5', '#66CC00', '#2894FF', '#660099'];
    color2 = ['#d5b259', '#d67786', '#4763c5', '#10b9a5', '#66CC00', '#2894FF', '#660099'];
    // 四个省份热力图
    option_Hotmap: any;
    // 设备故障率
    retainRatio_option: any;
    // 全行每日新增工单数走势（30天），折线图
    eachDayAddCase_option: any;
    // 保存定时器
    changeMpaTimer: any;
    constructor(
        private bankMonitorAService: BankMonitorAService,
        private message: NzMessageService,
        private es: NgxEchartsService,
        private websocketService: WebSocketService,
        private session: SessionService,
    ) {
        // 饼状图加柱状图 实时交易分析（每小时）
        this.init_option_pie_histogram = {
            tooltip: {},
            legend: {
                type: 'scroll',
                orient: 'horizontal',
                x: 'center',
                textStyle: {
                    fontSize: 16,
                    color: '#ffffff',
                },
                data: []
            },
            dataset: {
                source: []
            },
            xAxis: {
                type: 'category',
                axisLabel: {    // 坐标轴刻度标签的相关设置。

                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
            },
            yAxis: {
                splitLine: {
                    show: false,
                    lineStyle: {
                        type: 'dashed'
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
            },
            grid: {
                left: '27%',
                right: '27%',
                top: '29%',
                bottom: '29%',
            },
            series: [
                {

                }
            ]
        };

        /*
        *网点设备量统计饼状图数据
        */
        this.option_pie = {
            title: {
                left: 'center',
                textStyle: {
                    fontSize: 18,
                    color: '#afeeee'
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                top: 'middle',
                left: '10%',
                textStyle: {
                    color: 'white'
                },
                data: []
            },
            series: []
        };

        // 四个省份交易热力图 t-1
        this.option_Hotmap = {
            title: {
                left: 'center',
                top: 'top',
                textStyle: {
                    fontSize: 18,
                    color: '#ffffff'
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: function (params) {
                    if (typeof (params.value)[2] === 'undefined') {
                        return params.name + ' : ' + params.value;
                    } else {
                        return params.name + ' : ' + params.value[2];
                    }
                }
            },
            legend: {
                left: 'left',
                data: ['强', '中', '弱'],
                textStyle: {
                    color: '#ccc'
                }
            },
            visualMap: {
                left: 'right',
                min: 50,
                max: 500,
                inRange: {
                    color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8',
                        '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
                },
                text: ['高', '低'],           // 文本，默认为数值文本
                textStyle: {
                    color: '#fff'
                },
                calculable: true
            },
            series: [
                {
                    type: 'map',
                    // map:  'china',
                    name: '省/市',
                    geoIndex: 1,
                    aspectScale: 0.75,  // 长宽比
                    showLegendSymbol: true,  // 存在legend时显示
                    label: {
                        normal: {
                            show: false,
                        },
                        emphasis: {
                            show: false,
                            textStyle: {
                                color: '#fff'
                            }
                        }
                    },
                    roam: false,
                    itemStyle: {
                        normal: {
                            areaColor: '#031525',
                            borderColor: '#3B5077',
                            borderWidth: 1
                        },
                        emphasis: {
                            areaColor: '#0f2c70'
                        }
                    },
                    // data: this.provinceMap
                },
            ]
        };
        // 柱状图
        this.transHistogram_option = {
            legend: {
                orient: 'horizontal',
                type: 'scroll',
                textStyle: {
                    fontSize: 16,
                    color: '#ffffff'
                },
            },
            tooltip: {},
            dataset: {
                source: []
            },
            xAxis: {
                type: 'category',
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
                axisLabel: {
                    color: '#fff'
                }
            },
            yAxis: {
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
                axisLabel: {
                    color: '#fff'
                },
                splitLine: {
                    show: false,
                    lineStyle: {
                        type: 'dashed'
                    }
                },
            },
            series: []
        };
        //
        this.eachDayAddCase_option = {
            title: {
                left: 'center',
                textStyle: {
                    fontSize: 12,
                    color: '#afeeee'
                }
            },
            axisLabel: {
                color: '#ff0' // 刻度线标签颜色
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: []
            },
            yAxis: {
                type: 'value'
            },
            series: []
        };
        // 交易类型
        this.transCountRank = {
            // title: {
            //     text: '交易类型排名',
            //     left: 'center',
            //     textStyle: {
            //         fontSize: 18,
            //         color: '#afeeee'
            //     }
            // },
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                top: '2%',
                left: '5%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                axisLabel: {
                    color: '#fff'
                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0',
                    }
                },
                splitLine: {
                    show: false
                }
            },
            yAxis: {
                type: 'category',
                axisLabel: {
                    color: '#fff'
                },
                axisLine: {
                    lineStyle: {
                        color: '#f0f0f0'
                    }
                },
                data: []
            },
            series: []
        };
    }
    showEchart() {
        console.log(this.es.getInstanceByDom(this.histogramCharts.nativeElement));
    }
    back() {
        this.exitfullscreen();
        history.go(-1); // 返回上一层
    }

    ngOnInit() {
        this.resourceUrl = '../../../../assets';
        this.fullscreenToggle();
        this.curDateTime = new Date();
        setInterval(() => {
            this.curDateTime = new Date();
        }, 1000);


        this.initHotMapData();

        this.registerMap();


        // todo 延迟执行初始化map，直接调用报错，需前端优化
        setTimeout(() => {
            this.changeMap('first');
        }, 1000);
        // 每5秒向左切换地图
        this.changeMpaTimer = setInterval(() => {
            this.changeMap('left');
        }, 10000);

        this.updateTransHistogram();

        this.updateCallCount();
        // 每5秒切换全行当天已叫号人次，全行实时排队人次
        this.time=setInterval(date => {
            this.updateCallCount();
        }, 5000);

        //
        this.initTransScreenWebSocket();
        this.initPieAndHistogramWebSocket();
        this.getTransCountRank();

    }

    ngOnDestroy() {
        if (this.changeMpaTimer) {
            clearInterval(this.changeMpaTimer);
            this.countSub.unsubscribe();
            this.countSub1.unsubscribe();
        }
        if(this.time){
            clearInterval(this.time);
        }
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


    /**
     * 根据向左、向右、第一，切换地图及对应地图的数据
     * factor：left,right,first
     */
    changeMap(factor) {
        let nextMapIndex = 0;
        // 第一，切换地图及对应地图的数据
        if (factor == 'first') {
            nextMapIndex = 0;

            // 向左切换地图及对应地图的数据
        } else if (factor == 'left') {
            let currentMapIndex = this.getCurrentMapIndex();
            if (currentMapIndex == this.indexMap.length - 1) {
                nextMapIndex = 0;
            } else {
                nextMapIndex = currentMapIndex + 1;
            }

            // 向右切换地图及对应地图的数据
        } else if (factor == 'right') {
            let currentMapIndex = this.getCurrentMapIndex();
            if (currentMapIndex == 0) {
                nextMapIndex = this.indexMap.length - 1;
            } else {
                nextMapIndex = currentMapIndex - 1;
            }
        }
        // 切换标题、底图、交易数据
        this.es.getInstanceByDom(this.HotMapCharts.nativeElement).setOption({
            title: [{
                text: this.indexMap[nextMapIndex].name,
                left:'50%',
                textStyle: {
                    color: '#ffffff',
                    fontSize: 18,
                },
            }],
            series: [
                {
                    map: this.indexMap[nextMapIndex].name,
                    data: this.indexMap[nextMapIndex].mapData,
                },
            ],
        });
    }

    // 获得当前地图对应的序号，用于左右切换
    getCurrentMapIndex() {
        const hotMap_options = this.es.getInstanceByDom(this.HotMapCharts.nativeElement).getOption();
        const mapName = hotMap_options.series[0].map;
        for (let i = 0; i < this.indexMap.length; i++) {
            if (mapName == this.indexMap[i].name) {
                return i;
            }
        }
    }


    // 登记所有需要展示的map
    registerMap() {
        for (let i = 0; i < this.indexMap.length; i++) {
            this.bankMonitorAService.getMapjson(this.indexMap[i].name).subscribe(mapjsoninfo => {
                this.es.echarts.registerMap(this.indexMap[i].name, mapjsoninfo);
            });
            console.log(this.indexMap[i].name)
        }
    }

    // 获得所有需要展示地图的数据
    initHotMapData() {
        this.websocketService.createObservableSocket(this.bankMonitorAService.getHopMapWS(this.session.token, this.session.getUserSession().account))
            .subscribe(data => {
                data = JSON.parse(data);
                this.indexMap[0].mapData = data.chongqing;
                this.indexMap[1].mapData = data.sichuan;
                this.indexMap[2].mapData = data.guizhou;
                this.indexMap[3].mapData = data.shanxi;
            }, error => {
                console.log(error);
                this.websocketService.ws.close();
                this.message.error('地图数据异常');
            });

    }


    updateCallCount() {
        this.bankMonitorAService.getCallCount().subscribe(back => {
            back.data.forEach(each => {
                if (each.callStatus = '0') {
                    this.callCount.wait = each.callCount;
                }
                if (each.callStatus = '1') {
                    this.callCount.called = each.callCount;
                }
            })
        }, (error) => {
            console.log(error);
            if (error instanceof HttpResponse) {
                this.message.error(error.body.retMsg);
            }
        });
    }
//交易统计
    updateTransHistogram() {
        this.bankMonitorAService.getDayCountByTransTypeToHistogram()
            .subscribe(back => {
                let transCount = back.data;
                // 深拷贝，使用新对象添加数据，避免下次推送前还要清理前一次数据
                let option_histogram = deepCopy(this.transHistogram_option);
                // 添加柱状图数据
                option_histogram.dataset.source = transCount.histogramData;

                for (let i = 0; i < transCount.histogramKeySet.length - 1; i++) {
                    option_histogram.series.push(
                        {
                            type: 'bar',lor: this.color2[i],
                            stack: '重叠',
                        }
                    );
                }
                // 添加柱状图legend数据
                option_histogram.legend.data = transCount.histogramKeySet.slice(1);
                this.es.getInstanceByDom(this.histogramCharts.nativeElement).setOption(option_histogram);

            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

    }

    dataSet = [];
    datas = {name: null, value: null};


    // 新添加
    // 初始化每时饼状图嵌柱状图，监听推送数据
    initPieAndHistogramWebSocket() {
        this.countSub=this.websocketService.createObservableSocket(this.bankMonitorAService.getPieAndHistogramWS(this.session.token, this.session.getUserSession().account))
            .subscribe(data => {
                let transCount = JSON.parse(data);
                if (transCount == null) {
                    return;
                }
                // 深拷贝，使用新对象添加数据，避免下次推送前还要清理前一次数据
                let option_pie_histogram = deepCopy(this.init_option_pie_histogram);
                // 添加柱状图数据
                option_pie_histogram.dataset.source = transCount.histogramData;
                // 添加饼状图数据
                option_pie_histogram.series[0] = {
                    name: '交易量占比',
                    type: 'pie',
                    radius: ['80%', '75%'],
                    center: ['50%', '50%'],
                    labelLine: {
                        normal: {
                            length: 1,
                            show: true,
                            fontSize: '12',
                            lineStyle: {
                                color: '#054f8c',
                            }
                        }
                    },
                    label: {

                        normal: {
                            textStyle: {
                                color: '#ffffff',  // 改变标示文字的颜色
                                fontSize: 10,
                            }
                        }
                    },
                    data: []
                };
                for (let i = 0; i < transCount.histogramKeySet.length - 1; i++) {
                    option_pie_histogram.series.push(
                        {
                            type: 'bar',
                            color: this.color1[i],
                            stack: '重叠',
                        }
                    );
                }
                for (let i = 0; i < transCount.pieKeySet.length - 1; i++) {
                    option_pie_histogram.series[0].data.push({
                        value: transCount.pieMap[i].transCount,
                        name: transCount.pieMap[i].name,
                        itemStyle: {color: this.color2[i]},
                    });
                }
                // 添加柱状图legend数据
                option_pie_histogram.legend.data = transCount.pieKeySet.slice(1);
                this.es.getInstanceByDom(this.pieCharts.nativeElement).setOption(option_pie_histogram);
            }, error => {
                console.log(error);
                this.websocketService.ws.close();
                this.message.error('每时饼状图嵌柱状图推送异常');
            });
    }

    // 初始化当日实时交易金额、数量连接，监听推送数据
    initTransScreenWebSocket() {
        this.countSub1=this.websocketService.createObservableSocket(this.bankMonitorAService.getTransScreenWS(this.session.token, this.session.getUserSession().account))
            .subscribe(data => {
                let transData = JSON.parse(data);
                this.countUp(this.transData.transAmount, transData.transAmount/100, 0.8, 'transAmount',2);
                setTimeout(() => {
                    this.transData.transAmount = transData.transAmount;
                }, 810);;
                this.countUp(this.transData.transCount, transData.transCount, 1.2, 'transCount',0);
                this.transData.transCount = transData.transCount;
            }, error => {
                console.log(error);
                this.websocketService.ws.close();
                this.message.error('实时交易金额推送异常');
            });
    }

    /**
     * @description 交易总金额、数量 上升数字
     * @param   before  当前的数值
     * @param   after   需要上升到的数值
     * @param   delay   延迟 delay越大，速度越慢
     * @param   elementId   标签元素id
     */
    countUp(before, after, delay, elementId, decimalPlaces) {
        const options = {
            startVal: before,
            duration: delay,
            decimalPlaces: decimalPlaces,
        };
        let demo = new CountUp(elementId, after, options);
        if (!demo.error) {
            demo.start();
        } else {
            console.error(demo.error);
        }
    }

    // 交易类型排名
    getTransCountRank() {
        this.bankMonitorAService.getTransCountRank().subscribe(data => {
            this.transCountRank.yAxis.data = data.data.typeName;
            this.transCountRank.series.push(
                {
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    name: '交易总量',
                    data: data.data.transCount,
                }
            );
            this.es.getInstanceByDom(this.transCountRankCharts.nativeElement).setOption(this.transCountRank);
        }, error => {
            console.log(error);
            this.message.error('交易类型排名异常');
        });
    }

}
