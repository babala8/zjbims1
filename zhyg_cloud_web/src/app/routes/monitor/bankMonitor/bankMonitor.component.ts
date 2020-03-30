import {Component, OnInit, ViewChild, ElementRef} from '@angular/core';
import {BankMonitorService} from './bankMonitor.service';
import {NzMessageService} from 'ng-zorro-antd';
import {NgxEchartsService} from 'ngx-echarts';
import {HttpResponse} from '@angular/common/http';

@Component({
    selector: 'app-demo-dashboard',
    templateUrl: './bankMonitor.html',
})
export class BankMonitorComponent implements OnInit {
    @ViewChild('RateRkCharts') RateRkCharts: ElementRef;
    @ViewChild('TransRkCharts') TransRkCharts: ElementRef;
    @ViewChild('HotMapCharts') HotMapCharts: ElementRef;
    orgNameAry4Rate = [];
    openRateData = [];
    orgNameAry = [];
    transAmountData = [];

    citydata = [];
    provinceMap = [
        {name: '北京', value: 21300},
        {name: '江苏', value: 210000},
        {name: '安徽', value: 230000},
        {name: '重庆', value: 230000},
        {name: '福建', value: 230000},
        {name: '甘肃', value: 230000},
        {name: '广东', value: 230000},
        {name: '广西', value: 230000},
        {name: '贵州', value: 230000},
        {name: '海南', value: 230000},
        {name: '河北', value: 230000},
        {name: '黑龙江', value: 230000},
        {name: '河南', value: 230000},
        {name: '香港', value: 230000},
        {name: '湖北', value: 230000},
        {name: '湖南', value: 230000},
        {name: '吉林', value: 230000},
        {name: '江西', value: 230000},
        {name: '辽宁', value: 230000},
        {name: '澳门', value: 230000},
        {name: '内蒙古', value: 230000},
        {name: '宁夏', value: 230000},
        {name: '青海', value: 230000},
        {name: '山西', value: 230000},
        {name: '陕西', value: 230000},
        {name: '山东', value: 230000},
        {name: '上海', value: 230000},
        {name: '四川', value: 230000},
        {name: '台湾', value: 230000},
        {name: '天津', value: 230000},
        {name: '新疆', value: 230000},
        {name: '西藏', value: 230000},
        {name: '云南', value: 230000},
        {name: '浙江', value: 230000}
    ];
    cityMap = [
        {name: '盐城', value: 21300},
        {name: '苏州', value: 210000},
        {name: '南京', value: 230000},
        {name: '扬州', value: 21300},
        {name: '常州', value: 210000},
        {name: '苏州', value: 230000},
    ];
    data12 = [
        {name: '海门', value: 9},
        {name: '鄂尔多斯', value: 12},
        {name: '招远', value: 12},
        {name: '舟山', value: 12},
        {name: '齐齐哈尔', value: 14},
        {name: '盐城', value: 150},
        {name: '赤峰', value: 16},
        {name: '青岛', value: 18},
        {name: '乳山', value: 18},
        {name: '金昌', value: 19},
        {name: '泉州', value: 21},
        {name: '莱西', value: 21},
        {name: '日照', value: 21},
        {name: '胶南', value: 22},
        {name: '南通', value: 23},
        {name: '拉萨', value: 24},
        {name: '云浮', value: 24},
        {name: '梅州', value: 25},
        {name: '文登', value: 25},
        {name: '上海', value: 25},
        {name: '攀枝花', value: 25},
        {name: '威海', value: 25},
        {name: '承德', value: 25},
        {name: '厦门', value: 26},
        {name: '汕尾', value: 26},
        {name: '潮州', value: 26},
        {name: '丹东', value: 27},
        {name: '太仓', value: 27},
        {name: '曲靖', value: 27},
        {name: '烟台', value: 28},
        {name: '福州', value: 29},
        {name: '瓦房店', value: 30},
        {name: '即墨', value: 30},
        {name: '抚顺', value: 31},
        {name: '玉溪', value: 31},
        {name: '张家口', value: 31},
        {name: '阳泉', value: 31},
        {name: '莱州', value: 32},
        {name: '湖州', value: 32},
        {name: '汕头', value: 32},
        {name: '昆山', value: 33},
        {name: '宁波', value: 33},
        {name: '湛江', value: 33},
        {name: '揭阳', value: 34},
        {name: '荣成', value: 34},
        {name: '连云港', value: 35},
        {name: '葫芦岛', value: 35},
        {name: '常熟', value: 36},
        {name: '东莞', value: 36},
        {name: '河源', value: 36},
        {name: '淮安', value: 36},
        {name: '泰州', value: 36},
        {name: '南宁', value: 37},
        {name: '营口', value: 37},
        {name: '惠州', value: 37},
        {name: '江阴', value: 37},
        {name: '蓬莱', value: 37},
        {name: '韶关', value: 38},
        {name: '嘉峪关', value: 38},
        {name: '广州', value: 38},
        {name: '延安', value: 38},
        {name: '太原', value: 39},
        {name: '清远', value: 39},
        {name: '中山', value: 39},
        {name: '昆明', value: 39},
        {name: '寿光', value: 40},
        {name: '盘锦', value: 40},
        {name: '长治', value: 41},
        {name: '深圳', value: 41},
        {name: '珠海', value: 42},
        {name: '宿迁', value: 43},
        {name: '咸阳', value: 43},
        {name: '铜川', value: 44},
        {name: '平度', value: 44},
        {name: '佛山', value: 44},
        {name: '海口', value: 44},
        {name: '江门', value: 45},
        {name: '章丘', value: 45},
        {name: '肇庆', value: 46},
        {name: '大连', value: 47},
        {name: '临汾', value: 47},
        {name: '吴江', value: 47},
        {name: '石嘴山', value: 49},
        {name: '沈阳', value: 50},
        {name: '苏州', value: 50},
        {name: '茂名', value: 50},
        {name: '嘉兴', value: 51},
        {name: '长春', value: 51},
        {name: '胶州', value: 52},
        {name: '银川', value: 52},
        {name: '张家港', value: 52},
        {name: '三门峡', value: 53},
        {name: '锦州', value: 54},
        {name: '南昌', value: 54},
        {name: '柳州', value: 54},
        {name: '三亚', value: 54},
        {name: '自贡', value: 56},
        {name: '吉林', value: 56},
        {name: '阳江', value: 57},
        {name: '泸州', value: 57},
        {name: '西宁', value: 57},
        {name: '宜宾', value: 58},
        {name: '呼和浩特', value: 58},
        {name: '成都', value: 58},
        {name: '大同', value: 58},
        {name: '镇江', value: 59},
        {name: '桂林', value: 59},
        {name: '张家界', value: 59},
        {name: '宜兴', value: 59},
        {name: '北海', value: 60},
        {name: '西安', value: 61},
        {name: '金坛', value: 62},
        {name: '东营', value: 62},
        {name: '牡丹江', value: 63},
        {name: '遵义', value: 63},
        {name: '绍兴', value: 63},
        {name: '扬州', value: 64},
        {name: '常州', value: 64},
        {name: '潍坊', value: 65},
        {name: '重庆', value: 66},
        {name: '台州', value: 67},
        {name: '南京', value: 277},
        {name: '滨州', value: 70},
        {name: '贵阳', value: 71},
        {name: '无锡', value: 71},
        {name: '本溪', value: 71},
        {name: '克拉玛依', value: 72},
        {name: '渭南', value: 72},
        {name: '马鞍山', value: 72},
        {name: '宝鸡', value: 72},
        {name: '焦作', value: 75},
        {name: '句容', value: 75},
        {name: '北京', value: 79},
        {name: '徐州', value: 79},
        {name: '衡水', value: 80},
        {name: '包头', value: 80},
        {name: '绵阳', value: 80},
        {name: '乌鲁木齐', value: 84},
        {name: '枣庄', value: 84},
        {name: '杭州', value: 84},
        {name: '淄博', value: 85},
        {name: '鞍山', value: 86},
        {name: '溧阳', value: 86},
        {name: '库尔勒', value: 86},
        {name: '安阳', value: 90},
        {name: '开封', value: 90},
        {name: '济南', value: 92},
        {name: '德阳', value: 93},
        {name: '温州', value: 95},
        {name: '九江', value: 96},
        {name: '邯郸', value: 98},
        {name: '临安', value: 99},
        {name: '兰州', value: 99},
        {name: '沧州', value: 100},
        {name: '临沂', value: 103},
        {name: '南充', value: 104},
        {name: '天津', value: 105},
        {name: '富阳', value: 106},
        {name: '泰安', value: 112},
        {name: '诸暨', value: 112},
        {name: '郑州', value: 113},
        {name: '哈尔滨', value: 114},
        {name: '聊城', value: 116},
        {name: '芜湖', value: 117},
        {name: '唐山', value: 119},
        {name: '平顶山', value: 119},
        {name: '邢台', value: 119},
        {name: '德州', value: 120},
        {name: '济宁', value: 120},
        {name: '荆州', value: 127},
        {name: '宜昌', value: 130},
        {name: '义乌', value: 132},
        {name: '丽水', value: 133},
        {name: '洛阳', value: 134},
        {name: '秦皇岛', value: 136},
        {name: '株洲', value: 143},
        {name: '石家庄', value: 147},
        {name: '莱芜', value: 148},
        {name: '常德', value: 152},
        {name: '保定', value: 153},
        {name: '湘潭', value: 154},
        {name: '金华', value: 157},
        {name: '岳阳', value: 169},
        {name: '长沙', value: 175},
        {name: '衢州', value: 177},
        {name: '廊坊', value: 193},
        {name: '菏泽', value: 194},
        {name: '合肥', value: 129},
        {name: '武汉', value: 273},
        {name: '大庆', value: 279}
    ];
    geoCoordMap = {
        '海门': [121.15, 31.89],
        '鄂尔多斯': [109.781327, 39.608266],
        '招远': [120.38, 37.35],
        '舟山': [122.207216, 29.985295],
        '齐齐哈尔': [123.97, 47.33],
        '盐城': [120.13, 33.38],
        '赤峰': [118.87, 42.28],
        '青岛': [120.33, 36.07],
        '乳山': [121.52, 36.89],
        '金昌': [102.188043, 38.520089],
        '泉州': [118.58, 24.93],
        '莱西': [120.53, 36.86],
        '日照': [119.46, 35.42],
        '胶南': [119.97, 35.88],
        '南通': [121.05, 32.08],
        '拉萨': [91.11, 29.97],
        '云浮': [112.02, 22.93],
        '梅州': [116.1, 24.55],
        '文登': [122.05, 37.2],
        '上海': [121.48, 31.22],
        '攀枝花': [101.718637, 26.582347],
        '威海': [122.1, 37.5],
        '承德': [117.93, 40.97],
        '厦门': [118.1, 24.46],
        '汕尾': [115.375279, 22.786211],
        '潮州': [116.63, 23.68],
        '丹东': [124.37, 40.13],
        '太仓': [121.1, 31.45],
        '曲靖': [103.79, 25.51],
        '烟台': [121.39, 37.52],
        '福州': [119.3, 26.08],
        '瓦房店': [121.979603, 39.627114],
        '即墨': [120.45, 36.38],
        '抚顺': [123.97, 41.97],
        '玉溪': [102.52, 24.35],
        '张家口': [114.87, 40.82],
        '阳泉': [113.57, 37.85],
        '莱州': [119.942327, 37.177017],
        '湖州': [120.1, 30.86],
        '汕头': [116.69, 23.39],
        '昆山': [120.95, 31.39],
        '宁波': [121.56, 29.86],
        '湛江': [110.359377, 21.270708],
        '揭阳': [116.35, 23.55],
        '荣成': [122.41, 37.16],
        '连云港': [119.16, 34.59],
        '葫芦岛': [120.836932, 40.711052],
        '常熟': [120.74, 31.64],
        '东莞': [113.75, 23.04],
        '河源': [114.68, 23.73],
        '淮安': [119.15, 33.5],
        '泰州': [119.9, 32.49],
        '南宁': [108.33, 22.84],
        '营口': [122.18, 40.65],
        '惠州': [114.4, 23.09],
        '江阴': [120.26, 31.91],
        '蓬莱': [120.75, 37.8],
        '韶关': [113.62, 24.84],
        '嘉峪关': [98.289152, 39.77313],
        '广州': [113.23, 23.16],
        '延安': [109.47, 36.6],
        '太原': [112.53, 37.87],
        '清远': [113.01, 23.7],
        '中山': [113.38, 22.52],
        '昆明': [102.73, 25.04],
        '寿光': [118.73, 36.86],
        '盘锦': [122.070714, 41.119997],
        '长治': [113.08, 36.18],
        '深圳': [114.07, 22.62],
        '珠海': [113.52, 22.3],
        '宿迁': [118.3, 33.96],
        '咸阳': [108.72, 34.36],
        '铜川': [109.11, 35.09],
        '平度': [119.97, 36.77],
        '佛山': [113.11, 23.05],
        '海口': [110.35, 20.02],
        '江门': [113.06, 22.61],
        '章丘': [117.53, 36.72],
        '肇庆': [112.44, 23.05],
        '大连': [121.62, 38.92],
        '临汾': [111.5, 36.08],
        '吴江': [120.63, 31.16],
        '石嘴山': [106.39, 39.04],
        '沈阳': [123.38, 41.8],
        '苏州': [120.62, 31.32],
        '茂名': [110.88, 21.68],
        '嘉兴': [120.76, 30.77],
        '长春': [125.35, 43.88],
        '胶州': [120.03336, 36.264622],
        '银川': [106.27, 38.47],
        '张家港': [120.555821, 31.875428],
        '三门峡': [111.19, 34.76],
        '锦州': [121.15, 41.13],
        '南昌': [115.89, 28.68],
        '柳州': [109.4, 24.33],
        '三亚': [109.511909, 18.252847],
        '自贡': [104.778442, 29.33903],
        '吉林': [126.57, 43.87],
        '阳江': [111.95, 21.85],
        '泸州': [105.39, 28.91],
        '西宁': [101.74, 36.56],
        '宜宾': [104.56, 29.77],
        '呼和浩特': [111.65, 40.82],
        '成都': [104.06, 30.67],
        '大同': [113.3, 40.12],
        '镇江': [119.44, 32.2],
        '桂林': [110.28, 25.29],
        '张家界': [110.479191, 29.117096],
        '宜兴': [119.82, 31.36],
        '北海': [109.12, 21.49],
        '西安': [108.95, 34.27],
        '金坛': [119.56, 31.74],
        '东营': [118.49, 37.46],
        '牡丹江': [129.58, 44.6],
        '遵义': [106.9, 27.7],
        '绍兴': [120.58, 30.01],
        '扬州': [119.42, 32.39],
        '常州': [119.95, 31.79],
        '潍坊': [119.1, 36.62],
        '重庆': [106.54, 29.59],
        '台州': [121.420757, 28.656386],
        '南京': [118.78, 32.04],
        '滨州': [118.03, 37.36],
        '贵阳': [106.71, 26.57],
        '无锡': [120.29, 31.59],
        '本溪': [123.73, 41.3],
        '克拉玛依': [84.77, 45.59],
        '渭南': [109.5, 34.52],
        '马鞍山': [118.48, 31.56],
        '宝鸡': [107.15, 34.38],
        '焦作': [113.21, 35.24],
        '句容': [119.16, 31.95],
        '北京': [116.46, 39.92],
        '徐州': [117.2, 34.26],
        '衡水': [115.72, 37.72],
        '包头': [110, 40.58],
        '绵阳': [104.73, 31.48],
        '乌鲁木齐': [87.68, 43.77],
        '枣庄': [117.57, 34.86],
        '杭州': [120.19, 30.26],
        '淄博': [118.05, 36.78],
        '鞍山': [122.85, 41.12],
        '溧阳': [119.48, 31.43],
        '库尔勒': [86.06, 41.68],
        '安阳': [114.35, 36.1],
        '开封': [114.35, 34.79],
        '济南': [117, 36.65],
        '德阳': [104.37, 31.13],
        '温州': [120.65, 28.01],
        '九江': [115.97, 29.71],
        '邯郸': [114.47, 36.6],
        '临安': [119.72, 30.23],
        '兰州': [103.73, 36.03],
        '沧州': [116.83, 38.33],
        '临沂': [118.35, 35.05],
        '南充': [106.110698, 30.837793],
        '天津': [117.2, 39.13],
        '富阳': [119.95, 30.07],
        '泰安': [117.13, 36.18],
        '诸暨': [120.23, 29.71],
        '郑州': [113.65, 34.76],
        '哈尔滨': [126.63, 45.75],
        '聊城': [115.97, 36.45],
        '芜湖': [118.38, 31.33],
        '唐山': [118.02, 39.63],
        '平顶山': [113.29, 33.75],
        '邢台': [114.48, 37.05],
        '德州': [116.29, 37.45],
        '济宁': [116.59, 35.38],
        '荆州': [112.239741, 30.335165],
        '宜昌': [111.3, 30.7],
        '义乌': [120.06, 29.32],
        '丽水': [119.92, 28.45],
        '洛阳': [112.44, 34.7],
        '秦皇岛': [119.57, 39.95],
        '株洲': [113.16, 27.83],
        '石家庄': [114.48, 38.03],
        '莱芜': [117.67, 36.19],
        '常德': [111.69, 29.05],
        '保定': [115.48, 38.85],
        '湘潭': [112.91, 27.87],
        '金华': [119.64, 29.12],
        '岳阳': [113.09, 29.37],
        '长沙': [113, 28.21],
        '衢州': [118.88, 28.97],
        '廊坊': [116.7, 39.53],
        '菏泽': [115.480656, 35.23375],
        '合肥': [117.27, 31.86],
        '武汉': [114.31, 30.52],
        '大庆': [125.03, 46.58]
    };
    /**
     * 实时时间的显示
     */
    option_volumeRk: any;
    option_Hotmap: any;
    option_dashboard: any;
    option_zhuboard: any;
    option_datamart: any;
    option_rateRank: any;
    curDateTime: Date;

