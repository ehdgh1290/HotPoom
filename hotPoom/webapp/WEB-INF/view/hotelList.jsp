<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/hotelList.css">
    <link rel="stylesheet" href="/css/bigCard.css">
    <link rel="stylesheet" href="/css/paginate.css">
    <style>
    	#autoComplete{
    		background:#fff;
    		min-height: 100px;
    		z-index: 1;
    		border: 1px solid #eee;
    		display: none;
    	}
    	#speciesList li{
    		background: #fff;
    		height: 30px;
    		line-height: 30px;
    	}
    	#speciesList li:hover{
    		cursor:pointer;
    		background-color: #eee;
    	}
    	#paginate{
    		right: 230px;
			bottom: 10px;
    	}
    	
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
    <div id="filterSection">
        <h3 class="screen_out">필터 선택</h3>
        <button id="datePickerBtn" class="btn test">날짜 선택</button>

        <button id="petTypeBtn" class="btn test">펫 종류</button>
        <button id="petNumBtn" class="btn test">마릿수</button>
        <button id="priceRangeBtn" class="btn test">가격</button>
        <button id="sortBtn" class="btn test">정렬순</button>
        <div id="sortInner" class="popup"><!--//정렬 누를때만 나옴-->
            <button id="gradeBtn" class="btn orderBtn order">평점순</button>
            <button id="higtPriceBtn" class="btn orderBtn">높은 가격순</button>
            <button id="lowPriceBtn" class="btn orderBtn">낮은 가격순</button>
        </div><!--//sortInner-->
        <div id="datePickerPopup" class="popup">
            <div class="tui-datepicker-input tui-datetime-input tui-has-focus end">
                <input id="endpicker-input" type="text" aria-label="Date" style="display: none">
                <span class="tui-ico-date"></span>
                <div id="endpicker-container" style="margin-left: -1px;"></div>
            </div><!--//end-->
            <div class="tui-datepicker-input tui-datetime-input tui-has-focus start">
                <input id="startpicker-input" type="text" aria-label="Date" style="display: none">
                <span class="tui-ico-date"></span>
                <div id="startpicker-container" style="margin-left: -1px;"></div>
            </div><!--//start-->
            <button id="datePickerCloseBtn" class="btn">확 인</button>
        </div><!--//datePickerPopup-->
        <div id="petTypePopup" class="popup">
            <input id="petTypeInput"/>
            <div id="autoCompleteWrap">
            	<ul id="speciesList">
            	</ul>
            </div>
            <button id="petTypeCloseBtn" class="btn" >확 인</button>
        </div><!--//petTypePopup-->
        <div id="petNumPopup" class="popup">
            <button id="minusBtn" class="btn"><i class="fas fa-minus"></i></button>
            <input id="petNumInput"/>
            <button id="plusBtn" class="btn"><i class="fas fa-plus"></i></button>
            <button id="petNumCloseBtn" class="btn">확 인</button>
        </div><!--//petNumPopup-->
        <div id="priceRangePopup" class="popup">
            <input id="lowestPriceInput" /> <span>-</span> <input id="highestPriceInput" />
            <span id="lowestWon" class="won">&#8361;</span><span id="highestWon" class="won">&#8361;</span>
            <button id="priceRangeCloseBtn" class="btn">확 인</button>
        </div><!--//priceRangePopup-->
    </div><!--//filterSection-->
    <div id="hotelListSection"><!--//호텔리스트, 지도, 페이징-->
        <div id="hotelListWrap"><!--//호텔리스트-->




        </div><!--//hotelListWrap-->
        <div id="map"></div><!--//map-->
        <div id="paginate">
            
        </div><!--//paginate-->
    </div><!--//hotelListSection-->
<%--<c:import url="/WEB-INF/template/footer.jsp"/> --%>
 <script type="text/template" id="hotelListTmp">
