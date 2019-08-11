<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>세부 일정</title>
    <c:import url="/WEB-INF/template/buisnessLink.jsp"/>


    <style>
      





        /*--------------- content -------------*/


        #content{
            position: relative;
            width: 1100px;
            height: 800px;
            left: 50%;
            margin-left: -550px;
        }

        #contentAll{
            position: relative;
            width: 1100px;
            height: 800px;
            display: none;
            margin: auto;
        }
        #section{
            margin-top: 30px;
            position: absolute;
            width: 1100px;
            height: 50px;
            font-size: 20px;
        }

        .calendar_detail_select {
            padding: 0 9px 0 9px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            margin: 0 10px;
            vertical-align: middle;
            height: 40px;
            top: -10px;
            outline: none;
        }

        #selectPoom{
            position: absolute;
            top: 0;
            height: 40px;
            width: 300px;
            outline: none;
        }

        #informationWrap{
            position: absolute;
            width: 100%;
            height: 50px;
            top: 80px;
            font-weight: bold;

        }

        #informationInner{
            position: absolute;
            width: 1100px;

            top: 10px;
            left: 0;
        }

        .margin{
            margin-right: 300px;
        }

        .margin_price {
            margin-right: 80px;
        }

        #informationWrap h1, #informationWrap div{
            position: relative;
            display: inline-block;
            font-size: 20px;
        }

        #yearAndMonthBox{
            position: absolute;
            line-height: 50px;
            width: 1100px;
            height: 50px;
            top: 130px;
            font-size: 20px;
        }

        #calendar{
            position: absolute;
            width: 700px;
            height: 500px;
            background: #FFFFFF;
            top: 180px;
        }

        #calendar table{
            position: absolute;
            width: 700px;
            height: 500px;
            border: 1px solid #EEEEEE;
        }

        .tui-calendar td{
            border: 1px solid #EEEEEE;

        }


        .tui-calendar-week:nth-child(1) td:nth-child(5):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(1) td:nth-child(6):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(1) td:nth-child(7):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(2) td:nth-child(1):hover{
            cursor: not-allowed;
        }.tui-calendar-week:nth-child(2) td:nth-child(2):hover{
             cursor: not-allowed;
         }
        .tui-calendar-week:nth-child(2) td:nth-child(3):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(2) td:nth-child(4):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(2) td:nth-child(5):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(2) td:nth-child(6):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(2) td:nth-child(7):hover{
            cursor: not-allowed;
        }
        .tui-calendar-week:nth-child(3) td:nth-child(1):hover{
            cursor: not-allowed;
        }



        .tui-calendar-week:nth-child(3) td:nth-child(2):hover{
            cursor: pointer;
            background: #0F8B8F;
        }
        .tui-calendar-week:nth-child(3) td:nth-child(3):hover{
            cursor: pointer;
        }
        .tui-calendar-week:nth-child(3) td:nth-child(4):hover{
            cursor: pointer;
            background: #0F8B8F;
        }
        .tui-calendar-week:nth-child(3) td:nth-child(5):hover{
            cursor: pointer;
            background: #0F8B8F;
        }
        .tui-calendar-week:nth-child(3) td:nth-child(6):hover{
            cursor: pointer;
            background: #0F8B8F;
        }
        .tui-calendar-week:nth-child(3) td:nth-child(7):hover{
            cursor: pointer;
            background: #0F8B8F;
        }

        .tui-calendar-week:nth-child(4) td:hover{
            cursor: pointer;
            background: #0F8B8F;
        }

        .tui-calendar-week:nth-child(5) td:hover{
            cursor: pointer;
            background: #0F8B8F;
        }

        /*.tui-calendar-week .tui-calendar-week td:nth-child(5) {
            cursor: not-allowed;
            background: #9876F1;
        }*/

        .disabled{
            background: #EEEEEE;
        }

        .disabledReservation{
            background: #D3D3D3;
        }

        /********************사이드바************************/

        #bookingWrap {
            width: 380px;
            height: 350px;
            position: absolute;
            top: 260px;
            right: 0;
            float: left;
            background: #fafafa;
        }

        #bookingDetail {
            width:340px;
            height:310px;
            font-size: 18px;
            padding: 20px;
            box-shadow: 0 8px 17px 0 rgba(95, 95, 95, 0.2), 0 6px 20px 0 rgba(59, 59, 59, 0.19);
        }
        #price {
            font-weight: bold;
            font-size: 20px;
        }
        #bookingDate {
            width: 340px;
            height: 80px;
            position: absolute;
            top: 90px;
            z-index: 2;
        }
        #arrow {
            position: relative;
            top: 15px;
        }
        #canReservation {
            width: 340px;
            position: absolute;
            top: 170px;
            left: 20px;
        }
        #canReservation p{
            margin: 15px;
            padding-bottom: 5px;
            border-bottom: 1px solid #424242;
        }

        #canReservation p input{

            position: absolute;
            right: 15px;
        }

        #bookingPrice div {
            margin-top: 10px;
            margin-bottom: 20px;
        }

        #cancleBtn {
            position: absolute;
            width: 100px;
            height: 40px;
            bottom: 20px;
            left: 40px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #0F8B8F;
            border: 2px solid #0F8B8F;
            transition: .15s;
        }
        #cancleBtn:hover {
            cursor: pointer;
            color: #fff;
            background-color: #0F8B8F;
        }

        #completeBtn:hover {
            cursor: pointer;
            color: #fff;
            background-color:#0F8B8F;
        }

        #completeBtn {
            position: absolute;
            width: 100px;
            height: 40px;
            bottom: 20px;
            left: 235px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #0F8B8F;
            border: 2px solid #0F8B8F;
            transition: .15s;

        }

        #bookingDate{
            left: 20px;
            top: 70px;

        }








        /******************** calendar ************************/

        .tui-calendar .tui-calendar-header {
            position: relative;
            border-bottom: 1px solid #efefef;
            width: 700px;
        }

        .tui-calendar {
            position: relative;
            width: 700px;
            border: none;
        }



        #arrow{
            top: 13px;
            left: 3px;
        }

        label{
            cursor: pointer;
        }

        .tui-calendar-date {
            position: relative;
        }

        .test {
            position: absolute;
            width:20px;
            height:20px;
            border-radius: 20px;
            color: #C50532;
            bottom:5px;
            right:5px;
        }
    </style>
