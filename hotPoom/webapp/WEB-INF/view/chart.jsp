<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>평균 숙박률</title>
    <!-- include application-chart.min.css -->

    <link rel="stylesheet" href="/css/chart.min.css" />
    <link rel="stylesheet" href="/css/buisnessDefault.css"/>
    <style>
    	body{
    		margin: 0;
    	}
    	.tui-chart-chartExportMenu-button{
    		display: none;
    	}
    	#lnb {
    		margin:0;
    		padding:0;
			list-style: none;
    	}
        #content{
            margin: auto;
            width: 1100px;
            height: auto;
        }
        #incomeSection h1{
            font-weight: bold;
            font-size: 30px;
            margin-bottom: 20px;
        }
        #monthIncomeWrap{
            margin-left: 30px;
            height: 100px;
        }
        #monthSelect{
            width: 100px;
            font-size: 18px;
        }
        #chartSection {
            width: 1100px;
            margin: auto;
        }
        .margin_right {
            margin-right: 480px;
        }
        .margin_rate {
            margin-left: 100px;
        }
        #reservationRateHeaderInner>h3 {
            float: left;
        }
        .reservation_rate_title {
            width: 360px;
            font-size: 18px;
            font-weight: bold;
            /*background-color: #90CAF9;*/
            position: absolute;
            top: 50px;
            left: 210px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .reservation_rate_content_box {
            display: inline-block;
            width: 1100px;
            position: relative;
            /*background-color: #0F8B8F;*/
            margin-bottom: 20px;
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.12);
        }


        .reservation_rate_img {
            width: 200px;
            /*background-color: #c1788b;*/
        }
        .reservation_rate_content {
            /*background-color: #cccccc;*/
            width: 470px;
            position: absolute;
            top: 50px;
            right: 0;
        }
        .my_rate {
            /*background-color: #e8eb88;*/
        }
        .avg_rate {
            /*background-color: #68188b;*/
            position: absolute;
            right: 270px;
        }
        .reservation_cnt {
            /*background-color: #eb8c7b;*/
            position: absolute;
            right: 80px;
        }
        #monthIncomeWrap{
            position: relative;
        }
       .price{
            position: absolute;
            left: 200px;
            font-size: 20px;
        }
        .price span{
            font-weight: bold;
            font-size: 20px;
        }
        #completePrice{
            top: 10px;
        }
        #schedulePrice{
            top: 40px;
        }
        #detailInfo{
            margin-left: 30px;
            height: 150px;
        }
        .info{
            margin-left: 10px;
            margin-bottom: -10px;

        }

    </style>
</head>
<body>
<c:import url="/WEB-INF/template/businessHeader.jsp"/>
    <div id="incomeSection">
        <h1>수입</h1>
        <div id="monthIncomeWrap">
            <select id="monthSelect">
                <option>1월</option>
                <option>2월</option>
                <option>3월</option>
                <option>4월</option>
                <option>5월</option>
                <option>6월</option>
                <option selected>7월</option>
                <option>8월</option>
                <option>9월</option>
                <option>10월</option>
                <option>11월</option>
                <option>12월</option>
            </select>
            <span id="allPrice" class="price"><span>총 수입 </span>  ￦72,150,000</span>
            <p id="completePrice" class="price"><span>지급완료 </span> ￦50,505,000</p>
            <p id="schedulePrice" class="price"><span>지급예정 </span> ￦21,645,000</p>
        </div>
        <div id="chartArea"></div>
        <div id="detailInfo">
            <h3>2019 세부정보</h3>
            <p class="info"><span>예약일 수 </span> 3000 건</p>
            <p class="info"><span>미예약일 수  </span> 1050 건</p>
            <p class="info"><span>숙박률 </span> 65%</p>
        </div>
    </div>
<div id="chartSection">
<div id="chart-area"></div>
<div id="reservationRateSection">
    <h1>숙소별 숙박률</h1>
    <div id="reservationRateWrap">
        <div id="reservationRateHeaderInner">
            <h3 class="margin_right">숙소</h3>
            <h3 class="margin_rate">숙박률</h3>
            <h3 class="margin_rate">시장평균</h3>
            <h3 class="margin_rate">예약한 건수</h3>
        </div>
        <div class="reservation_rate_content_inner">
            <div class="reservation_rate_content_box">
                <div class="reservation_rate_img">
                    <img src="img/poom/개터파크.jpg" width="200"/>
                </div>
                <div class="reservation_rate_title">
                    <span>jbp 개터파크는 특별하답니다.</span>
                </div>
                <div class="reservation_rate_content">
                    <span class="my_rate">65%</span>
                    <span class="avg_rate">60%</span>
                    <span class="reservation_cnt">3000건</span>
                </div>
            </div><!-- //reservation_rate_content_box -->
            <div class="reservation_rate_content_box">
                <div class="reservation_rate_img">
                    <img src="img/poom/lionm.jpg" width="200"/>
                </div>
                <div class="reservation_rate_title">
                    <span>라이언 농장에 오신걸 환영합니다~</span>
                </div>
                <div class="reservation_rate_content">
                    <span class="my_rate">40%</span>
                    <span class="avg_rate">20%</span>
                    <span class="reservation_cnt">150건</span>
                </div>
            </div><!-- //reservation_rate_content_box -->
            <div class="reservation_rate_content_box">
                <div class="reservation_rate_img">
                    <img src="img/poom/anfro.jpg" width="200"/>
                </div>
                <div class="reservation_rate_title">
                    <span>계속 보다보면 너무 귀엽답니다. 물개랜드</span>
                </div>
                <div class="reservation_rate_content">
                    <span class="my_rate">20%</span>
                    <span class="avg_rate">12%</span>
                    <span class="reservation_cnt">57건</span>
                </div>
            </div><!-- //reservation_rate_content_box -->
            <div class="reservation_rate_content_box">
                <div class="reservation_rate_img">
                    <img src="img/poom/baaaaam.jpg" width="200"/>
                </div>
                <div class="reservation_rate_title">
                    <span>뱀 돌봐주는 하선이네</span>
                </div>
                <div class="reservation_rate_content">
                    <span class="my_rate">37%</span>
                    <span class="avg_rate">54%</span>
                    <span class="reservation_cnt">73건</span>
                </div>
            </div><!-- //reservation_rate_content_box -->
            <div class="reservation_rate_content_box">
                <div class="reservation_rate_img">
                    <img src="img/poom/jieun.jpg" width="200"/>
                </div>
                <div class="reservation_rate_title">
                    <span>조용하고 느리지만 빠른 지금이의 거북이 하우스</span>
                </div>
                <div class="reservation_rate_content">
                    <span class="my_rate">84%</span>
                    <span class="avg_rate">63%</span>
                    <span class="reservation_cnt">3042건</span>
                </div>
            </div><!-- //reservation_rate_content_box -->
        </div><!-- //reservation_rate_content_inner -->
    </div>