<@ _.each(poomList, function(poom) { @>
<div class="big_card_content" data-lat="<@=poom.lat@>" data-lng="<@=poom.lng@>" data-no="<@=poom.no@>" data-price="<@=poom.price@>">
    <div class="photo_content">
        <ul class="photo_box">
            <@ _.each(poom.poomPhotos, function(photo) { @>
                <li class="poom_photo">
                    <img src="/img/poom/<@=photo.img@>" width="248px" height="248px"/>
                </li><!--//poom_photo-->
            <@})@>
        </ul><!--//photo_box-->
    </div><!--//photo_content-->
    <div class="photo_cover">
        <i class="photo_card_btn prev_photo fas fa-chevron-left" data-length="5"></i>
        <i class="photo_card_btn next_photo fas fa-chevron-right" data-length="5"></i>
    </div><!--//photo_cover-->
    <div class="poom_content">
        <a class="poom_name" href=""><i class="fas fa-home"></i> <@=poom.title@></a>
        <a class="poom_address" href=""><@=poom.mainAddress@></a>
        <a class="poom_animal" href=""><@=poom.speciesName@> <@=poom.petCnt@>마리 </a>
        <p class="poom_star"><i class="fas fa-star"></i> <@=poom.score@> (<@=poom.count@>)</p>
        <p class="poom_price">￦ <@=poom.price@> / 박</p>
		<c:if test="${loginUser!=null }">
        	<div class="poom_bookmark" style="background-image: url('/img/<@=poom.hasBookmark@>')"></div>
		</c:if>
    </div><!--//poom_content-->
</div><!--//big_card_content-->
<@})@>
</script><!--//hotelListTmp-->
<script type="text/template" id="speciesListTmp">
<@_.each(speciesList, function(species){@>
	<li class="speciesItem"><input type="hidden" value="<@=species.no@>" id="speciesNo"/><@=species.name@></li>
<@})@>
</script>
<script>
    /********************* 동호 *********************************/

    /* datePicker API 관련 start */
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
        language:'ko',
        showAlways: true
    });//datePicker
    const startPicker = picker.getStartpicker();
    const endPicker = picker.getEndpicker();

    const $start = $(".start");


    picker.on("change:start",function () {
        console.log("change:start");
        $start.hide();

    })
    picker.on("change:end",function () {
        console.log("change:end");
    })
    /* datePicker API 관련 end */

    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    let hotelListTmp = _.template($("#hotelListTmp").html());

    const $datePickerPopup = $("#datePickerPopup");
    const $datePickerCloseBtn = $("#datePickerCloseBtn");
    const $datePickerBtn = $("#datePickerBtn");
    const $petTypeCloseBtn = $("#petTypeCloseBtn");
    const $petTypePopup = $("#petTypePopup");
    const $petTypeBtn = $("#petTypeBtn");
    const $petTypeInput = $("#petTypeInput");
    const $petNumPopup = $("#petNumPopup");
    const $petNumInput = $("#petNumInput");
    const $petNumBtn = $("#petNumBtn");
    const $petNumCloseBtn = $("#petNumCloseBtn");
    const $plusBtn = $("#plusBtn");
    const $minusBtn = $("#minusBtn");
    const $priceRangePopup = $("#priceRangePopup");
    const $priceRangeBtn = $("#priceRangeBtn");
    const $priceRangeCloseBtn = $("#priceRangeCloseBtn");
    const $lowestPrice = $("#lowestPriceInput");
    const $highestPrice = $("#highestPriceInput");
    const $sortBtn = $("#sortBtn");
    const $sortInner = $("#sortInner");
    const $sortInnerBtns = $("#sortInner .btn");
    const $map = $("#map");
    const $gradeBtn = $("#gradeBtn");
    let $hotelListWrap = $("#hotelListWrap");
    const $paginate = $("#paginate");
    const $hotelListSection = $("#hotelListSection");

    //필터팝업 안의 값들
    let startDate;
    let endDate;
    let petType;
    let petNum=0;
    let lowestPrice = 0;
    let highestPrice = 0;
    let sort = 0;
    

    let left;


    //$map.css("width",window.innerWidth-720);



    //날짜선택 버튼을 눌렀을 때 팝업 보여줌
    $datePickerBtn.on("click",function () {
        $(".popup").not($datePickerPopup).hide();
        $datePickerCloseBtn.show();
        picker.setStartDate(today);
        picker.setEndDate(today);
        $start.show();
        $datePickerPopup.slideToggle(100);
    })//$datePickerBtn click end

    //날짜선택 팝업에서 확인을 눌렀을 때 팝업 사라짐
    $datePickerCloseBtn.on("click",function () {
    	$("#datePickerBtn").addClass("filter");
        $(this).hide();
        
        startDate = startPicker.getDate();
        endDate = endPicker.getDate();
        $datePickerBtn.text(moment(startDate).format("M월 D일 ~ ") + moment(endDate).format("M월 D일"));
        $datePickerPopup.slideToggle(100);
    });//$datePickerCloseBtn click end

    //펫종류 버튼을 눌렀을 때 팝업 보여줌
    $petTypeBtn.on("click", function () {
        $(".popup").not($petTypePopup).hide();
        left = $(this).position().left;
        $petTypePopup.css("left",left+"px");
        $petTypeInput.text("").focus();
        $petTypePopup.slideToggle(100);
    });//$petTypeBtn click end
    
    $petTypeInput.on("keyup", function(){
    	petType=$(this).val();
    	if(petType!=null){
    		getSpeciesList(petType);
    	}//if end
    });//$petTypeInput keyup end
    
    let speciesNo = 0;
    //자동완성클릭이벤트
    $("#speciesList").on("click", ".speciesItem", function(){
    	petType=$(this).text();
    	speciesNo = $(this).find("input").val();
    	$petTypeInput.val(petType);
    	$("#autoCompleteWrap").hide();
    	$("#petTypeCloseBtn").show();
    });//.speciesItem click end

    //펫종류 팝업에서 확인을 눌렀을 때 팝업 사라짐
    $petTypeCloseBtn.on("click",function () {
    	$("#petTypeBtn").addClass("filter");
        if(petType.length>0 && petType!="") {
            $petTypeBtn.text(petType);
        }//if end
        $petTypePopup.slideToggle(100);
        $(this).hide();
        page=1;
        getPoomList();
    })//$petTypeCloseBtn click end
    let speciesListTmp = _.template($("#speciesListTmp").html());
    
    //펫 목록 받아오는 아작스
    function getSpeciesList(name){
    	
    	$.ajax({
    		url:"/ajax/poom/species/"+name,
    		
    		dataType:"json",
    		type:"get",
    		error: function(){
    			alert("종류받아오기에러");
    		},
    		success: function(json){
    			$("#speciesList").html(speciesListTmp({"speciesList":json.speciesList}));
    			$("#autoCompleteWrap").show();
    		}//success end
    	});//ajax end
    };//getSpeciesList end

    //마릿수 버튼을 눌렀을 때 팝업 보여줌
    $petNumBtn.on("click", function () {
        $(".popup").not($petNumPopup).hide();
        left = $(this).position().left;
        $petNumPopup.css("left",left+"px");
        $petNumInput.val("1");
        petNum = 1;
        $petNumPopup.slideToggle(100);
    });//$petTypeBtn click end

    //마릿수 팝업에서 확인을 눌렀을 때 팝업 사라짐
    $petNumCloseBtn.on("click",function () {
        petNum = $petNumInput.val();
        $("#petNumBtn").addClass("filter");
        if(petNum>0) {
            $petNumBtn.text(petNum+" 마리");
        }//if end
        getPoomList();
        $petNumPopup.slideToggle(100);
    })//$petTypeCloseBtn click end

    //+를 눌렀을 때
    $plusBtn.on("click", function () {
        petNum++;
        $petNumInput.val(petNum);
    })//$plusBtn click end

    //-를 눌렀을 때
    $minusBtn.on("click", function () {
        petNum--;
        if(petNum < 1) {
            petNum = 1;
        }//if end
        $petNumInput.val(petNum);
    })//$plusBtn click end

    //가격 버튼을 눌렀을 때 팝업 보이기
    $priceRangeBtn.on("click",function () {
       	$(".popup").not($priceRangePopup).hide();
        left = $(this).position().left;
        $priceRangePopup.css("left",left+"px");
        //$lowestPrice.val();
        lowestPrice = 0;
        //$highestPrice.val();
        highestPrice = 0;
        $priceRangePopup.slideToggle(100);
    })//$priceRangeBtn click end

    let priceRegexp = /^[0-9]+$/;
    $("#priceRangePopup input").on("keyup", function(){
    	let price = $(this).val();
    	if(!priceRegexp.test(price)){
    		$(this).val("").focus();
    	}
    });//price input keyup end
    
    //가격 팝업의 확인 버튼을 눌렀을 때 팝업 숨기기
    $priceRangeCloseBtn.on("click", function () {
    	$("#priceRangeBtn").addClass("filter");
        lowestPrice = $lowestPrice.val();
        highestPrice = $highestPrice.val();
        console.log("시작");
        console.log("low: "+lowestPrice);
        console.log("high: "+highestPrice);
        if(lowestPrice>0 || highestPrice>0) {
            console.log(1); 
            if(highestPrice>lowestPrice) {
            console.log(2);
                highestPrice = lowestPrice;
            }//if end
            console.log("low2: "+lowestPrice);
            console.log("high2: "+highestPrice);
            $priceRangeBtn.html("&#8361;"+lowestPrice+" ~ &#8361;"+highestPrice);
        }//if end
        $priceRangePopup.slideToggle(100);
        getPoomList();
    })//$priceRangeCloseBtn click end

    //정렬버튼을 눌렀을 때 보이기
    $sortBtn.on("click", function () {
        $(".popup").not($sortInner).hide();
        left = $(this).position().left;
        $sortInner.css("left",left+"px");
        $sortInner.slideToggle(100);
    })//$sortBtn click end

    //정렬팝업 안의 버튼을 눌렀을 때
    $sortInnerBtns.on("click",function () {
        $sortBtn.text($(this).text());
        $sortInner.slideToggle(100);
    })//$sortInnerBtns click end

    //평점순을 눌렀을 때
    $gradeBtn.on("click",function () {
        sort = 0;
        $("#sortBtn").addClass("filter");
        $(".order").not($(this)).removeClass("order");
        $(this).addClass("order");
        getPoomList()
    })//$gradeBtn click end

    $("#higtPriceBtn").on("click",function () {
        sort = 1;
        $("#sortBtn").addClass("filter");
        $(".order").not($(this)).removeClass("order");
        $(this).addClass("order");
        getPoomList()
    })//$priceBtn click end
    
    $("#lowPriceBtn").on("click",function () {
        sort = 2;
        $("#sortBtn").addClass("filter");
        $(".order").not($(this)).removeClass("order");
        $(this).addClass("order");
        getPoomList()
    })//$priceBtn click end

    let page = 1;
    $("#paginate").on("click","a",function(e){
		e.preventDefault();
		
		page = this.dataset.no;
		
		getPoomList();
		
	});//click() end
	
	let positions = []; //지도에 넣기 위한 배열
    let bounds = new kakao.maps.LatLngBounds();
	
	let overlays = [];
	let markers = [];
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 ,// 지도의 확대 레벨
        scrollwheel :false
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	
	
	$("#test").on("click",function() {
		$(overlays).each(function() {
			this.setMap(null);
		
		});
		
		$(markers).each(function() {
			this.setMap(null);
		
		});
		
		overlays = [];
		markers = [];
		
	})
	
    
    //hotelList 가져오기
    function getPoomList() {
        $.ajax({
            url: '/ajax/poom/page/'+page,
          	data:{
				speciesNo:speciesNo,
				petCnt:petNum,
				lowPrice:lowestPrice,
				highPrice:highestPrice,
				sort:sort
			},
            /*data: {
                "startDate":startDate,
                "endDate":endDate,
                "petType":petType,
                "petNum":petNum,
                "lowestPrice":lowestPrice,
                "highestPrice":highestPrice,
                "sort":sort
            },*/
            type: 'get',
            dataType:"json",
            error:function(xhr,error,code) {
                alert("점검중!");
            },//error end
            success: function(json){
                
            	console.log(json);
            	// 오버레이 마커 전부 리셋
            	$(overlays).each(function() {
        			this.setMap(null);
        		
        		});
        		
        		$(markers).each(function() {
        			this.setMap(null);
        		
        		});
        		
        		overlays = [];
        		markers = [];
        		
				positions = [];
        		
        		let bounds = new kakao.maps.LatLngBounds();
        		// 오버레이 마커 전부 리셋
        		
        		
        		
                
                $hotelListWrap.html(hotelListTmp({"poomList":json.poomList}));
                $paginate.html(json.paginate);
                
            	
            	// 마커 이미지의 이미지 주소입니다
                var imageSrc = "img/marker.png";
            	
                $(json.poomList).each(function(idx){
                	//alert(this.lat);
                	
                	let lat = this.lat;
                	let lng = this.lng;
                	
					positions.push({
						title:idx,
						latlng: new kakao.maps.LatLng(lat, lng)
					});//push end
					
					 const price = this.price;


			            // 마커 이미지의 이미지 크기 입니다
			            var imageSize = new kakao.maps.Size(60, 60);

			            // 마커 이미지를 생성합니다
			            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			           // let idx = positions[i].title;
			            var content = '<div class ="label" data-idx='+idx+' style="margin-top: -20px"><span class="left"></span><span class="center">'+price+'</span><span class="right"></span></div>';
			            // 커스텀 오버레이를 생성합니다
			            var customOverlay = new kakao.maps.CustomOverlay({
			                position: positions[idx].latlng,
			                content: content
			            });

			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker({
			                map: map, // 마커를 표시할 지도
			                position: positions[idx].latlng, // 마커를 표시할 위치
			                title : positions[idx].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			                image : markerImage // 마커 이미지
			            });

			            $(".label").attr('data-idx', idx);

			            bounds.extend(positions[idx].latlng);
			            customOverlay.setMap(map);
			            
			            markers.push(marker);
			            overlays.push(customOverlay);
					
					
                });//.big_card_content each end
                
                map.setBounds(bounds);
                
                //$map.css("height",$hotelListWrap.css("height"));

                
                //console.log(positions);
            }//success end
        });//ajax end
    }//getHotelList end
    getPoomList();
    
    
    

    $(window).on("click",function (e) {



        if($(e.target).hasClass("test")) {
        }else {
            //$(".popup").hide();
        }
    })//이거뭐야??



    /********************* 동호 *********************************/
</script>
</body>
</html>