import {Component, OnInit} from '@angular/core';
import {HttpResponse} from '@angular/common/http';
import {TransValueAnalysisService} from './transValueAnalysis.service';
import {NzMessageService} from 'ng-zorro-antd';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import * as jsPDF from 'jspdf';
import * as html2canvas from 'html2canvas';

declare var echarts: any;

@Component({
    selector: 'transValueAnalysis',
    templateUrl: './transValueAnalysis.html',
    styles: [
            `
            {
                margin: 0
            ;
                padding: 0
            ;
            }
            table {
                border-collapse: collapse;
                border: 1px solid #000;
                width: 800px;
                margin: 20px auto;
            }

            table td {
                border: 1px solid #000;
                height: 40px;
                padding: 5px 10px;
            }

            .w100 {
                width: 100px;
                position: relative;
            }

            .w100 span.s1 {
                position: absolute;
                left: 5px;
                top: 20px;
            }

            .w100 span.s2 {
                position: absolute;
                right: 5px;
                top: 5px;
            }

            .w100 p {
                width: 105px;
                height: 1px;
                background: black;
                -webkit-transform: rotate(22deg);
                -moz-transform: rotate(22deg);
                transform: rotate(22deg);
                position: absolute;
                left: -5px;
                top: 18px;
            }
        `
    ]
})
export class TransValueAnalysisComponent implements OnInit {
    validateForm: FormGroup;
    quarterList = [];
    date = {
        year: 2019,
        month: 1,
        day: 25,
        hours: 0,
        minute: 0,
        second: 0
    };
    option_constantCostInfo: any;
    option_changeCostInfo: any;
    option_transValueInfo1: any;
    option_transValueInfo2: any;
    option_transCostInfo: any;
    option_ranfing: any;
    bankCostInfo;
    orgInfo = {
        no: '',
        name: '',
        address: '',
        mobile: '',
        telephone: '',
        workTime: ''
    };
    constantCostInfo = {
        place: '',
        device: '',
        decoration: '',
        other: '',
        staticCost: ''
    };
    changeCostInfo = {
        staffCount: '',
        wage: '',
        rent: '',
        resourceFee: '',
        promotion: '',
        other: '',
        material: '',
        manageCost: ''
    };
    transInfo = [];
    transEnergy = {
        transValueIndex: '',
        costIndex: '',
        transCountIndex: '',
        personEnergy: '',
        transAmountIndex: '',
        length: ''
    };
    Year;
    Quarter;
    gridStyle = {
        width: '50%',
        textAlign: 'center'
    };

    constructor(
        private transValueAnalysisService: TransValueAnalysisService,
        private message: NzMessageService,
        private fb: FormBuilder
    ) {
    }

    ngOnInit(): void {
        this.validateForm = this.fb.group({
            org: [
                {no: '', name: ''}],
            year: [null, Validators.maxLength(4)],
            quarter: [null, Validators.maxLength(5)],
        });
        this.quarterList = this.transValueAnalysisService.getQuarterList();
    }

