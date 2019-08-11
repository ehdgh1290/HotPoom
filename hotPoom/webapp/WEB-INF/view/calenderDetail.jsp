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
        html {
            font-family: 'Noto Sans KR', sans-serif;
            color: #424242;
            user-select: none;
        }
        #header {
            width: 100%;
            height: 100px;
            /*background-color: #eee;*/
        }
        #headerSection {
            position: relative;
            width: 100%;
            height: 100px;
        }
        input:focus {
            outline: none;
        }
        #headerLogo {
            position: absolute;
            width: 130px;
            left: 20px;
            margin-top: 6px;
        }

        /************로그인 하기 전**************/
        #headerLogin {
            position: absolute;
            height: 40px;
            font-size: 20px;
            margin-right: 20px;
            line-height: 20px;
            right: 20px;
            top: 30px;
            font-weight: 500;
            cursor: pointer;
            display: block;
        }
        #headerLogin.hide {
            display: none;
        }
        #headerLogin:hover {
            text-decoration: underline #424242;
        }
        /********************************************/

        #gnb {
            position: absolute;
            width: 600px;
            height: 40px;
            top: 30px;
            left: 200px;
        }
        #gnb a {
            position: relative;
            width: 100px;
            height: 40px;
            font-size: 20px;
            margin-right: 30px;
            line-height: 20px;
            top: 10px;
            font-weight: 500;
            cursor: pointer;
        }
        .fa-search {
            font-size: 24px;
            transition: .2s;
        }
        .fa-search:hover {
            text-shadow: 2px 2px 2px #afafaf;
        }
        .btn {
            border: none;
            margin: 0;
            padding: 0;
            width: auto;
            background-color: transparent;
            outline: none;
        }
        #headerProfileImage {
            position: absolute;
            width: 50px;
            border-radius: 100px;
            right: 20px;
            top: 25px;
            cursor: pointer;
        }
        #lnb {
            position: absolute;
            top: 80px;
            right: 30px;
            border: 1px solid #424242;
            display: none;
            z-index: 999;
        }
        #lnb:hover {
            cursor: pointer;
        }
        #lnb li {
            padding: 10px;
            text-align: center;
            border-top: 1px solid #424242;
            background-color: #fff;
        }
        #lnb li:first-child {
            border-top: none;
        }


        /*********************************loginPopup************************************/

        #bg, .bg {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            display: none;
            z-index: 1000;
            top:0;
            top: 0;
            left: 0;
        }

        #loginPopup {
            position: relative;
            width:360px;
            height: 360px;
            top: 50%;
            left: 50%;
            margin: -200px 0 0 -200px;
            padding: 20px;
            background-color: #fff;
        }

        #loginTitle {
            position: absolute;
            width: 100px;
            left: 150px;
            text-align: center;
            font-size: 28px;
        }

        .fa-times-circle {
            position: absolute;
            font-size: 26px;
            right: 20px;
            color: #424242;
        }

        .fa-times-circle:hover {
            color: #C50532;
        }

        .loginPopup_text {
            position: absolute;
            font-size: 20px;
            left: 40px;
        }

        .loginPopup_input {
            position: absolute;
            width: 300px;
            height: 30px;
            left: 40px;
            text-indent: 10px;
        }

        #loginPopup span:nth-child(3) {
            top: 90px;
        }

        #idInput {
            top: 120px;
        }

        #loginPopup span:nth-child(5) {
            top: 180px;
        }

        #passwordInput {
            top: 210px;
        }

        #passwordInfo {
            position: absolute;
            top: 323px;
            left: 40px;
            font-size: 14px;

        }

        #loginPopup #loginBtn {
            position: absolute;
            width: 304px;
            height: 40px;
            top: 275px;
            left: 40px;
            color: #fff;
            background-color: #C50532;
        }

        #joinInfo {
            position: absolute;
            top: 345px;
            left: 40px;
            font-size: 14px;

        }

        #joinBtn {
            position: absolute;
            top: 345px;
            left: 195px;
            color: #C50532;
            font-weight: bold;
            font-size: 14px;

        }

        #findPasswordBtn {
            position: absolute;
            top: 323px;
            left: 250px;
            font-size: 14px;
            color: #C50532;
            font-weight: bold;
        }

        .cursor_pointer {
            cursor: pointer;
        }

        /* 크롬 input창 클릭 시 placeholder 없애기 */
        input:focus::-webkit-input-placeholder,
        textarea:focus::-webkit-input-placeholder {
            color:transparent;
        }
        /* firefox 4 ~ 18 input창 클릭 시 placeholder 없애기 */
        input:focus:-moz-placeholder,
        textarea:focus:-moz-placeholder {
            color:transparent;
        }
        /* firefox 19이상 input창 클릭 시 placeholder 없애기 */
        input:focus::-moz-placeholder,
        textarea:focus::-moz-placeholder {
            color:transparent;
        }
        /* Internet Explorer 10+ */
        input:focus:-ms-input-placeholder,
        textarea:focus:-ms-input-placeholder
        {
            color:transparent;
        }

        /*------------------------------------------a요소 css없애기-------------------------------------*/
        /* 헤더 a링크 css 초기화 */
        a:link {
            text-decoration: none;
            color: #424242;
        }

        a:visited {
            text-decoration: none;
            color: #424242;
        }

        a:active {
            text-decoration: none;
            color: #424242;
        }

        a:hover {
            text-decoration: none;
            color: #424242;
        }

        /*---------------footer-------------*/
        #policy {
            width:800px;
            height:60px;
            display: inline-block;
        }
        #footer {
            position: absolute;
            width:100%;
            height:60px;
            line-height: 60px;;
            border-top: #424242 solid 2px;
        }

        #footer.fixed {
            position: fixed;
            bottom:0;
        }
        #footer address {
            position: absolute;
            width:300px;
            height:60px;
            display: inline-block;
            color:#424242;
            left: 100px;
        }

        #footer a {
            text-decoration:none;
            color: #424242;
        }
        #footer a:hover {
            color:#C50532;
            text-decoration: underline;
        }
        a.btn {
            text-decoration: none;
        }
        #footer address a {
            font-weight: 400;
        }

        #policy ul {
            position: absolute;
            width: 900px;
            text-align: center;
            left: 400px;
        }

        #policy li {
            display: inline;
            border-left:1px solid #ddd;
            margin-right:9px;
            padding-left: 8px;
        }

        #policy li:first-child {
            border:none;
        }

        #policy strong {
            font-weight:400;
        }

        #footerLogo {
            position: absolute;
            top: 5px;
            left: 40px;
        }

        #loginPopup .msg {
            position: absolute;
            top: 250px;
            left: 40px;
            color: #C50532;
            display: none;
        }
        #logout {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            color: #424242;
            cursor: pointer;
        }
        #poomRegister {
            position: absolute;
            right: 100px;
            border-radius: 5px;
            background-color: #fff;
            color: #0F8B8F;
            padding: 8px;
            font-size: 18px;
            top: 30px;
            border: 2px solid #0F8B8F;
            cursor: pointer;
        }
        #poomRegister:hover {
            border: none;
            background-color: #0F8B8F;
            color: #fff;
            padding: 10px;
        }








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

            top: 30px;
            left: 0;
        }

        .margin{
            margin-right: 300px;
        }

        .margin_price {
            margin-right: 80px;
        }

        #informationWrap h1,div{
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

        #endDate{
            left: 190px;
            top: -47px;
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





    /********************************header*****************************************/

    $headerProfileImage = $("#headerProfileImage");
    $lnb = $("#lnb");
    $body = $("body");


    $headerProfileImage.click(function (e) {

        $lnb.slideToggle(200);
        e.stopPropagation();
    });//$headerProfileImage click end


    $body.click(function () {
        // alert("zz");
        $lnb.hide();
    });//$body click end








</script>
</body>
</html>