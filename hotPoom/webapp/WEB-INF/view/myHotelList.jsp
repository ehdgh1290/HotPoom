<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>myPoomList</title>
    <c:import url="/WEB-INF/template/buisnessLink.jsp"/>
    <style>
        button {
            background-color: white;
        }
        #myPoomListSection {
            width: 1000px; min-height: 500px;
            margin: auto; padding: 20px 50px;
            /*box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);*/
            position: relative;
        }
        #myPoomListHeaderWrap {
            position: relative;
            /*background-color: gold;*/
            height: 80px;
            border-bottom: 1px solid #424242;
            margin-bottom: 15px ;
        }
        #myPoomListHeaderWrap>h2 {
            font-size: 40px; line-height: 60px;
            float: left;
        }
        #searchInput {
            position: absolute;
            width: 350px; height: 30px;
            top: 20px; left: 190px;
            font-size: 15px;
            outline: none;
            border: none;
            border-bottom: 2px solid #424242;
        }
        #myPoomListContentWrap {
            /*background-color: darkseagreen;*/
        }
        .poom_list_inner {
            width: 1000px; height: 140px;
            padding: 20px 0px;
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.12);
            position: relative;
        }
        .poom_head_box {
            float: left;
        }
        .poom_content_box {
            float: left;
            padding: 30px 0px;
            position: absolute;
            left: 320px;
        }
        .poom_content {
            height: 30px; line-height: 30px;
            position: absolute;
            width: 450px;
        }
        .title {
            font-size: 20px;
            font-weight: bold;
        }
        .pet {
            bottom: -30px;
        }
        .location {
            bottom: -55px;
        }
        .poom_main {
            width: 250px; height: 150px;
            position: absolute;
            left: 50px;
        }
        .poom_list_btn {
            border: none;
            /*background-color: wheat;*/
            color: #0F8B8F;
            font-size: 20px;
            width: 60px; height: 40px;
            cursor: pointer;
            user-select: none;
            outline: none;
            position: absolute;
            right: 10px; top: 65px;
        }
        .poom_footer_box {
            /*background-color: #0F8B8F;*/
            width: 100px; height: 101px;
            position: absolute;
            right: 0; top: 90px;
            z-index: 10;
            display: none;
        }
        .poom_footer_box li>button{
            width: 100px;
            border: none;
            cursor: pointer;
            padding: 8px;
            outline: none;
            user-select: none;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        .request_result_popup {
            position: fixed;
            z-index: 1;
            width: 200px;
            height: 80px;
            right: 20px;
            bottom: 20px;
            font-size: 16px;
            text-align: center;
            border: 2px solid #424242;
            border-radius: 5px;
            line-height: 20px;
            display: none;
        }
        .request_result_popup h3 {
            position: relative;
            top: 20px;
        }
        .request_result_popup strong {
            font-weight: bold;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/businessHeader.jsp"/>
<div id="myPoomListSection">
<div id="myPoomListHeaderWrap">
    <h2>숙소 <span>6</span>개</h2>
    <input id="searchInput" name="myPoomSearch" placeholder="내 숙소 검색"/>
</div><!--//myPoomListHeaderWrap-->
<div id="myPoomListContentWrap">
    <div class="poom_list_inner">
        <div class="poom_head_box">
            <img src="/img/poom/개터파크.jpg" class="poom_main"/>
        </div>
        <div class="poom_content_box">
            <p class="poom_content title">
            <span>jbp 개터파크는 특별하답니다.</span>
            </p>
            <p class="poom_content pet">
            <span>강아지</span>
            <span>15 마리</span>
            </p>
            <p class="poom_content location">
            <span>서울특별시 관악구 봉천동 남부순환로 1820</span>
            </p>
        </div>
        <button class="poom_list_btn"><i class="fas fa-ellipsis-h"></i></button>
        <div class="poom_footer_box">
            <ul>
                <li><button class="poom_list_update" onclick="location='/poom/update/2'">수정</button></li>
                <li><button class="poom_list_copy">복사</button></li>
                <li><button class="poom_list_delete">삭제</button></li>
            </ul>
        </div>
        <div class="request_result_popup"><h3>'<strong>개터파크</strong>'를 <br>복사했습니다.</h3></div>
    </div><!--//poom_list_inner -->
    <div class="poom_list_inner">
        <div class="poom_head_box">
            <img src="/img/poom/lionm.jpg" class="poom_main"/>
        </div>
        <div class="poom_content_box">
            <p class="poom_content title">
            <span>라이언 농장에 오신걸 환영합니다~</span>
            </p>
            <p class="poom_content pet">
            <span>사자</span>
            <span>5 마리</span>
            </p>
            <p class="poom_content location">
            <span>강원도 인제군 북면 백담로 5 (용대리)</span>
            </p>
        </div>
        <button class="poom_list_btn"><i class="fas fa-ellipsis-h"></i></button>
        <div class="poom_footer_box">
            <ul>
                <li><button class="poom_list_update" onclick="location='/poom/update/1'">수정</button></li>
                <li><button class="poom_list_copy">복사</button></li>
                <li><button class="poom_list_delete">삭제</button></li>
            </ul>
        </div>
        <div class="request_result_popup"><h3>'<strong>라이언 농장</strong>'을 <br>복사했습니다.</h3></div>
    </div><!--//poom_list_inner -->
    <div class="poom_list_inner">
        <div class="poom_head_box">
            <img src="/img/poom/anfro.jpg" class="poom_main"/>
        </div>
        <div class="poom_content_box">
            <p class="poom_content title">
            <span>계속 보다보면 너무 귀엽답니다. 물개랜드</span>
            </p>
            <p class="poom_content pet">
            <span>물개</span>
            <span>3 마리</span>
            </p>
            <p class="poom_content location">
            <span>인천광역시 중구 월미문화로 81</span>
            </p>
        </div>
        <button class="poom_list_btn"><i class="fas fa-ellipsis-h"></i></button>
        <div class="poom_footer_box">
            <ul>
                <li><button class="poom_list_update" onclick="location='/poom/update/5'">수정</button></li>
                <li><button class="poom_list_copy">복사</button></li>
                <li><button class="poom_list_delete">삭제</button></li>
            </ul>
        </div>
        <div class="request_result_popup"><h3>'<strong>물개랜드</strong>'를 <br>복사했습니다.</h3></div>
    </div><!--//poom_list_inner -->
    <div class="poom_list_inner">
        <div class="poom_head_box">
            <img src="/img/poom/baaaaam.jpg" class="poom_main"/>
        </div>
        <div class="poom_content_box">
            <p class="poom_content title">
            <span>뱀 돌봐주는 하선이네</span>
            </p>
            <p class="poom_content pet">
            <span>뱀</span>
            <span>1 마리</span>
            </p>
            <p class="poom_content location">
            <span>서울특별시 강남구 남부순환로 2615</span>
            </p>
        </div>
        <button class="poom_list_btn"><i class="fas fa-ellipsis-h"></i></button>
        <div class="poom_footer_box">
            <ul>
                <li><button class="poom_list_update" onclick="location='/poom/update/9'">수정</button></li>
                <li><button class="poom_list_copy">복사</button></li>
                <li><button class="poom_list_delete">삭제</button></li>
            </ul>
        </div>
        <div class="request_result_popup"><h3>'<strong>뱀 돌봐주는 하선이네</strong>'를 <br>복사했습니다.</h3></div>
    </div><!--//hotel_list_inner -->
    <div class="poom_list_inner">
        <div class="poom_head_box">
            <img src="/img/poom/goha.png" class="poom_main"/>
        </div>
        <div class="poom_content_box">
            <p class="poom_content title">
            <span>도마뱀 돌봐주는 하선이네</span>
            </p>
            <p class="poom_content pet">
            <span>도마뱀</span>
            <span>3 마리</span>
            </p>
            <p class="poom_content location">
            <span>서울특별시 강남구 남부순환로 2615</span>
            </p>
        </div>
        <button class="poom_list_btn"><i class="fas fa-ellipsis-h"></i></button>
        <div class="poom_footer_box">
            <ul>
                <li><button class="poom_list_update" onclick="location='/poom/update/8'">수정</button></li>
                <li><button class="poom_list_copy">복사</button></li>
                <li><button class="poom_list_delete">삭제</button></li>
            </ul>
        </div>
        <div class="request_result_popup"><h3>'<strong>도마뱀을 돌봐주는</strong>'를 <br>복사했습니다.</h3></div>
    </div><!--//poom_list_inner -->
    <div class="poom_list_inner">
        <div class="poom_head_box">
            <img src="/img/poom/jieun.jpg" class="poom_main"/>
        </div>
        <div class="poom_content_box">
            <p class="poom_content title">
            <span>조용하고 느리지만 빠른 지금이의 거북이 하우스</span>
            </p>
            <p class="poom_content pet">
            <span>거북이</span>
            <span>15 마리</span>
            </p>
            <p class="poom_content location">
            <span>경기도 성남시 수정구 수진동 수정로 2</span>
            </p>
        </div>
        <button class="poom_list_btn"><i class="fas fa-ellipsis-h"></i></button>
        <div class="poom_footer_box">
            <ul>
                <li><button class="poom_list_update" onclick="location='/poom/update/4'">수정</button></li>
                <li><button class="poom_list_copy">복사</button></li>
                <li><button class="poom_list_delete">삭제</button></li>
            </ul>
        </div>
        <div class="request_result_popup"><h3>'<strong>거북이 하우스</strong>'를 <br>복사했습니다.</h3></div>
    </div><!--//poom_list_inner -->
</div><!--//myPoomListContentWrap -->
</div><!--//myPoomListSection -->
<c:import url="/WEB-INF/template/businessFooter.jsp"/>

<script>



    $(".poom_list_btn").on("click", function () {
        $(this).next().css("display","block");
    });//333 click end


    $(".poom_footer_box").on("click", ".poom_list_copy", function () {

        $(this).parents(".poom_footer_box").css("display", "none");

        let copy = $(this).parents(".poom_list_inner").clone();
        console.log(copy);

        $("#myPoomListContentWrap").append(copy);

        $(this).parents(".poom_footer_box").css("display","none");

        $(this).parents().next().fadeIn();

        setTimeout(function () {
            $(".request_result_popup").fadeOut();
            }, 1000);

    });//poom_list_copy click end


    $(".poom_footer_box").on("click", ".poom_list_delete", function () {
		let num = $("#myPoomListHeaderWrap span").text();
		$("#myPoomListHeaderWrap span").text(num-1);
        $(this).parents(".poom_list_inner").css("display","none");

    });//poom_list_delete click end

    
   

</script>
</body>
</html>