</head>

<body>

<c:import url="/WEB-INF/template/businessHeader.jsp"/>
    <div id="section">
        <select id="year" class="calendar_detail_select" name=""></select> 년
        <select id="month" class="calendar_detail_select" name=""></select> 월
        <select id="selectPoom" class="calendar_detail_select">
            <option selected name="" value="">선택해주세요</option>
            <option name="" value="">jbp 개터파크는 특별하답니다.</option>
            <option name="" value="">라이언 농장에 오신걸 환영합니다~</option>
            <option name="" value="">계속 보다보면 너무 귀엽답니다. 물개랜드</option>
            <option name="" value="">뱀 돌봐주는 하선이네</option>
            <option name="" value="">조용하고 느리지만 빠른 지금이의 거북이 ...</option>
        </select>

    </div>

    <div id="contentAll">
    <div id="informationWrap">
        <h1>jbp 개터파크는 특별하답니다.</h1>
        <div id="informationInner">
	        <span>가격: 37,000원 / </span>
	        <span>최대 수용 마리수: 15 마리</span>
        </div>
    </div>

    <p id="yearAndMonthBox"><span id="curYear">2019</span>년 <span id="curMonth">08</span>월</p>

    <div id="calendar">
        <table class="calendar-table">
            <tbody>
            <tr>
                <td><div id="calendar-date-ko"></div></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div id="bookingWrap">
        <form id="bookingDetail">
            <div id="price"><span id="dayPrice">선택 날짜</span></div>
            <div id="bookingDate">
                날짜
                <br/>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                    <input id="startpicker-input" type="text" aria-label="Date" autocomplete="off" placeholder="시작 날짜">
                    <span class="tui-ico-date"></span>
                    <div id="startpicker-container" style="margin-left: -1px;"></div>
                </div>
                <span id="arrow"><i class="fas fa-arrow-right"></i></span>
                <div id="endDate" class="tui-datepicker-input tui-datetime-input tui-has-focus">
                    <input id="endpicker-input" type="text" aria-label="Date" autocomplete="off" placeholder="끝 날짜">
                    <span class="tui-ico-date"></span>
                    <div id="endpicker-container" style="margin-left: -1px;"></div>
                </div>
            </div><!--//bookingDate end-->
            <div id="canReservation">
                예약 가능 여부
                <label for="reservationPossible">
                    <p>예약 가능 <input class="reservation" id="reservationPossible" type="radio" name="reservation" value="t"></p>
                </label>
                <label for="reservationImpossible">
                    <p>예약 불가 <input class="reservation" id="reservationImpossible" type="radio" name="reservation" value="f"></p>
                </label>
            </div>

            <button id="cancleBtn" type="reset" class="btn">취소</button>
            <button id="completeBtn" class="btn">완료</button>
            
        </form>
    </div><!--//bookingWrap end-->