    refreshData(reset = false) {
        this.date.year = new Date().getFullYear();
        // this.date.month = new Date().getMonth();
        this.date.day = new Date().getDate();
        this.date.hours = new Date().getHours();
        this.date.minute = new Date().getMinutes();
        this.date.second = new Date().getSeconds();
        const params1 = {
            orgNo: this.validateForm.controls.org.value.no,
            year: this.validateForm.controls.year.value,
            quarter: this.validateForm.controls.quarter.value

        };
        this.Year = params1.year;
        if (params1.quarter === '1') {
            this.Quarter = '第一季度';
        } else if (params1.quarter === '2') {
            this.Quarter = '第二季度';
        } else if (params1.quarter === '3') {
            this.Quarter = '第三季度';
        } else if (params1.quarter === '4') {
            this.Quarter = '第四季度';
        }
        console.log(params1);
        // 获取当前页
        this.transValueAnalysisService.getTransWorth(params1)
            .subscribe(data1 => {
                const colors = ['blue', '#d14a61'];
                console.log(data1.data);
                if (!data1.data) {
                    return ;
                }
                this.constantCostInfo = data1.data.constantCost;
                this.changeCostInfo = data1.data.changeCost;
                this.orgInfo = data1.data.sysOrg;
                this.bankCostInfo = data1.data.bankCost;
                this.transInfo = data1.data.transInfo;
                this.transEnergy = data1.data.transEnergy;

                // 成本分析占比图
                const scaleData = [{
                    'name': '固定成本',
                    'value': data1.data.constantCost.staticCost
                },
                    {
                        'name': '运营成本',
                        'value': data1.data.changeCost.manageCost
                    }

                ];
                const rich = {
                    white: {
                        color: '#080507',
                        align: 'center',
                        padding: [3, 0]
                    }
                };
                const placeHolderStyle = {
                    normal: {
                        label: {
                            show: false
                        },
                        labelLine: {
                            show: false
                        },
                        color: 'rgba(0, 0, 0, 0)',
                        borderColor: 'rgba(0, 0, 0, 0)',
                        borderWidth: 0
                    }
                };
                const data2 = [];
                const color = ['#00ffff', '#00cfff'];
                for (let i = 0; i < scaleData.length; i++) {
                    data2.push({
                        value: scaleData[i].value,
                        name: scaleData[i].name,
                        itemStyle: {
                            normal: {
                                borderWidth: 4,
                                shadowBlur: 50,
                                borderColor: color[i],
                                shadowColor: color[i]
                            }
                        }
                    }, {
                        value: 0,
                        name: '',
                        itemStyle: placeHolderStyle
                    });
                }
                const seriesObj = [{
                    name: '',
                    type: 'pie',
                    clockWise: false,
                    radius: [50, 100],
                    hoverAnimation: false,
                    itemStyle: {
                        normal: {
                            label: {
                                show: true,
                                position: 'outside',
                                color: '#080507',
                                formatter: function (params) {
                                    let percent = '0';
                                    let total = 0;
                                    for (let i = 0; i < scaleData.length; i++) {
                                        total += scaleData[i].value;
                                    }
                                    percent = ((params.value / total) * 100).toFixed(0);
                                    if (params.name !== '') {
                                        return params.name + '\n{white|' + '占比' + percent + '%}';
                                    } else {
                                        return '';
                                    }
                                },
                                rich: rich
                            },
                            labelLine: {
                                length: 30,
                                length2: 100,
                                show: true,
                                color: '#00ffff'
                            }
                        }
                    },
                    data: data2
                }];
                this.option_transCostInfo = {
                    backgroundColor: 'white',
                    tooltip: {
                        show: false
                    },
                    legend: {
                        show: false
                    },
                    toolbox: {
                        show: false
                    },
                    series: seriesObj
                };

                // 固定成本雷达图分析
                this.option_constantCostInfo = {

                    tooltip: {},
                    legend: {
                        top: 10,
                        itemWidth: 12,
                        itemHeight: 12,
                        data: ['固定成本'],
                        textStyle: {
                            color: 'black'
                        }
                    },
                    radar: {
                        radius: '60%',
                        splitNumber: 8,
                        axisLine: {
                            lineStyle: {
                                color: 'black',
                                opacity: .2
                            }
                        },
                        splitLine: {
                            lineStyle: {
                                color: 'black',
                                opacity: .2
                            }
                        },
                        splitArea: {
                            areaStyle: {
                                color: 'rgba(127,95,132,.3)',
                                opacity: 1,
                                shadowBlur: 45,
                                shadowColor: 'rgba(0,0,0,.5)',
                                shadowOffsetX: 0,
                                shadowOffsetY: 15,
                            }
                        },
                        indicator: [{
                            name: '银行总固定支出金额',
                            max: 800000
                        }, {
                            name: '场地购置',
                            max: 200000
                        }, {
                            name: '场地装修',
                            max: 200000
                        }, {
                            name: '设备购买',
                            max: 200000
                        }, {
                            name: '其他',
                            max: 200000
                        }]
                    },
                    series: [{
                        name: '',
                        type: 'radar',
                        symbolSize: 0,
                        areaStyle: {
                            normal: {
                                shadowBlur: 13,
                                shadowColor: 'rgba(0,0,0,.2)',
                                shadowOffsetX: 0,
                                shadowOffsetY: 10,
                                opacity: 1
                            }
                        },
                        data: [{
                            value: [data1.data.constantCost.staticCost, data1.data.constantCost.place,
                                data1.data.constantCost.decoration, data1.data.constantCost.device, data1.data.constantCost.other],
                            name: '固定成本',
                        }]
                    }],
                    color: ['#ef4b4c'],
                    backgroundColor: {
                        type: 'radial',
                        x: 0.4,
                        y: 0.4,
                        r: 0.35,
                        colorStops: [{
                            offset: 0,
                            color: 'white' // 0% 处的颜色
                        }, {
                            offset: .4,
                            color: 'white' // 100% 处的颜色
                        }, {
                            offset: 1,
                            color: 'white' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    }
                };

                // 运营成本雷达图分析
                this.option_changeCostInfo = {

                    tooltip: {},
                    legend: {
                        top: 10,
                        itemWidth: 12,
                        itemHeight: 12,
                        data: ['运营成本'],
                        textStyle: {
                            color: 'black'
                        }
                    },
                    radar: {
                        radius: '60%',
                        splitNumber: 8,
                        axisLine: {
                            lineStyle: {
                                color: 'black',
                                opacity: .2
                            }
                        },
                        splitLine: {
                            lineStyle: {
                                color: 'black',
                                opacity: .2
                            }
                        },
                        splitArea: {
                            areaStyle: {
                                color: 'rgba(127,95,132,.3)',
                                opacity: 1,
                                shadowBlur: 45,
                                shadowColor: 'rgba(0,0,0,.5)',
                                shadowOffsetX: 0,
                                shadowOffsetY: 15,
                            }
                        },
                        indicator: [{
                            name: '运营支出总费用',
                            max: 800000
                        }, {
                            name: '员工工资',
                            max: 600000
                        }, {
                            name: '场地租金',
                            max: 200000
                        }, {
                            name: '推广营销',
                            max: 200000
                        }, {
                            name: '材料费用',
                            max: 200000
                        }]
                    },
                    series: [{
                        name: '',
                        type: 'radar',
                        symbolSize: 0,
                        areaStyle: {
                            normal: {
                                shadowBlur: 13,
                                shadowColor: 'rgba(0,0,0,.2)',
                                shadowOffsetX: 0,
                                shadowOffsetY: 10,
                                opacity: 1
                            }
                        },
                        data: [{
                            value: [data1.data.changeCost.manageCost, data1.data.changeCost.wage, data1.data.changeCost.rent,
                                data1.data.changeCost.promotion, data1.data.changeCost.material],
                            name: '运营成本',
                        }]
                    }],
                    color: ['blue'],
                    backgroundColor: {
                        type: 'radial',
                        x: 0.4,
                        y: 0.4,
                        r: 0.35,
                        colorStops: [{
                            offset: 0,
                            color: 'white' // 0% 处的颜色
                        }, {
                            offset: .4,
                            color: 'white' // 100% 处的颜色
                        }, {
                            offset: 1,
                            color: 'white' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    }
                };

                // 能效排名分析图
                this.option_ranfing = {
                    backgroundColor: '#faf6f3',
                    animation: false,
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow',
                            shadowStyle: {
                                // color: 'rgba(255, 109, 0, 0.8)'
                            }
                        }
                    },
                    grid: {
                        top: 60,
                        bottom: 30
                    },
                    yAxis: {
                        inverse: true,
                        max: data1.data.transEnergy.length,
                        min: 1,
                        type: 'value',
                        position: 'top',
                        splitLine: {
                            lineStyle: {
                                type: 'solid',
                                color: '#cfc3bd'
                            }
                        },
                    },
                    xAxis: {
                        splitNumber: 25,
                        type: 'category',
                        axisLine: {
                            lineStyle: {
                                type: 'solid',
                            }
                        },
                        axisLabel: {
                            show: true,
                            rotate: 0,
                            textStyle: {
                                color: '#682d19'
                            }
                        },
                        axisTick: {show: true},
                        splitLine: {
                            lineStyle: {
                                type: 'solid',
                                color: '#cfc3bd'
                            }
                        },
                        data: ['交易成本', '交易价值', '人均能效', '交易数量', '交易金额']
                    },
                    series: [
                        {
                            name: '排名',
                            type: 'bar',
                            stack: '排名',
                            label: {
                                normal: {
                                    textStyle: {
                                        color: '#682d19'
                                    },
                                    position: 'left',
                                    show: false,
                                    formatter: '{b}'
                                }
                            },
                            barCategoryGap: 0,
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                        offset: 0,
                                        color: 'transparent'
                                    }, {
                                        offset: 0.5,
                                        color: 'transparent'
                                    }, {
                                        offset: 0.8,
                                        color: 'transparent'
                                    }, {
                                        offset: 0.92,
                                        color: 'transparent'
                                    }, {
                                        offset: 1,
                                        color: 'transparent'
                                    }])
                                }
                            },
                            data: [data1.data.transEnergy.costIndex, data1.data.transEnergy.transValueIndex,
                                data1.data.transEnergy.personEnergy, data1.data.transEnergy.transCountIndex,
                                data1.data.transEnergy.transAmountIndex]
                        },
                        {
                            type: 'bar',
                            stack: '排名',
                            silent: true,
                            data: [0, 0, 0, 0, 0],
                            itemStyle: {
                                normal: {
                                    color: '#ff5a00',
                                }
                            },
                            barMinHeight: 4
                        }
                    ]
                };

            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });


        // 交易价值分析1
        this.option_transValueInfo1 = {
            color: ['blue', '#d14a61'],

            tooltip: {
                trigger: 'axis',
                axisPointer: {type: 'cross'}
            },
            grid: {
                right: '20%'
            },
            toolbox: {},
            legend: {
                data: ['交易数量', '交易总金额']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    data: [1, 2, 3]
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '交易数量',
                    min: 0,
                    max: 5000,
                    position: 'left',
                    axisLine: {
                        lineStyle: {
                            color: '#d14a61'
                        }
                    },
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                {
                    type: 'value',
                    name: '交易总金额',
                    min: 0,
                    max: 10000,
                    position: 'right',
                    axisLine: {
                        lineStyle: {
                            color: 'blue'
                        }
                    },
                    axisLabel: {
                        formatter: '{value}'
                    }
                }
            ],
            series: [
                {
                    name: '交易数量',
                    type: 'bar',
                    yAxisIndex: 0,
                    data: [1000, 2500, 4000]
                },
                {
                    name: '交易总金额',
                    type: 'line',
                    yAxisIndex: 1,
                    data: [2500, 5000, 6000]
                }
            ]
        };

        // 交易价值分析2
        this.option_transValueInfo2 = {
            color: ['blue', '#d14a61'],

            tooltip: {
                trigger: 'axis',
                axisPointer: {type: 'cross'}
            },
            grid: {
                right: '20%'
            },
            toolbox: {},
            legend: {
                data: ['交易价值', '人均价值']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    data: ['1', '2', '3']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '交易价值',
                    min: 0,
                    max: 10000,
                    position: 'left',
                    axisLine: {
                        lineStyle: {
                            color: 'blue'
                        }
                    },
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                {
                    type: 'value',
                    name: '人均价值',
                    min: 0,
                    max: 1000,
                    position: 'right',
                    axisLine: {
                        lineStyle: {
                            color: '#d14a61'
                        }
                    },
                    axisLabel: {
                        formatter: '{value}'
                    }
                }
            ],
            series: [
                {
                    name: '交易价值',
                    type: 'bar',
                    yAxisIndex: 0,
                    data: [3000, 8000, 6000]
                },
                {
                    name: '人均价值',
                    type: 'line',
                    yAxisIndex: 1,
                    data: [500, 800, 600]
                }
            ]
        };

    }

    search() {
        this.refreshData(true);
    }

    // 导出PDF报告
    getPdf() {
        html2canvas(document.getElementById('export_content'),
            {
                allowTaint: true,
                // 背景设为白色
                background: '#fff'
            }).then(function (canvas) {
            const contentWidth = canvas.width;
            const contentHeight = canvas.height;

            // 一页pdf显示html页面生成的canvas高度;
            const pageHeight = contentWidth / 592.28 * 841.89;
            // 未生成pdf的html页面高度
            let leftHeight = contentHeight;
            // pdf页面偏移
            let position = 0;
            // html页面生成的canvas在pdf中图片的宽高（a4纸的尺寸[595.28,841.89]）
            const imgWidth = 595.28;
            const imgHeight = 592.28 / contentWidth * contentHeight;

            const pageData = canvas.toDataURL('image/jpeg', 1.0);
            const pdf = new jsPDF('', 'pt', 'a4');

            // 有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
            // 当内容未超过pdf一页显示的范围，无需分页
            if (leftHeight < pageHeight) {
                pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight);
            } else {
                while (leftHeight > 0) {
                    pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight);
                    leftHeight -= pageHeight;
                    position -= 841.89;
                    // 避免添加空白页
                    if (leftHeight > 0) {
                        pdf.addPage();
                    }
                }
            }
            pdf.save('平安银行能效分析报告.pdf');
        });
    }

}
