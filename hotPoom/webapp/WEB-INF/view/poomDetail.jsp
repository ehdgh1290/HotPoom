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
    <link rel="stylesheet" href="/css/poomPhotoDetail.css">
    <link rel="stylesheet" href="/css/paymentPopup.css">
    <link rel="stylesheet" href="/css/poomDetail.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<c:import url="/WEB-INF/template/paymentPopup.jsp"/>
    <div id="poomDetailSection">
        <div id="poomMainImage" style="background-image: url(/img/poom/${poom.mainImg})">
        </div><!--//poomMainImage end-->
        <button id="viewPhotosBtn" type="button" class="btn">View Photos</button>
        <div id="poomDetailWrap">
            <h2>${poom.title}</h2>
            <div id="poomAddress">${poom.mainAddress }</div>
            <div id="hostUserProfile">
                <a href="/user/${poom.userNo }"><img id="hostUserProfileImage" src="/profile/user/${poom.hostImg }"/></a>
                <div id="hostUserName">
                    <a href="/user/${poom.userNo }">${poom.hostName }</a>
                </div>
                <div id="sendMessage" class="btn"><a href="/message/${poom.userNo }">호스트에게 연락하기</a></div>
            </div>
            <div id="poomInformationInner">
                <h3>기본 정보</h3>
                <div class="little_title"><i class="far fa-clock"></i> 체크인 ${poom.checkIn }:00 ~ 체크아웃 ${poom.checkOut }:00</div>
                <c:if test="${!petList.isEmpty() }">
	                <div class="little_title"><i class="fas fa-check"></i> 호스트가 소유중인 펫</div>
	                <div id="hostUserPet">
		                <c:forEach items="${petList }" var="pet">
		                	<img class="hostPetProfileImage" src="/profile/pet/${pet.profileImg }">
		                </c:forEach>
	                </div>
                </c:if>
                <div class="little_title"><i class="fas fa-check"></i> 수용 가능 펫</div>
                <p>${poom.speciesName } ${poom.petCnt }마리</p>
                <div class="little_title"><i class="fas fa-check"></i> 편의시설</div>
                <p id="poomAmenity">${poom.amenity }</p>
            </div><!--//poomInformationInner end-->
            <div id="poomIntroduceInner">
                <h3>품 소개</h3>
                <div class="little_title"><i class="far fa-building"></i> 건물 유형 : ${poom.type.equals("P")?"House":"Hotel" }</div>
                <div class="little_title"><i class="fas fa-check"></i> 소개 및 주의사항</div>
                <div id="poomIntroduceDetail">${poom.introduce }</div>
            </div><!--//poomIntroduceInner end-->
            <div id="reviewInner">
                <h3>리뷰</h3>
                <div id="grade"><i class="fas fa-star"></i> ${poom.avgScore }(${poom.reviewCnt })</div>
                <div class="review_card">
                    <ul>
                    <!-- reviewListTmp -->
                    </ul>
                    <div id="paginate"></div>
                </div>
            </div><!--//reviewInner end-->
            <div id="poomMapWrap">
                <h3>위치 정보</h3>
                <div id="kakaoMap"></div>
                <div class="little_title"><i class="fas fa-check"></i> 교통편</div>
                <div id="transportation">${poom.transport }</div>
            </div><!--//map end-->
        </div><!--//poomDetailWrap end-->
        <div id="bookingWrap">
            <form id="bookingDetail">
                <div id="price">₩ <span id="dayPrice">${poom.price }</span> / 박</div>
                <div id="bookingDate">
                    날짜
                    <br/>
                    <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                        <input id="startpicker-input" type="text" aria-label="Date" autocomplete="off" placeholder="체크인">
                        <span class="tui-ico-date"></span>
                        <div id="startpicker-container" style="margin-left: -1px;"></div>
                    </div>
                    <span id="arrow"><i class="fas fa-arrow-right"></i></span>
                    <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                        <input id="endpicker-input" type="text" aria-label="Date" autocomplete="off" placeholder="체크아웃">
                        <span class="tui-ico-date"></span>
                        <div id="endpicker-container" style="margin-left: -1px;"></div>
                    </div>
                </div><!--//bookingDate end-->
                <div id="petCount">
                    맡길 펫 마리 수
                    <input id="count" type="number" min="1" max="1000" value="1">
                </div>
                <div id="bookingPrice">
                    <div>₩ <span>15,000</span> x
                        <span id="dayCount"></span>박 x
                        <span id="petCnt">1</span>마리
                        <span id="priceCount"></span>
                    </div>
                    <div>서비스 수수료
                        <span id="fees"></span>
                    </div>
                    <div id="totalPrice">총액
                        <span id="totalAmount"></span>
                    </div>
                </div>
                <button id="bookingBtn" class="btn" type="submit">예약하기</button>
            </form>
        </div><!--//bookingWrap end-->
    </div><!--//poomDetailSection end-->
    <div id="poomBg">
        <div id="poomPhotoDetail">
            <div id="poomPhotoSection">
                <img id="poomPhoto" src="">
                <div id="poomPhotoBtnWrap">
                    <div id="prevBtn" class="poom_photo_btn"><i class="fas fa-chevron-left"></i></div>
                    <div id="nextBtn" class="poom_photo_btn"><i class="fas fa-chevron-right"></i></div>
                </div>
            </div><!--//poomPhotoSection-->
            <div id="poomInfoSection">
                <i class="far fa-times-circle cursor_pointer"></i>
                <div id="poomPhotoListWrap">
                    <ul id="poomPhotoListInner">
                    <c:forEach items="${photoList }" var="photo">
                        <li class="poom_photo">
                            <img src="/img/poom/${photo.img }" width="64px" height="64px" alt="${photo.caption }">
                        </li>
                    </c:forEach>
                    </ul><!--//poomPhotoListBox-->
                    <div class="poom_photo_list_cover"></div>
                    <div class="poom_photo_list_cover"></div>
                </div><!--//poomPhotoListInner-->
                <p id="poomCntWrap"><span id="poomCntNow">1</span>/<span id="poomCnt"></span></p>
                <p id="poomInfo"></p>
            </div><!--//poomInfoSection-->
        </div><!--//poomPhotoDetail-->
    </div><!--//poomBg-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="reviewListTmp">