    constructor(
        private bankMonitorService: BankMonitorService,
        private message: NzMessageService,
        private es: NgxEchartsService
    ) {
        /*
        *开机率网点排名
        */
        const valdata = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.option_rateRank = {
            title: {
                text: '开机率排名',
                left: 'center',
                show: true,
                textStyle: {
                    color: '#ffffff',
                    fontSize: 12
                }
            },
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
         *现金交易量网点排名
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
            title: {
                text: '现金交易量网点排名',
                left: 'center',
                textStyle: {
                    fontSize: 14,
                    color: 'white'
                }
            },
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

        this.option_Hotmap = {
            title :  {
                text:  '全国交易量热力图',
                left:  'center',
                top:  'top',
                textStyle:  {
                    color:  '#fff'
                }
            },
            tooltip:  {
                trigger: 'item',
                formatter: function (params) {
                    if (typeof(params.value)[2] === 'undefined') {
                        return params.name + ' : ' + params.value;
                    }else {
                        return params.name + ' : ' + params.value[2];
                    }
                }
            },
            legend:  {
                left:  'left',
                data:  ['强',  '中',  '弱'],
                textStyle:  {
                    color:  '#ccc'
                }
            },
            geo:  {
                map:  'china',
                aspectScale:  0.75,  // 长宽比
                show:  true,
                roam:  false,
                label:  {
                    emphasis:  {
                        show:  false
                    }
                },
                itemStyle:  {
                    normal:  {
                        areaColor:  '#091632',
                        borderColor:  '#1773c3',
                        shadowColor:  '#1773c3',
                        shadowBlur:  20
                    }
                }
            },
            series:  [
                {
                    type:  'map',
                    map:  'china',
                    name:  '省/市',
                    geoIndex:  1,
                    aspectScale:  0.75,  // 长宽比
                    showLegendSymbol:  true,  // 存在legend时显示
                    label:  {
                        normal:  {
                            show:  false,
                        },
                        emphasis:  {
                            show:  false,
                            textStyle:  {
                                color:  '#fff'
                            }
                        }
                    },
                    roam:  false,
                    itemStyle:  {
                        normal:  {
                            areaColor:  '#031525',
                            borderColor:  '#3B5077',
                            borderWidth:  1
                        },
                        emphasis:  {
                            areaColor:  '#0f2c70'
                        }
                    },
                    data: this.provinceMap
                },
                {
                    name:  '城市',
                    type:  'scatter',
                    coordinateSystem:  'geo',
                    data:  this.convertData(this.data12),
                    symbolSize:  function (val) {
                        return val[2] / 20;
                    },
                    label:  {
                        normal:  {
                            formatter:  '{b}',
                            position:  'right',
                            show:  false
                        },
                        emphasis:  {
                            show:  true
                        }
                    },
                    itemStyle:  {
                        normal:  {
                            color:  '#ddb926'
                        }
                    }
                },
                {
                    name:  '前5',
                    type:  'effectScatter',
                    coordinateSystem:  'geo',
                    data: this.convertData(this.data12.sort(function (a,  b) {
                        return b.value - a.value;
                    }).slice(0,  6)),
                    symbolSize:  function (val) {
                        return val[2] / 20;
                    },
                    showEffectOn:  'render',
                    rippleEffect:  {
                        brushType:  'stroke'
                    },
                    hoverAnimation:  true,
                    label:  {
                        normal:  {
                            formatter:  '{b}',
                            position:  'right',
                            show:  true
                        }
                    },
                    itemStyle:  {
                        normal:  {
                            color:  '#f4e925',
                            shadowBlur:  10,
                            shadowColor:  '#333'
                        }
                    },
                    zlevel:  1
                }
            ]
        };

        const highlight = '#03b7c9';
        const demoData = [
            {name: '设备量', value: 10, unit: 'W', pos: ['30%', '50%'], range: [0, 20]},
            {name: '网点量', value: 100, unit: '个', pos: ['70%', '50%'], range: [0, 200]},
        ];

        this.option_dashboard = {

            series: (function () {
                const result = [];
                demoData.forEach(function (item) {
                    result.push(
                        // 外围刻度
                        {
                            type: 'gauge',
                            center: item.pos,
                            radius: '40%',
                            min: item.range[0],
                            max: item.range[1],
                            startAngle: 225,
                            endAngle: -45,
                            axisLine: {
                                show: true,
                                lineStyle: {
                                    width: 2,
                                    shadowBlur: 0,
                                    color: [
                                        [1, highlight]
                                    ]
                                }
                            },
                            axisTick: {
                                show: true,
                                lineStyle: {
                                    color: highlight,
                                    width: 1
                                },
                                length: -5,
                                splitNumber: 10
                            },
                            splitLine: {
                                show: true,
                                length: -14,
                                lineStyle: {
                                    color: highlight,
                                }
                            },
                            axisLabel: {
                                distance: -20,
                                textStyle: {
                                    color: highlight,
                                    fontSize: '10',
                                    fontWeight: 'bold'
                                }
                            },
                            pointer: {
                                show: 0
                            },
                            detail: {
                                show: 0
                            }
                        },

                        // 内侧指针、数值显示
                        {
                            name: item.name,
                            type: 'gauge',
                            center: item.pos,
                            radius: '40%',
                            startAngle: 225,
                            endAngle: -45,
                            min: item.range[0],
                            max: item.range[1],
                            axisLine: {
                                show: true,
                                lineStyle: {
                                    width: 16,
                                    color: [
                                        [1, 'rgba(255, 255, 255, .1)']
                                    ]
                                }
                            },
                            axisTick: {
                                show: 0,
                            },
                            splitLine: {
                                show: 0,
                            },
                            axisLabel: {
                                show: 0
                            },
                            pointer: {
                                show: true,
                                length: '105%'
                            },
                            detail: {
                                show: true,
                                offsetCenter: [0, '100%'],
                                textStyle: {
                                    fontSize: 15,
                                    color: '#fff'
                                },
                                formatter: [
                                    '{value} ' + (item.unit || ''),
                                    '{name|' + item.name + '}'
                                ].join('\n'),
                                rich: {
                                    name: {
                                        fontSize: 15,
                                        lineHeight: 30,
                                        color: '#ddd'
                                    }
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: highlight,
                                }
                            },
                            data: [{
                                value: item.value
                            }]
                        }
                    );
                });

                return result;
            })()
        };

        const percent = 400;

        function getData() {
            return [{
                value: percent,
                itemStyle: {
                    normal: {
                        color: '#4fe488',
                        shadowBlur: 10,
                        // shadowColor:  '#fb358a'
                    }
                }
            }, {
                value: 1 - percent,
                itemStyle: {
                    normal: {
                        color: 'transparent'
                    }
                }
            }];
        }

        const myColor = ['#fff600', '#316fc0', '#41b3ee'];
        this.option_zhuboard = {
            grid: {
                left: '12%',
                right: '12%',
                bottom: '5%',
                top: '5%',
            },
            xAxis: [{
                show: false,
            }],
            yAxis: [{
                splitLine: 'none',
                axisTick: 'none',
                axisLine: 'none',
                axisLabel: {
                    verticalAlign: 'bottom',
                    align: 'left',
                    padding: [0, 0, 10, 8],
                    textStyle: {
                        color: '#ffffff',
                        fontSize: '16',
                    }
                },
                data: ['全行当日交易量总金额', '现金交易量总额']
            }, {
                splitLine: 'none',
                axisTick: 'none',
                axisLine: 'none',
                data: [148, 59],
                axisLabel: {
                    show: true,
                    verticalAlign: 'bottom',
                    align: 'right',
                    padding: [0, 8, 10, 0],
                    textStyle: {
                        color: '#fff',
                        fontSize: '16',
                    },
                    formatter: '{y|{value}} {x|千万}',
                    rich: {
                        y: {
                            color: '#fffa6f',
                            fontSize: 16
                        },
                        x: {
                            fontSize: 12
                        }
                    }
                },
            }, {
                splitLine: 'none',
                axisTick: 'none',
                axisLine: 'none',
                data: []
            }],
            series: [{
                name: '条',
                type: 'bar',
                yAxisIndex: 0,
                data: [148, 59],
                label: {

                    normal: {
                        show: false,
                        position: 'right',
                        color: function (params) {
                            const num = myColor.length;
                            return myColor[params.dataIndex % num]
                        },
                        fontSize: 6,
                        fontFamily: 'arial',
                        formatter: '{c}人'
                    }
                },
                barWidth: 6,
                itemStyle: {
                    normal: {
                        color: function (params) {
                            const num = myColor.length;
                            return myColor[params.dataIndex % num]
                        },
                        barBorderRadius: 5,
                    }
                },
                z: 2
            }, {
                name: '外框',
                type: 'bar',
                yAxisIndex: 2,
                barGap: '-100%',
                data: [200, 200],
                barWidth: 6,
                itemStyle: {
                    normal: {
                        color: 'rgba(255, 255, 255, .1)',
                        barBorderRadius: 5,
                    }
                },
                z: 0
            },
                {
                    name: '外圆',
                    type: 'scatter',
                    hoverAnimation: false,
                    data: [148, 59],
                    yAxisIndex: 2,
                    symbolSize: 9,
                    itemStyle: {
                        normal: {
                            color: '#fff',
                            opacity: 1,
                        }
                    },
                    z: 2
                }]
        };

        const xdata = [
            '2',
            '4',
            '6',
            '8',
            '10',
            '12',
            '14',
            '16',
            '18',
            '20',
            '22',
            '24',
            '26',
            '28',
            '30'
        ];
        const yOnline = [10, 22, 37, 23, 29, 10, 10, 30, 40, 40, 50, 60, 50, 60, 50];
        const yOffline = [10, 52, 67, 33, 39, 30, 20, 40, 50, 50, 80, 70, 60, 50, 80];
        this.option_datamart = {
            title: {
                text: '30天交易量柱状图',
                left: 'center',
                textStyle: {
                    fontSize: 14,
                    color: 'white'
                }
            },
            // color:  ['rgb(9, 188, 150)',  'rgb(41, 157, 255)',  'rgb(244, 100, 49)'],
            tooltip: {
                trigger: 'axis',
                confine: true,
                axisPointer: {
                    type: 'line'
                }
            },
            grid: {
                top: '5%',
                left: '2%',
                right: '2%',
                bottom: '1%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                data: xdata,

                axisLine: {
                    show: true,
                    lineStyle: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    }
                },
                axisLabel: {
                    color: 'rgb(204, 228, 255)',
                }
            }],
            yAxis: [{
                type: 'value',
                show: true,
                axisLabel: {
                    color: 'rgb(204, 228, 255)'
                },
                axisLine: {
                    lineStyle: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    }
                },
                splitLine: {
                    show: false
                }
            }],
            series: [{
                name: '所有交易金额',
                type: 'bar',
                barWidth: 10,
                stack: '总量',
                color: '#50a5ff',
                itemStyle: {
                    // barBorderRadius:  [15,  15,  0,  0]
                },
                emphasis: {
                    itemStyle: {
                        // color:  '#bd881f'
                    }
                },
                data: yOffline
            },
                {
                    name: '现金交易金额',
                    type: 'bar',
                    barWidth: 10,
                    stack: '总量',
                    color: '#49ff16',
                    itemStyle: {
                        // barBorderRadius:  [15,  15,  15,  15]
                    },
                    emphasis: {
                        itemStyle: {
                            // color:  '#bd881f'
                        }
                    },
                    data: yOnline
                }
            ]
        };
    }


    ngOnInit() {
        this.curDateTime = new Date();
        setInterval(date => {
            this.curDateTime = new Date();
        }, 1000);

        const params = '';
        this.bankMonitorService.getWdTransInfoRanking(params)
            .subscribe(TransInfoRank => {
                TransInfoRank.data.forEach(TransInfoRankList => {
                    this.orgNameAry.push(TransInfoRankList.orgName);
                    this.transAmountData.push(TransInfoRankList.transAmount);
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
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

        this.bankMonitorService.getWdOpenRateRanking(params)
            .subscribe(OpenRateRank => {
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
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });

        this.es.init(this.HotMapCharts.nativeElement).on('click', (maparams) => {
            if (maparams.componentType === 'series') {
                let flag = 0;
                this.provinceMap.forEach(data1 => {
                    if (data1.name === maparams.name) {
                        flag = 1;
                    }
                });
                if (flag === 1) {
                    this.selectCity(maparams.name);
                    this.bankMonitorService.getMapjson(maparams.name)
                        .subscribe(mapjsoninfo => {
                            this.es.echarts.registerMap('Province', mapjsoninfo);
                            this.es.getInstanceByDom(this.HotMapCharts.nativeElement).setOption({
                                title: {
                                    text: maparams.name + '交易量热力图',
                                },
                                geo: {
                                    map: 'Province',
                                },
                                series: [
                                    {
                                        map: 'Province',
                                        name: '市/县',
                                        data: this.cityMap,
                                    }, {
                                        data: this.convertData(this.citydata),
                                        symbolSize:  function (val) {
                                            return val[2] / 10;
                                        },
                                        label:  {
                                            normal:  {
                                                show:  true
                                            }
                                        }
                                    }, {
                                        data: this.convertData(this.citydata.sort(function (a,  b) {
                                            return b.value - a.value;
                                        }).slice(0,  3)),
                                        symbolSize:  function (val) {
                                            return val[2] / 10;
                                        }
                                    }
                                ]
                            });
                        }, (error) => {
                            console.log(error);
                            if (error instanceof HttpResponse) {
                                this.message.error(error.body.retMsg);
                            }
                        });
                }
            }
        });
    }
    convertData(data) {
        const res = [];
        for (let i = 0; i < data.length; i++) {
            const geoCoord = this.geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name: data[i].name,
                    value: geoCoord.concat(data[i].value)
                });
            }
        }
        return res;
    }

    selectCity(provinceName) {
        this.citydata = [];
        this.cityMap.forEach(cityMapdata => {
            this.data12.forEach(datainfo => {
                if (cityMapdata.name === datainfo.name) {
                    this.citydata.push(datainfo);
                }
            });
        });
    }

    onbackmap(event) {
        const mapName = 'china';
        this.bankMonitorService.getMapjson(mapName)
            .subscribe(mapjsoninfo => {
                this.es.echarts.registerMap('china', mapjsoninfo);
                this.es.getInstanceByDom(this.HotMapCharts.nativeElement).setOption({
                    title: {
                        text: '全国交易量热力图',
                        left: 'center',
                        top: 'top',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    geo: {
                        map: 'china',
                    },
                    series: [
                        {
                            map: 'china',
                            name: '省/市',
                            data: this.provinceMap
                        },
                        {
                            name: '城市',
                            data:  this.convertData(this.data12),
                            symbolSize:  function (val) {
                                return val[2] / 20;
                            },
                            label:  {
                                normal:  {
                                    show:  false
                                }
                            }
                        },
                        {
                            data: this.convertData(this.data12.sort(function (a,  b) {
                                return b.value - a.value;
                            }).slice(0,  6)),
                            symbolSize:  function (val) {
                                return val[2] / 20;
                            },
                        }
                    ]
                });
            }, (error) => {
                console.log(error);
                if (error instanceof HttpResponse) {
                    this.message.error(error.body.retMsg);
                }
            });
    }
}