</div> <!--contentAll-->


<!-- include chart.min.js -->
<c:import url="/WEB-INF/template/businessFooter.jsp"/>
<script>


    /******************************** 년 월 만들기 *****************************************/

        //1) 변수 선언
    let $year =$("#year");
    let $month = $("#month");
    let $selectPoom = $("#selectPoom");

    //3) month메서드 함수
    function makeMonth() {

        //4) 날짜 만들기
        for (var i = 1; i < 13; i++ ) {
            //$("<option>").appendTo($month).text(i+"월").attr("value"+i);
            if(i<10) {
                $("<option>").appendTo($month).text("0"+i);
            } else{
                $("<option>").appendTo($month).text(i);
            }
        }//for end

    }//makeMonth() end
    // ------------------> month

    function makeYear() {

        let now = moment(); //-> moment를 가져온 now가 객체
        let year = now.year(); //-> year메서드를 사용해 int형으로 가져옴

        for (var i = year; i > 1899; i--) {
            $("<option>").appendTo($year).text(i);
        }//for end

    }//makeYear() end
    // ---------------------> year

    makeYear();
    makeMonth();


    /******************************** 날짜 select *****************************************/

    let nowYear;
    let nowMonth;

    let startDD;
    let endDD;

    $year.on("change",function () {
        nowYear = $year.val();
        $("#curYear").text(nowYear);
    })

    $selectPoom.on("change",function () {
        nowYear = $year.val();
        nowMonth = $month.val();
        $("#curMonth").text(nowMonth);
        // console.log(nowYear);
        // console.log(nowMonth);
        // console.log(nowYear+"."+nowMonth);

        $("#contentAll").css("display","block");
        $("#contentAll").css("margin","auto");

        let calendarYYMM = nowYear+"."+nowMonth;

        $(".tui-calendar-title.tui-calendar-title-month").text(calendarYYMM);

        $(".tui-calendar-date").click(function () {

            // console.log(this);
            // console.log($(this).text().split("10")[0]);
            let dd = $(this).text().split(15)[0];

            console.log(dd);
            
            let yy = $("#curYear").text();
            let mm = $("#curMonth").text();
            

            console.log(yy);
            console.log(mm);

            /* 이거 이용!! */
/*             calDateOptional.draw({
                date: new Date("'"+yy+"-"+mm+"-"+dd+"'")
            }); */


            // console.log($("#startpicker-input").val().length);

            if($("#startpicker-input").val().length==0){
                startDD=dd;
                $("#startpicker-input").val(mm+"월 "+dd+"일");
            }else{
                endDD=dd;
                $("#endpicker-input").val(mm+"월 "+dd+"일");
            }

            // console.log($("#startpicker-input").val().length);
            // console.log($("#startpicker-input").val());
            // console.log($("#endpicker-input").val());


            $("#completeBtn").on("click",function (e) {
                e.preventDefault();

                console.log($(".checked").val());

                if($(".checked").val()=="t"){

                    $(".tui-calendar-date").each(function () {

                        // console.log(this.dataset.timestamp);

                        // console.log(startDD);
                        // console.log(endDD);

                        // console.log(moment("'2019-08-" + startDD + "'").valueOf());
                        // console.log(moment("'2019-08-" + endDD + "'").valueOf());
                        //console.log(this.dataset.timestamp == moment('2019-08-'+startDD+').valueOf());
                        //console.log(this.dataset.timestamp == moment('2019-08-'+endDD+').valueOf());
                        // console.log(this.dataset.timestamp);
                        // console.log(moment("'2019-08-" + startDD + "'").valueOf() <= this.dataset.timestamp <= moment("'2019-08-" + endDD + "'").valueOf());

                        if ((moment("'2019-08-" + startDD + "'").valueOf() <= this.dataset.timestamp) && (this.dataset.timestamp <= moment("'2019-08-" + endDD + "'").valueOf())) {

                            $(this).removeClass("disabledReservation");
                        }

                    })
                }else {
                    // console.log($("#startpicker-input").val());
                    // console.log($("#endpicker-input").val());

                    // if (this.dataset.t   imestamp == moment('2019-05-15').valueOf()) {

                    $(".tui-calendar-date").each(function () {

                        if ((moment("'2019-08-" + startDD + "'").valueOf() <= this.dataset.timestamp) && (this.dataset.timestamp <= moment("'2019-08-" + endDD + "'").valueOf())) {

                            $(this).addClass("disabledReservation");
                        }

                    })
                }



                $("#startpicker-input").val("")
                $("#endpicker-input").val("")

                /* for(i=0; i<31; i++){
                    $(".tui-calendar-date").eq[i]
                } */
            // }

            })

        })

    })

    $(".reservation").on("click",function(){


        $(".reservation").removeClass("checked");
        $(this).addClass("checked");
    })


    var DatePicker = tui.DatePicker;

    DatePicker.localeTexts['Chinese character'] = {
        titles: {
            DD: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
            D: ['日', '月', '火', '水', '木', '金', '土'],
            MMM: ['1月', '2月', '3月', '4月', '5月', '6月',
                '7月', '8月', '9月', '10月', '11月', '12月'],
            MMMM: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月']
        },
        titleFormat: 'yyyy年 MMM',
        todayFormat: 'yyyy年 MMM d日 (DD)'
    };

    var calDateOptional = DatePicker.createCalendar('#calendar-date-ko', {language: 'ko'});



    $(".tui-calendar-date").each(function() {

        if (this.dataset.timestamp == 1566054000000) {
            $(this).append("<div class='test'>3</div>");
        }

        if (this.dataset.timestamp == 1565967600000) {
            $(this).append("<div class='test'>3</div>");
        }
        if (this.dataset.timestamp == 1566140400000) {
            $(this).append("<div class='test'>13</div>");
        }
        if (this.dataset.timestamp == 1566572400000) {
            $(this).append("<div class='test'>2</div>");
        }
        if (this.dataset.timestamp == 1566658800000) {
            $(this).append("<div class='test'>0</div>");
        }
        if (this.dataset.timestamp == 1567090800000) {
            $(this).append("<div class='test'>3</div>");
        }
        if (this.dataset.timestamp == 1567177200000) {
            $(this).append("<div class='test'>13</div>");
        }

        if (this.dataset.timestamp == 1565535600000) {
            $(this).append("<div class='test'>10</div>");
        }

        if (this.dataset.timestamp == 1565622000000) {
            $(this).append("<div class='test'>12</div>");
        }

        if (this.dataset.timestamp == 1565708400000) {
            $(this).append("<div class='test'>10</div>");
        }

        if (this.dataset.timestamp == 1565794800000) {
            $(this).append("<div class='test'>11</div>");
        }

        if (this.dataset.timestamp == 1565881200000) {
            $(this).append("<div class='test'>9</div>");
        }

        if (this.dataset.timestamp == 1566831600000) {
            $(this).append("<div class='test'>9</div>");
        }

        if (this.dataset.timestamp >= 1565535600000 && this.dataset.timestamp != 1566054000000
            && this.dataset.timestamp != 1565967600000 && this.dataset.timestamp != 1566140400000
            && this.dataset.timestamp != 1566572400000 && this.dataset.timestamp != 1566658800000
            && this.dataset.timestamp != 1567090800000 && this.dataset.timestamp != 1567177200000
            && this.dataset.timestamp != 1565535600000 && this.dataset.timestamp != 1565622000000
            && this.dataset.timestamp != 1565708400000 && this.dataset.timestamp != 1565794800000
            && this.dataset.timestamp != 1565881200000 && this.dataset.timestamp != 1566831600000) {

            $(this).append("<div class='test'>15</div>");
        }
    })

    $(".tui-calendar-date").each(function() {

        if (this.dataset.timestamp < 1565535600000) {
            $(this).addClass("disabled");

        }

    })

</script>
</body>
</html>