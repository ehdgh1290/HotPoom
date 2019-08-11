<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/bill.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
    <div id="billSection">
        <h1>예약 상세 내역</h1>
        <div id="bookingNum" class="booking_detail">
            <div class="title">예약번호</div>
            <p class="content">${bill.no }</p>
        </div><!--//bookingNum end-->
        <div id="poomMainImage" style="background-image: url(/img/poom/${bill.img})">
        </div><!--//poomMainImage end-->
        <div id="bookingTitle" class="booking_detail">
            <div class="title">${bill.title }</div>
            <p class="content"><fmt:formatDate value="${bill.startDay }" pattern="MM.dd ~ "/><fmt:formatDate value="${bill.endDay}" pattern="MM.dd , "/>${bill.year }</p>
        </div><!--//bookingTitle end-->
        <div id="bookingDate" class="booking_detail">
            <div class="title">체크인
                <p class="content"><fmt:formatDate value="${bill.startDay }" pattern="MM월 dd일"/> ${bill.checkIn }:00</p>
            </div>
            <div id="checkOut" class="title">체크아웃
                <p class="content"><fmt:formatDate value="${bill.endDay }" pattern="MM월 dd일"/> ${bill.checkOut }:00</p>
            </div>
        </div><!--//bookingDate end-->
        <div id="bookingPet" class="booking_detail">
            <div class="title">펫</div>
            <p id="species" class="content">${bill.speciesName }</p>
            <p id="animalNum" class="content">${bill.petCnt }마리</p>
        </div><!--//bookingPet end-->
        <div id="bookingAddress" class="booking_detail">
            <div class="title">주소</div>
            <p class="content">${bill.main } ${bill.sub }</p>
            <div id="kakaoMap"></div>
        </div><!--//bookingAddress end-->
        <div id="bookingRule" class="booking_detail">
            <div class="content">
   				${bill.introduce }
            </div>
        </div><!--//bookingRule end-->
        <div id="bookingRequest" class="booking_detail">
            <div class="title">요청 사항</div>
            <div class="content">
                ${bill.request }
            </div>
        </div><!--//bookingRequest end-->
        <div id="bookingCharge" class="booking_detail">
            <div class="title">청구액</div>
            <div id="payout">
                <p class="content"><fmt:formatNumber value="${bill.price }"/>원	 X ${bill.night }박</p>
                <p class="content charge"><fmt:formatNumber value="${bill.nightPrice }"/> 원</p>
            </div>
            <div id="fees">
                <p class="content">서비스 수수료</p>
                <p class="content charge"><fmt:formatNumber value="${bill.web }"/> 원</p>
            </div>
            <div id="totalAmount">
                <p class="content">총 금액</p>
                <p class="content charge"><fmt:formatNumber value="${bill.total }"/> 원</p>
            </div>
        </div><!--//bookingCharge end-->
        <div id="payment" class="booking_detail">
            <div class="title">결제</div>
            <p class="content">${bill.bank }</p>
            <p id="accountNum" class="content">${bill.creditNum }</p>
            <div id="totalPayment">
                <p class="content">총 지불 금액</p>
                <p class="content charge"><fmt:formatNumber value="${bill.total }"/>원</p>
            </div>
        </div><!--//bookingCharge end-->
        <button id="cancelBtn" class="btn cancel" type="button">예약 취소</button>
        <button id="checkBtn" class="btn cancel" type="button">확인</button>
    </div><!--//billSection end-->
<div id="cancelBg">
    <form id="cancelForm" action="/cancel/booking" method="post">
    <input type="hidden" name="_method" value="put"/>
    <input type="hidden" name="bookingNo" value="${bill.no }"/>
    <input type="hidden" name="userNo" value="${bill.userNo}"/>
        <div id="cancelPopup">
            <div id="cancelHeader">
                <h1 id="cancelTitle">예약 취소</h1>
                <div class="cancel_popup_close"><i class="far fa-times-circle"></i></div>
                <div id="canceledPerson">취소자 : ${bill.userName }</div>
            </div>
            <div id="cancelContent">
                <label class="choice_reason" for="reasonCancellation"><textarea id="reasonCancellation" name="reason" placeholder="취소 사유를 입력해주세요."></textarea></label> 
            </div>
            <!--//cancelContent-->

            <div id="cancelFooter">
                <button id="cancelSubmitBtn" class="btn cancel">예약취소</button>
            </div>
            <!--//cancelFooter-->
        </div>
        <!--//cancelPopup -->
    </form>
	</div> <!--// cancelBg end-->
<%-- <c:import url="/WEB-INF/template/footer.jsp"/> --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6db99cd7e5f31e243798911919c063c0"></script>
<script>

	/***********************예약 취소******************************/
	$("#cancelForm").on("submit", function () {
		
		if($("#reasonCancellation").val() == "") {
			
			$("#reasonCancellation").focus();
			return false;
		}//if end
	});//cancelSubmitBtn submit end




	/**************************************************예약취소*********************************************************/
	$("#cancelBtn").on("click", function () {
		
		$("#cancelBg").css("display","block");
		$("#cancelPopup").css("display","block");
		
	});//cancelBtn click end
	
	
	$(".cancel_popup_close").on("click", function () {
		
		$("#cancelBg").css("display","none");
		$("#cancelPopup").css("display","none");
		
	});//cancel_popup_close click end
	
	/**************************************************예약취소*********************************************************/
	
	


    //*************카카오맵***********************************************************
    var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.4809615, 126.9521689), // 지도의 중심좌표
            level: 4, // 지도의 확대 레벨,

            //지도 확대축소 막고싶으면
            scrollwheel :false,
            draggable:false
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var imageSrc = "/img/marker.png", // 마커이미지의 주소입니다
        imageSize = new kakao.maps.Size(100, 100), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(37.4809615, 126.9521689); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    //****************************카카오맵*****************************************

    $("#headerProfileImage").click(function (e) {
        $("#lnb").slideToggle(200);
        e.stopPropagation();
    });

    $("#headerLogin").click(function () {
        $("#gnbWrap").show();
        $(this).hide();
    });

    $("body").click(function () {
        $("#lnb").hide();
    });
    
    
    /* function getCredit() {
    	
    	//$.ajax();
    	
    	//success
    	
    	$("#accountNum").text("200,000,000,0")
    	
    	
    }
    
    getCredit(); */

</script>
</body>
</html>