</div>
</div>

<!-- include chart.min.js -->
<script src="/js/chart.min.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/tui-chart-all.min.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<c:import url="/WEB-INF/template/businessFooter.jsp"/>
<script>

    let containers = document.getElementById('chartArea');
    let datas = {
        categories: ['1', '4', '7', '10', '13', '16', '19', '21', '24', '27', '31'],
        series: [
            {
                name: '개터파크',
                data: [7215000, 3367000, 7252000, 6031000, 7178000, 6253000, 6142000, 6808000, 4403000, 9990000, 7030000]
            },
            {
                name: '라이언 농장',
                data: [900000, 1500000, 2100000, 1780000, 3750000, 4900000, 3250000, 2980000, 1490000, 900000, 875000]
            },
            {
                name: '물개랜드',
                data: [1280000, 5890000, 2480000, 990000, 960000, 938000, 930000, 940000, 948000, 950000, 965000]
            },
            {
                name: '뱀 돌봐주는 하선이네',
                data: [208000, 1975000, 658000, 4586000, 3055000, 750500, 485000, 1205000, 963000, 1350000, 1153000]
            },
            {
                name: '거북이 하우스',
                data: [50500, 784000, 863000, 766000, 972000, 1162000, 995000, 695000, 2605000, 3010000, 2860000]
            }
        ]
    };
    let option = {
        chart: {
            width: 1160,
            height: 540,
            title: '김필구님 수입'
        },
        yAxis: {
            title: 'Stay with Pilgu',
        },
        xAxis: {
            title: 'Date',
            pointOnColumn: true,
            dateFormat: 'DD',
            tickInterval: 'auto'
        },
        series: {
            showDot: false,
            zoomable: true
        },
        tooltip: {
            suffix: '원'
        },
        plot: {
            bands: [
                {
                    range: ['1', '31'],
                    color: 'gray',
                    opacity: 0.2
                }
            ],
            lines: [
                {
                    value: '1',
                    color: '#fa2828'
                }
            ]
        }
    };
    let themes = {
        series: {
            colors: [
                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
            ]
        }
    };
    // For apply theme
    // tui.chart.registerTheme('myTheme', theme);
    // options.theme = 'myTheme';
    let charts = tui.chart.lineChart(containers, datas, option);

    let container = document.getElementById('chart-area');
    let data = {
        categories: ['07/01/2019', '07/04/2019', '07/07/2019', '07/10/2019', '07/13/2019', '07/16/2019', '07/19/2019', '07/21/2019', '07/24/2019', '07/27/2019', '07/31/2019'],
        series: [
            {
                name: '개터파크',
                data: [65, 37.5, 72, 61, 68.7, 63, 62, 68.75, 43, 98, 72]
            },
            {
                name: '라이언 농장',
                data: [42, 55, 85, 12, 43, 37, 52, 59, 49, 77, 50]
            },
            {
                name: '물개랜드',
                data: [22.1, 22, 20.9, 18.3, 15.2, 12.8, 11.8, 13.0, 15.2, 17.6, 19.4]
            },
            {
                name: '뱀 돌봐주는 하선이네',
                data: [10.3, 76, 43, 52, 91, 56, 51, 60, 41, 37, 18]
            },
            {
                name: '거북이 하우스',
                data: [13.2, 30, 40, 55, 68, 43, 73, 77, 80, 83, 84]
            }
        ]
    };
    let options = {
        chart: {
            width: 1160,
            height: 540,
            title: '김필구님 숙소의 숙박률'
        },
        yAxis: {
            title: 'Stay with Pilgu',
        },
        xAxis: {
            title: 'Date',
            pointOnColumn: true,
            dateFormat: 'DD',
            tickInterval: 'auto'
        },
        series: {
            showDot: false,
            zoomable: true
        },
        tooltip: {
            suffix: '%'
        },
        plot: {
            bands: [
                {
                    range: ['07/01/2019', '07/31/2019'],
                    color: 'gray',
                    opacity: 0.2
                }
            ],
            lines: [
                {
                    value: '07/01/2019',
                    color: '#fa2828'
                }
            ]
        }
    };
    let theme = {
        series: {
            colors: [
                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
            ]
        }
    };
    // For apply theme
    // tui.chart.registerTheme('myTheme', theme);
    // options.theme = 'myTheme';
    let chart = tui.chart.lineChart(container, data, options);


   


</script>
</body>
</html>