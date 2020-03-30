import {Component, OnInit, ViewChild, ElementRef} from '@angular/core';
import {NzMessageService} from 'ng-zorro-antd';
import {NgxEchartsService} from 'ngx-echarts';
import {WebSocketService} from '../../remote/webSocketService';
import {CountUp} from 'countup.js';
import {FaultAnalysisService} from './faultAnalysis.service';
import {deepCopy} from '@zjft/abc/utils/utils';

@Component({
    templateUrl: './faultAnalysis.html',
    selector: 'nz-demo-carousel-basic',
    styleUrls: ['./faultAnalysis.less'],
})
export class FaultAnalysisComponent implements OnInit {
    @ViewChild('realTimeOpenCaseCharts') realTimeOpenCaseCharts: ElementRef;
    @ViewChild('closeCaseCharts') closeCaseCharts: ElementRef;
    @ViewChild('addedCaseCharts') addedCaseCharts: ElementRef;
    @ViewChild('eachDayAddCaseCharts') eachDayAddCaseCharts: ElementRef;
    @ViewChild('eachDayCloseCaseCharts') eachDayCloseCaseCharts: ElementRef;
    @ViewChild('avgCloseTimeCharts') avgCloseTimeCharts: ElementRef;
    @ViewChild('avgCaseCountCharts') avgCaseCountCharts: ElementRef;

    //全行实时打开状态工单数
    realTimeOpenCase: any;
    //全行当天已关闭工单数
    closeCase: any;
    //当天新增工单数
    addedCase: any;
    //全行每日新增工单数走势（30天），折线图
    eachDayAddCase_option: any;
    //全行每日关闭工单数走势（30天），折线图
    eachDayCloseCase_option: any;
    //平均工单关闭时长（30天），数字
    avgCloseTime_option: any;
    //台均工单数量（30天），数字
    avgCaseCount_option: any;


    color1 = ['#fad972', '#3ae3bc', '#f88582', '#4f6dcd', '#66CC00', '#3300CC', '#660099'];

    color2 = ['#4f6dcd', '#f88582','#fad972', '#3ae3bc', '#66CC00', '#3300CC', '#660099'];

    constructor(
        private faultAnalysisService: FaultAnalysisService,
        private message: NzMessageService,
        private es: NgxEchartsService,
    ) {
//全行每日新增工单数走势
        this.eachDayAddCase_option = {
            title: {
                left: 'center',
                top:8,
                textStyle: {
                    fontSize: 22,
                    color:'#404040',
                    fontFamily:'SimHei,Regular',
                }
            },
            tooltip: {
                trigger: 'axis'
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
//全行每日关闭工单数走势
        this.eachDayCloseCase_option = {
            title: {
                left: 'center',
                top:8,
                textStyle: {
                    fontSize: 22,
                    color:'#404040',
                    fontFamily:'SimHei',
                }
            },
            tooltip: {
                trigger: 'axis'
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

        this.avgCloseTime_option = {
            title: {
                text: '平均工单关闭时长（30天）',
                left: 'center',
                top:10,
                textStyle: {
                    fontSize: 22,
                    color:'#404040',
                    fontFamily:'SimHei',
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)',
            },
            legend: {
                orient: 'vertical',
                align:'left',
                top: '45%',
                left: '15%',
                itemHeight:'20',
                textStyle:{
                    fontSize:22,
                    fontFamily:'SimHei',
                    color:'#5e5e5e',
                    opacity:1,
                },
                data: []
            },
            series: [
                {
                    name: '工单关闭时长（分钟）',
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

        this.avgCaseCount_option={
            title: {
                text: '台均工单数量（30天）',
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
                top: '52%',
                left: '20%',
                itemHeight:'20',
                textStyle:{
                    fontSize:22,
                    fontFamily:'SimHei',
                    color:'#5e5e5e',
                    opacity:1,
                },
                data: []
            },
            series: [
                {
                    name: '台均工单数量',
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
        }

    }

    ngOnInit() {

        this.updateEachDayAddCase();

        this.updateEachDayCloseCase();

        // this.updateAvgCloseTime();

        // this.updateAvgCaseCount();

        this.getRealTimeOpenCase();

       // this.getCloseCase();

       // this.getAddedCase();

    }

    updateEachDayAddCase() {
        this.faultAnalysisService.eachDayAddCase().subscribe(back => {
            this.eachDayAddCase_option.xAxis.data = back.data.openTimes;
            this.eachDayAddCase_option.series.push({
                data: back.data.caseCounts,
                type: 'line'
            });
            this.es.getInstanceByDom(this.eachDayAddCaseCharts.nativeElement).setOption(this.eachDayAddCase_option);
        }, error => {
            console.log(error);
            this.message.error('交易分析异常');
        });
    }

    updateEachDayCloseCase() {
        this.faultAnalysisService.eachDayCloseCase().subscribe(back => {
            this.eachDayCloseCase_option.xAxis.data = back.data.closeTimes;
            this.eachDayCloseCase_option.series.push({
                data: back.data.caseCounts,
                type: 'line'
            });
            this.es.getInstanceByDom(this.eachDayCloseCaseCharts.nativeElement).setOption(this.eachDayCloseCase_option);
        }, error => {
            console.log(error);
            this.message.error('交易分析异常');
        });
    }

    updateAvgCloseTime() {
        this.faultAnalysisService.avgCloseTime().subscribe(back => {
            const avgList = back.data;
            for (let i = 0; i < avgList.length; i++) {
                this.avgCloseTime_option.legend.data.push(avgList[i].name);
                this.avgCloseTime_option.series[0].data.push(
                    {
                        value: avgList[i].useCloseTime,
                        name: avgList[i].name,
                        itemStyle: {color: this.color1[i]},
                        label: {
                            normal: {
                                show: true,
                                position: 'inner',
                                formatter: '{d}%',
                            }
                        }
                    }
                );
            }
            this.es.getInstanceByDom(this.avgCloseTimeCharts.nativeElement).setOption(this.avgCloseTime_option);
        });
    }

    updateAvgCaseCount() {
        this.faultAnalysisService.avgCaseCount().subscribe(back => {
            const avgList = back.data;
            for (let i = 0; i < avgList.length; i++) {
                this.avgCaseCount_option.legend.data.push(avgList[i].name);
                this.avgCaseCount_option.series[0].data.push(
                    {
                        value: avgList[i].value,
                        name: avgList[i].name,
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
            this.es.getInstanceByDom(this.avgCaseCountCharts.nativeElement).setOption(this.avgCaseCount_option);

        });
    }

    getRealTimeOpenCase(){
        this.faultAnalysisService.realTimeOpenCase().subscribe(back=>{
            this.realTimeOpenCase=back.data.caseCount;
        });
    }

    getCloseCase(){
        this.faultAnalysisService.closeCase().subscribe(back=>{
            this.closeCase=back.data.caseCount;
        });
    }

    getAddedCase(){
        this.faultAnalysisService.addedCase().subscribe(back=>{
            this.addedCase=back.data.caseCount;
        });
    }
}
