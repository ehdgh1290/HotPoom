<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/buisnessLink.jsp"/>
    <link rel="stylesheet" href="/css/reservations.css">
</head>
<body>
<c:import url="/WEB-INF/template/businessHeader.jsp"/>
    <h2 id="title">예약</h2>
    <div id="reservationFilterWrap">
        <input type="radio" class="radio" id="sortFilter1" name="sortFilter" value="">
        <label class="lbl sort_btn" for="sortFilter1">예정된 예약</label>
        <input type="radio" class="radio" id="sortFilter2" name="sortFilter" value="" checked>
        <label class="lbl sort_btn" for="sortFilter2">모두</label>
        <div id="reservationFilterBtn">Filter</div>
        <div id="filterDetailWrap">
            <h2 class="filterTitle">상태</h2>
            <div id="case">
                <input type="checkbox" class="checkbox" id="caseFilter1" name="case" value="">
                <label class="lbl case" for="caseFilter1">예약확정</label>
                <input type="checkbox" class="checkbox" id="caseFilter2" name="case" value="">
                <label id="caseFilter2Lbl" class="lbl case" for="caseFilter2">예약취소</label>
            </div>
            <h2 id="filterTitle2" class="filterTitle">날짜</h2>
            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                <input id="startpicker-input" type="text" aria-label="Date">
                <span class="tui-ico-date"></span>
                <div id="startpicker-container" style="margin-left: -1px;"></div>
            </div>
            <span id="arrow"><i class="fas fa-arrow-right"></i></span>
            <div id="endpicker" class="tui-datepicker-input tui-datetime-input tui-has-focus">
                <input id="endpicker-input" type="text" aria-label="Date">
                <span class="tui-ico-date"></span>
                <div id="endpicker-container" style="margin-left: -1px;"></div>
            </div>
            <div id="applyBtn">적 용</div>
        </div><!--//filterDetailWrap-->
    </div><!--//reservationFilterWrap-->
    <div id="reservationTableWrap">
        <table id="reservationTable">
            <thead>
                <tr>
                    <th>품</th>
                    <th>예약 날짜</th>
                    <th>맡긴 기간</th>
                    <th>펫</th>
                    <th>수입</th>
                    <th>상태</th>
                    <th>메세지</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>jbp 개터피아는 특별하답니다.</td>
                    <td>2019년 8월 12일</td>
                    <td>8월 25-28, 2019<br>3박</td>
                    <td>수댕이<br>강아지 3마리</td>
                    <td>270,000</td>
                    <td>예약확정</td>
                    <td>
                        <a><em>메세지</em></a>
                    </td>
                </tr>
                <tr>
                    <td>라이언 농장에 오신 것을 환영합니다.</td>
                    <td>2019년 7월 12일</td>
                    <td>7월 15-18, 2019<br>3박</td>
                    <td>광복이<br>사자 1마리</td>
                    <td>0</td>
                    <td>예약취소</td>
                    <td>
                        <a><em>메세지</em></a>
                    </td>
                </tr>
                <tr>
                    <td>뱀 돌봐주는 하선이네</td>
                    <td>2019년 7월 07일</td>
                    <td>7월 13-18, 2019<br>5박</td>
                    <td>세비로스<br>뱀 1마리</td>
                    <td>225000</td>
                    <td>예약확정</td>
                    <td>
                        <a><em>메세지</em></a>
                    </td>
                </tr>
                <tr>
                    <td>조용하고 느리지만 빠른 지금이의 거북이 하우스</td>
                    <td>2019년 7월 01일</td>
                    <td>7월 10-12, 2019<br>2박</td>
                    <td>꼬북칩<br>거북이 2마리</td>
                    <td>52000</td>
                    <td>예약대기</td>
                    <td>
                        <a><em>메세지</em></a>
                    </td>
                </tr>
                <tr>
                    <td>계속 보다보면 너무 귀엽답니다. 물개랜드</td>
                    <td>2019년 6월 27일</td>
                    <td>7월 01-04, 2019<br>3박</td>
                    <td>오엉오엉<br>물개 1마리</td>
                    <td>450000</td>
                    <td>예약확정</td>
                    <td>
                        <a><em>메세지</em></a>
                    </td>
                </tr>
                
            </tbody>
    </table>
    </div><!--//reservationTableWrap-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be5825a36e55f8d6d9fa39f1d0faa319"></script>
<c:import url="/WEB-INF/template/businessFooter.jsp"/>

<script>

    //****************************필터*****************************************
    let $reservationFilterBtn = $("#reservationFilterBtn");
    let $filterDetailWrap = $("#filterDetailWrap");
    let $applyBtn = $("#applyBtn");

    $reservationFilterBtn.on("click",function () {
        $filterDetailWrap.toggle();
    });

    $applyBtn.on("click",function () {
        $filterDetailWrap.hide();
    });

    let today = new Date();
    const picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input',
            container: '#endpicker-container'
        },
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ],
        language:'ko'
    });


    //****************************필터*****************************************


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