<@if(reviewList.length==0){@>
<li>
    <div id="reviewNone">
        아직 등록된 리뷰가 없습니다 <i class="far fa-sad-cry"></i>
    </div>
</li>
<@};@>
<@_.each(reviewList,function(review){@>
<li>
    <div class="review_card_content"><@=review.content@></div>
    <div class="review_card_img"><img src="/profile/user/<@=review.profileImg@>"/></div>
    <div class="review_card_user_name"><@=review.userName@></div>
    <div class="review_card_date"><@=moment(review.regdate).format("YYYY.MM)@></div>
    <div class="review_card_warning" data-no="<@=review.no@>">신고</div>
</li>
<@});@>
</script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
let reviewListTmp = _.template($("#reviewListTmp").html());

	const $reviewCard = $(".review_card");
	const $paginate = $("#paginate");
	
	
	let pageNo = 1;

	$reviewCard.on("click","paginte a",function(){
		
	});//paginte a click end
	
	
	//리뷰리스트 불러옴
	function getReviewList() {
		$.ajax({
			url:"/ajax/review",
			type:"get",
			dataType:"json",
			data: {
				"pageNo":pageNo,
				"no":${poom.no}
			},
			error:function(){
				alert("점검중!!");
			},//error end
			success:function(data){
				$reviewCard.html(reviewListTmp({reviewList:data.reviewList}));
				$paginate.html(data.paginate);
			}//success end
		});//ajax end
	};//getReviewList end



    //*************카카오맵***********************************************************
    var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(${poom.lat}, ${poom.lng}), // 지도의 중심좌표
            level: 4, // 지도의 확대 레벨,

            //지도 확대축소 막고싶으면
            scrollwheel :false,
            draggable:true
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var imageSrc = "/img/marker.png", // 마커이미지의 주소입니다
        imageSize = new kakao.maps.Size(100, 100), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(${poom.lat}, ${poom.lng}); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    //****************************카카오맵*****************************************
    //****************************사이드바*****************************************

    //사이드바 움직이게하는 부분
    let $window = $(window);//윈도우객체(BOM)
    let $bookingDetail = $("#bookingDetail");

    $window.on("scroll",function () {
        //스크롤탑
        let sTop = $window.scrollTop();
        if(sTop>=730) {
            $bookingDetail.css({
                position: "fixed",
                top:"20px"
            });
        }else {
            $bookingDetail.css({
                position: "relative"
            });
        }//if~else end
    });//on() end

    //달력부분
    let today = new Date();
    const picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: null,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: null,
            input: '#endpicker-input',
            container: '#endpicker-container'
        },
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ],
        language:'ko'
    });


    //가격 자동 계산 부분
    let $dayCount = $("#dayCount");
    let $count = $("#count");
    let $petCnt = $("#petCnt");
    let $priceCount = $("#priceCount");
    let $dayPrice = $("#dayPrice");
    let $fees = $("#fees");
    let $totalAmount = $("#totalAmount");

    //날짜
    picker.on('change:end', getTotalAmount);
    //마리 수
    $count.on('change', function(){
    	if($("#endpicker-input").val()>0) {
	    	getTotalAmount();
    	}
    });//$count change end

  	//가격계산
    function getTotalAmount() {
        let checkInVal = $("#startpicker-input").val();
        let checkOutVal = $("#endpicker-input").val();
        let checkIn = moment(checkInVal);
        let checkOut = moment(checkOutVal);
        let date = checkOut.diff(checkIn, 'days');
        $dayCount.text(date);

        let petCnt = $count.val();
        $petCnt.text(petCnt);


        let priceCount = 15000*date*petCnt;
        $priceCount.text(priceCount.toLocaleString());

        let fees = (15000*date*petCnt)/10;
        $fees.text(fees.toLocaleString());

        let totalPrice = priceCount+fees
        $totalAmount.text(totalPrice.toLocaleString());

    };//getTotalAmount end


	$reviewInner = $("#reviewInner");
    
    //리뷰에서 신고하기를 눌렀을 때
	$reviewInner.on("click",".review_card_warning", function() {
		const reviewNo = this.dataset.no;
		
	});//.review_card_warning click end
    
    /*----------------------------------팝업----------------------------------------*/
    //버튼클릭하면 팝업 열림
    $("#viewPhotosBtn").on("click",function () {
        $("#poomBg").show();
    });


    // 불러온 사진 갯수
    let poomPhotoLength = $(".poom_photo").length;
    console.log("사진갯수:"+poomPhotoLength);
    let photoIdx = 1;
    //let photoX = 0;
     photoX = 0;
    let $poomPhotoListInner = $("#poomPhotoListInner");
    // 사진 갯수에 따른 photo_box의 left 한계값
    //let poomPhotoLeft = 0;
     poomPhotoLeft = 0;

    //poom사진 height 변경
    function changePoomPhotoSize() {

        /*        let poomWidth = $("#poomPhoto").css("width");

                poomWidth = poomWidth.substring(0, poomWidth.length - 2);

                console.log("width: " + poomWidth);*/

        //poom width 고정
        $("#poomPhoto").attr("width", 800);

        //pomm height 값
        let poomHeight = $("#poomPhoto").css("height");

        poomHeight = poomHeight.substring(0, poomHeight.length);

        console.log("height: " + poomHeight);

        // poom btn, section height값 조정
        /*$(".poomPhotoBtn").css("height", poomHeight);*/
        $("#poomPhotoSection").css("height", poomHeight);

        if (poomHeight >= 600) {
            $("#poomPhoto").attr("height", 600);
            $(".poomPhotoBtn").css("height", 600);
            $("#poomPhotoSection").css("height", 600);
        }//if() end

        console.log(-(parseInt(poomHeight) + 100)/2);

        /*$("#poomPhotoDetail").css("margin-top", -parseInt(poomHeight)/2);*/

    }//changePoomPhotoSize() end

    changePoomPhotoSize();



    //poom 사진리스트 길이
    function getPhotoListWidth() {

        poomPhotoLeft = poomPhotoLength * 80 + 19;

        $poomPhotoListInner.css("width",poomPhotoLeft);

        // 사진 전체갯수
        $("#poomCnt").text(poomPhotoLength);
    }

    getPhotoListWidth();

    /*-----------------------------사진 디테일--------------------*/



    // 이전사진 버튼
    $("#prevBtn").on("click", function () {

        photoX = -40 -(photoIdx - 4) * 80;

        if(photoIdx == 1) {
        } else if(photoIdx == 2) {
            photoIdx -= 1;
        } else if(photoIdx == 3) {
            photoIdx -= 1;
            photoX = 0 ;
            $poomPhotoListInner.css("left", photoX);
            console.log(photoX);
        } else if(photoIdx == poomPhotoLength - 1) {
            photoIdx -= 1;
            $poomPhotoListInner.css("left", photoX);
            console.log(photoX);
        } else if (photoIdx == poomPhotoLength) {
            photoIdx -= 1;
        } else if(photoIdx <= poomPhotoLength - 2) {
            photoIdx -= 1;
            $poomPhotoListInner.css("left", photoX);
            console.log(photoX);

        }//if()~else() ens

        changePoomInfo();
    });//prev_photo click() end

    // 다음사진 버튼
    $("#nextBtn").on("click", function () {

        photoX = -40 -(photoIdx - 2) * 80;

        if(photoIdx == 1) {
        	if(poomPhotoLength != 1) {
	            photoIdx += 1;
        	}//if end
            changePoomInfo();
        } else if(photoIdx == 2) {
        	if(poomPhotoLength != 2) {
	            photoIdx += 1;
	            photoX = -40 ;
	            $poomPhotoListInner.css("left", photoX);
	            console.log(photoX);
        	}//if end
            changePoomInfo();
        } else if(photoIdx == poomPhotoLength - 2) {
            photoIdx += 1;
            photoX += 40;
            $poomPhotoListInner.css("left", photoX);
            console.log(photoX);
            changePoomInfo();
        } else if(photoIdx == poomPhotoLength - 1) {
            photoIdx += 1;
            changePoomInfo();
        } else if (photoIdx == poomPhotoLength) {
            changePoomInfo();
        } else if(photoIdx >= 3) {
            photoIdx += 1;
            $poomPhotoListInner.css("left", photoX);
            console.log(photoX);
            changePoomInfo();
        }//if()~else() ens

    });//next_photo click() end

    // photoIdx에 따른 정보 변화
    function changePoomInfo() {

        if(photoIdx >= 3 && photoIdx <= poomPhotoLength - 2) {
            $(".poom_photo_list_cover").show();
        } else {
            $(".poom_photo_list_cover").hide();
        }

        $(".poom_photo").removeClass("on");
        $(".poom_photo").eq(photoIdx - 1).addClass("on");

        $("#poomCntNow").text(photoIdx);

        $("#poomInfo").text($(".poom_photo").eq(photoIdx-1).children().attr("alt"));
        $("#poomPhoto").attr("src", $(".poom_photo").eq(photoIdx-1).children().attr("src"));

        changePoomPhotoSize();
    }//changePoomInfo() end

    changePoomInfo();

    //poom사진 클릭 시
    $(".poom_photo img").on("click", function () {

        photoIdx = $(this).parent().index() + 1;

        console.log("photoIdx: " + photoIdx);

        if(photoIdx == 1) {

            $poomPhotoListInner.css("left", 0);
            changePoomInfo();
        } else if(photoIdx == 2) {
            photoIdx = 2;
            console.log(photoX);
            $poomPhotoListInner.css("left", 0);
            changePoomInfo();
        } else if(photoIdx == 3) {
            photoX = -40;
            $poomPhotoListInner.css("left", photoX);
            console.log(photoX);
            changePoomInfo();
        } else if(photoIdx == poomPhotoLength - 2) {
            $poomPhotoListInner.css("left", ((photoIdx-3) * -80) - 40);
            changePoomInfo();
        } else if(photoIdx == poomPhotoLength - 1) {
            $poomPhotoListInner.css("left", (photoIdx-3) * -80);
            changePoomInfo();
        } else if (photoIdx == poomPhotoLength) {
            $poomPhotoListInner.css("left", (photoIdx-4) * -80);
            changePoomInfo();
        } else if(photoIdx >= 4) {
            photoX = -40 + ((photoIdx - 3) * -80);
            $poomPhotoListInner.css("left", photoX);
            changePoomInfo();
        }//if()~else() ens

    });//.poom_photo img() end

    $("#poomInfoSection .far").click("on", function () {
        $("#poomBg").hide();
    });//#poomInfoSection .fas click() end
    
    $bookingDetail = $("#bookingDetail");
    $bookingDetail.on("submit", function(e){
    	e.preventDefault();
    	$paymentBg.show();
    	
    });//예약 눌렀을 때
    /************************paymentPopup******************************/
    $creditCardAddPopupCloseBtn = $("#creditCardAddPopup .close_popup");
    $creditCardAddPopup = $("#creditCardAddPopup");
    $paymentPopupCLoseBtn = $("#paymentPopup .close_popup");
    $paymentPopup = $("#paymentPopup");
    $paymentBg = $("#paymentBg");
    $creditCardAddForm = $("#creditCardAddForm");
    $addCredit = $("#addCredit");


    $addCredit.on("click",function () {
        $creditCardAddPopup.show();
    });//$addCredit end

    //결제팝업 끄기 버튼
    $paymentPopupCLoseBtn.on("click",function () {
        $paymentBg.hide();
    });//$paymentPopupCLoseBtn end

    //결제카드추가 팝업 끄기 버튼
    $creditCardAddPopupCloseBtn.on("click",function () {
        $creditCardAddPopup.hide();
    });//$creditCardAddPopupCloseBtn end

    //결제카드추가 submit
    $creditCardAddForm.on("submit",function (e) {
        e.preventDefault();
        $creditCardAddPopup.hide();
    });//$creditCardAddForm end


    /************************paymentPopup******************************/
</script>
</body>
</html>