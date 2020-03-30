import {Component, OnInit, ViewChild, ElementRef} from '@angular/core';
import {NzMessageService} from 'ng-zorro-antd';
import {NgxEchartsService} from 'ngx-echarts';
import {WebSocketService} from '../../remote/webSocketService';
import {CountUp} from 'countup.js';
import {TransAnalysisService} from './transAnalysis.service';
import {deepCopy} from '@zjft/abc/utils/utils';

@Component({
    templateUrl: './transAnalysis.html',
    selector: 'nz-demo-carousel-basic',
    styleUrls: ['./transAnalysis.less'],
})
export class TransAnalysisComponent implements OnInit {

    @ViewChild('transCountRankCharts') transCountRankCharts: ElementRef;
    @ViewChild('devCountTrendCharts') devCountTrendCharts: ElementRef;
    @ViewChild('scaleCharts') scaleCharts: ElementRef;
    @ViewChild('transCarousel') transCarousel;
    // 实时时间的显示
    curDateTime: Date;
    // 交易类型排名
    transCountRank: any;
    // 装机量走势
    devCountTrend: any;
    // 各设备类型占比
    option_pie: any;
    data_pie = [];
    devCount: any;
    nodeCount: any;
    color1= ['#4fdbec', '#face4b', '#f43fd4','#4f6dcd', '#f88582', '#81dffd', '#f5942f','#0dd4a5'];

    color2= ['#4fdbec', '#face4b', '#f43fd4','#4f6dcd', '#f88582', '#81dffd', '#f5942f','#0dd4a5'];
    constructor(
        private transAnalysisService: TransAnalysisService,
        private message: NzMessageService,
        private es: NgxEchartsService,
        private websocketService: WebSocketService,
    ) {
        this.transCountRank = {
            title: {
                left: 'center',
                top:10,
                textStyle: {
                    fontSize: 22,
                    color:'#404040',
                    fontFamily:'SimHei',
                    opacity:1,
                }
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis:  {
                type: 'value',
                splitLine: {
                    show: false
                }
            },
            yAxis: {
                type: 'category',
                data: []
            },
            series: []
        };
//装机量走势
        this.devCountTrend = {
            title: {
                left: 'center',
                top:5,
                textStyle: {
                    fontSize: 22,
                    color:'#404040',
                    fontFamily:'SimHei',
                    opacity:1,
                }
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                top: '-2%',
                data: []
            },
            grid: {
                left: '7%',
                right: '8%',
                bottom: '3%',
                containLabel: true,
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: [],

            },
            yAxis: {
                type: 'value',
            },
            series: []

        };

        /*
        *网点设备量统计饼状图数据
        */
        this.option_pie = {
            title: {
                left: 'center',
                top:10,
                textStyle: {
                    fontSize: 22,
                    color:'#404040',
                    fontFamily:'SimHei',
                    opacity:1,
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                align:'left',
                top: '4%',
                left: '5%',
                itemHeight:'20',
                textStyle:{
                    fontSize:20,
                    fontFamily:'SimHei',
                    fontWeight:'Bold',
                    color:'#5e5e5e',
                    opacity:1,
                },
                data: []
            },
            series: [
                {
                    name: '设备占比',
                    type: 'pie',
                    radius: '65%',
                    center: ['70%', '55%'],
                    label:{  //饼图上文本标签
                        normal:{
                            show:true,
                            textStyle:{
                                fontSize:20,
                                fontFamily:'SinHei',
                                color:'#ffffff',
                            }
                        }
                    },
                    data: []
                }
            ]
        };
    }
    changePage( isleft?: boolean ) {
        if (isleft) {
            this.transCarousel.nzSlickPrev();
        }else {
            this.transCarousel.nzSlickNext();
        }

    }
    // right(){
    //     this.carousel.nzSlickNext();
    // }
    // left(){
    //     this.carousel.nzSlickPrev();
    // }
    ngOnInit() {
        this.curDateTime = new Date();
        setInterval(date => {
            this.curDateTime = new Date();
        }, 1000);

        this.getTransCountRank();

        this.getDevCountTrend();

        this.updatePie();
    }
//交易类型排名
    getTransCountRank() {
        this.transAnalysisService.getTransCountRank().subscribe(data => {
            this.transCountRank.yAxis.data = data.data.typeName;
            this.transCountRank.series.push(
                {
                    type: 'bar',
                    // stack: '总量',
                    name:'交易总量',
                    barWidth:'35',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight',
                        },
                        itemStyle:{
                            barBorderRadius:25,
                        }
                    },
                    // color:['#4fdbec', '#face4b', '#f43fd4','#4f6dcd'],
                    data: data.data.transCount,
                }
            );
            this.es.getInstanceByDom(this.transCountRankCharts.nativeElement).setOption(this.transCountRank);
        }, error => {
            console.log(error);
            this.websocketService.ws.close();
            this.message.error('交易信息推送异常');
        });
    }

    getDevCountTrend() {
        this.transAnalysisService.getDevCountTrend().subscribe(data => {
            this.devCountTrend.legend.data = data.data.legends;
            this.devCountTrend.xAxis.data = data.data.xAxis;
            console.log(data.data);
            const polyLines = data.data.polyLines;
            console.log(polyLines);
            for (let i = 0; i < polyLines.length; i++) {
                this.devCountTrend.series.push(
                    {
                        type: 'line',
                        // stack: '总量',
                        name: polyLines[i].name,
                        color: this.color1[i],
                        data: polyLines[i].lineData,
                    }
                );
            }
            this.es.getInstanceByDom(this.devCountTrendCharts.nativeElement).setOption(this.devCountTrend);
        }, error => {
            console.log(error);
            this.websocketService.ws.close();
            this.message.error('交易信息推送异常');
        });
    }

    // 更新饼状图数据
    updatePie() {
        this.transAnalysisService.getCatalogScale().subscribe(catalogScale => {
            this.data_pie = catalogScale.data.pieList;
            this.devCount = catalogScale.data.devcount;
            this.nodeCount = catalogScale.data.nodecount;
            if (this.data_pie != null || this.data_pie != []) {
                for (let i = 0; i < this.data_pie.length; i++) {
                    this.option_pie.legend.data.push(this.data_pie[i].name);
                    this.option_pie.series[0].data.push(
                        {
                            value: this.data_pie[i].devcount,
                            name: this.data_pie[i].name,
                            itemStyle: {color: this.color1[i]},
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
                this.es.getInstanceByDom(this.scaleCharts.nativeElement).setOption(this.option_pie);
            }
        });
    }



}
