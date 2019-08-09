<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="css/booking.css">
</head>
<body>
<c:if test="${loginUser==null }">
	<c:redirect url="/index"/>
</c:if>
<c:import url="/WEB-INF/template/header.jsp"/>
    <div id="reviewRegisterBg" class="bg">
        <div id="reviewRegisterPopup">
            <h3 class="screen_out">리뷰 등록</h3>
            <form id="reviewRegisterForm" action="/review" method="post">
            <input id="userNo" type="hidden" name="userNo" value="${loginUser.no }">
            <input id="bookingNo" type="hidden" name="bookingNo" value="">
            <input id="score" type="hidden" name="score" value="">
                <button type="button" class="close_popup far fa-times-circle"></button>
                <div id="poomImg" style='background-image:url("")'></div><!--사진-->
                <div id="poomName">TITLE</div>
                <div id="poomDate">DATE</div>
                <textarea id="poomTextarea" name="content" placeholder="리뷰를 입력해주세요."></textarea>
                <div id="poomGrade">
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                </div><!--//poomGrade-->
                <button type="submit" id="reviewRegisterBtn" class="btn">등록</button>
            </form>
        </div><!--//reviewRegisterPopup-->
    </div><!--//reviewRegisterBg-->

    <div id="bookingSection">
        <h2>예약 내역</h2>
        <ul id="cardList">
            <!-- bookingListTmp -->
        </ul>
        <div id="paginate"></div>
    </div><!--//bookingSection-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="bookingListTmp">
<@ _.each(bookingList, function(booking) { @>
<li class="card">
<@console.log(booking.endDay);@>
                <div class="poom_img" style='background-image:url("img/poom/<@=booking.img@>")'></div><!--사진-->
                <div class="name"><span class='type fas fa-<@=booking.poomType=="P"?"home":"building"@>'></span> <@=booking.poomTitle@></div>
                <div class="date"><@=moment(booking.startDay).format("MM.DD ~ ")@><@=moment(booking.endDay).format("MM.DD, YYYY")@></div>
                <@if(booking.userState=="D" && booking.hostState=="D"){@>
                        <div class="poom_type">예약확정</div>
                <@}else if(booking.userState=="C" && booking.hostState=="D"){@>
                        <div class="poom_type cancel">취소함</div>
                <@}else if(booking.userState=="D" && booking.hostState=="C"){@>
                        <div class="poom_type cancel">취소됨</div>
                <@}else {@>
                        <div class="poom_type finish">다녀감</div>
                <@}@>
                <div class="address"><@=booking.mainAddress@></div>
                <div class="pet"><@=booking.speciesName@> <@=booking.petCnt@>마리</div>
                <div class="message"><a href="/message/<@=booking.hostNo@>"><i class="fas fa-comment-dots"></i> 호스트에게 메세지</a></div>
                <div class="detail_link"><a href="/poom/<@=booking.poomNo@>">해당 품 상세 페이지 바로가기</a></div>
                <div class="price">&#8361; <@=Number(booking.price).toLocaleString('en').split(".")[0]@> / 박</div>
                <div class="btns_wrap">
                    <a href="/bill/<@=booking.no@>" class='bill_btn btn <@= booking.userState=="C" || booking.hostState=="C"?"disable":""@> <@=booking.userState=="F" && booking.hostState=="F"?"":"middle"@>'>예약 명세서</a>
                    <@if(booking.userState=="F" && booking.hostState=="F"){@>
                    <button class='review_btn btn <@=booking.isReview?"disable":""@>' data-no="<@=booking.no@>">리뷰 작성</button>
                    <@}@>
                </div><!--//btn_wrap-->
            </li>
<@})@>
</script><!--//bookingListTmp-->
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    /******************* 동호 *************************/
    let bookingListTmp = _.template($("#bookingListTmp").html());
    
    const $closePopup = $(".close_popup");
    const $reviewRegisterBg = $("#reviewRegisterBg");
    const $poomGrade = $("#poomGrade i");
    const $reviewBtn = $(".review_btn");
    const $poomImg = $("#poomImg");
    const $poomName = $("#poomName");
    const $poomDate = $("#poomDate");
    const $poomTextarea = $("#poomTextarea");
    const $reviewRegisterForm = $("#reviewRegisterForm");
    const $userNo = $("#userNo");
    const $bookingNo = $("#bookingNo");
    const $score = $("#score");
    const $cardList = $("#cardList");
    const $paginate = $("#paginate");
    let star = 0;
    let pageNo = 1;
    
    
    //예약 명세서가 회색이 되어있을 때 누르면
    $("body").on("click", ".bill_btn.disable",function(e){
    	e.preventDefault();
    });//.bill_btn.disable end

    //팝업에서 x를 눌렀을 때
    $closePopup.on("click",function () {
        $reviewRegisterBg.hide();
    })//close_popup click end

    //평점 클릭했을 때
    $poomGrade.on("click", function () {
        //누른 평점의 인덱스를 가져옴
        let index = $(this).index();
        //alert(index);
        star = index+1;

        //별 채우기 바꾸는 each문
        $.each($poomGrade,function () {
        $(this).removeClass("fas").addClass("far");
            if($(this).index()<=index){
                $(this).removeClass("far").addClass("fas");
            }//if end
        })//$poomGrade each end
    });//$poomGrade click end

    //리뷰 작성 완료
    $reviewRegisterForm.on("submit",function () {
        $score.val(star);
    })//$reviewRegisterForm end
    
    //리뷰 작성을 눌렀을 때
    $cardList.on("click",".review_btn", function () {
    	if($(this).hasClass("disable")) {
    		return false;
    	}
        let $currLi = $(this).parents("li");
        let img = $currLi.find(".poom_img").css("background-image");
        $bookingNo.val(this.dataset.no);
        //alert(img);

        //예약정보 가져오고 내용 초기화
        $poomImg.css("background-image",img);
        $poomName.text($currLi.find(".name").text());
        $poomDate.text($currLi.find(".date").text());
        $poomTextarea.val("");//textarea 초기화
        $poomGrade.removeClass("fas").addClass("far");//별 초기화

        $reviewRegisterBg.show();
    })//$reviewBtn click end
    
    //페이지 클릭
    $paginate.on("click","a",function(e){
    	e.preventDefault();
    	
    	pageNo = this.dataset.no;
    	getList();
    })//$paginate a click end
    
    //리스트 가져옴
    function getList() {
		$.ajax({
			url:"/ajax/booking",
			dataType:"json",
			type:"get",
			data:{
				"userNo":${loginUser.no},
				"pageNo":pageNo
			},
			error:function(){
				alert("점검중!!");
			},//error end
			success:function(data){
				console.log(data);
				$cardList.html(bookingListTmp({"bookingList":data.bookingList}));
				$paginate.html(data.paginate);
			}//success end
		})//ajax end
	}//getList end
	getList();

    /******************* 동호 *************************/
</script>
</body>
</html>