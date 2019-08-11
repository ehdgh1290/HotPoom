<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>userPage</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/userPage.css">
    <link rel="stylesheet" href="/css/userPetAddPopup.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>

<div id="addPetBg">
    <div id="petAddPopup">
        <h1>펫 추가하기</h1>
        <div class="popup_close"><i class="far fa-times-circle"></i></div>
        <form id="petAddPopupWrap" action="/pet" method="POST">
            <p>성별</p>
            <label class="cursor_pointer" for="male">수컷<input id="male" type="radio" name="gender" value="M" /></label>
            <label class="cursor_pointer" for="female">암컷<input id="female" type="radio" name="gender" value="F"/></label>
            <p>이름</p>
            <input id="petNameInput" name="name" value="" placeholder="펫의 이름을 입력해주세요."/>
            <p>사진</p>
            <div id="petImgBox"><img id="petImg" /></div>

            <label id="petAddPopupLabel">
            	<c:if test="${loginUser.no==userInfo.no}">
                <i class="fas fa-camera img_icon"></i>
                </c:if>
                <input id="petInput" class="pet_and_user_file" type="file" />
                <input type="hidden" id="petProfile" name="profileImg">
                <input type="hidden" id="userNo" name="userNo" value="${userNo}"> 
                
            </label>

            <button id="petAddBtn" class="btn">등록</button>
        </form><!--//petAddPopupWrap-->
    </div><!--//petAddPopup-->
</div> <!--// addPet bg end-->

<div id="reportBg">
    <form id="report" action="/report" method="POST">
        <div id="reportPopup">
		<input type="hidden" id="reportsNo" name="userNo" value="">
		<input type="hidden" id="reportsReviewNo" name="reviewNo" value="">
            <div id="reportHeader">
                <h1 id="reportTitle">신고하기</h1>
                <div class="report_popup_close"><i class="far fa-times-circle"></i></div>
                <div id="reportedPerson"></div>
            </div>
            <div id="reportContent">
                <div>
                    <label class="choice_reason" for="report1">음란 또는 청소년에게
                        부적합한 내용</label> <input id="report1" type="radio" name="type" value="O">
                </div>
                <div>
                    <label class="choice_reason" for="report2">부적절한 홍보</label> <input
                        id="report2" type="radio" name="type" value="I">
                </div>
                <div>
                    <label class="choice_reason" for="report3">개인정보 노출</label> <input
                        id="report3" type="radio" name="type" value="P">
                </div>
                <div>
                    <label class="choice_reason" for="report4">저작권 및 명예훼손,
                        기타권리 침해</label> <input id="report4" type="radio" name="type" value="D">
                </div>
            </div>
            <!--//reportContent-->

            <div id="reportFooter">
                <button id="reportSubmitBtn" class="btn">신고하기</button>
            </div>
            <!--//reportFooter-->
        </div>
        <!--//reportPopup -->
    </form>
</div> <!--// addPet bg end-->
    <div id="userProfileImgSection">
       <c:if test="${loginUser.no==userInfo.no}">
 			  <div id="profileCloseBtn"><i class="fas fa-times"></i></div>
			</c:if>
   
        <div id="userProfileWrap"><img id="profilePhoto" src="/profile/user/${userInfo.profileImg}"/></div>
        <label>
            <i class="fas fa-camera img_icon"></i>
            
            <c:if test="${loginUser.no==userInfo.no}">
 			 <input id="profileInput" class="pet_and_user_file" type="file" />
			</c:if>
            
           
        </label>

        <!--<a href="">사진 업데이트</a>-->
    </div> <!--// userProfileImgSection -->

    <div id="userInfoSection">

        <div id="userIntroduceWrap">
            <h2 id="userIntroduce" style="font-weight: bold">
                안녕하세요. 저는 '${userInfo.name}' 입니다.
            </h2>
            <c:if test="${loginUser.no==userInfo.no}">
 			<button id="profileUpdateBtn" class="profile_update_btn">프로필 수정하기</button>
			</c:if>
           
            <button id="profileUpdateCompleteBtn" class="profile_update_btn">수정 완료</button>
            <h3 id="titleIntroduce">소개</h3>
            <div id="profileTextAreaBox" class="user_introduce_detail" > ${userInfo.introduce} </div>

		

            <div id="profileUpdateTextAreaBox" class="user_introduce_detail" style="display: none">
            <input type="hidden" name="updateIntroduce" value="">
                <textarea id="profileUpdateTextArea"></textarea>
            </div>
        </div> <!--// userIntroduceSection -->

        <div id="petProfileWrap">
            <h3 id="myPet">함께 사는 펫</h3>
           
			<c:if test="${loginUser.no==userInfo.no}">
 			 <button id="addPetBtnInList"><i class="fas fa-plus"></i> 추가하기</button>
			</c:if>


            <ul>

            </ul>
            <i class="fas fa-angle-left"></i>
            <i class="fas fa-angle-right"></i>
        </div> <!--// petProfileWrap -->

        <ul id="userMenuTab">
            <li id="poomTab" class="user_menu_tab user_menu_tab_on">품</li>
            <li id="petTab" class="user_menu_tab">펫</li>
            <li id="reviewTab" class="user_menu_tab">리뷰</li>
        </ul> <!--// userMenuTab -->

        <div id="userMenuTabDetailWrap">

            <div></div>
            <ul id="poomListInner" class="small_card_ul">

               

    

            </ul> <!--// small_card_ul end -->

            <div id="petImgAddBtn">
               
                	
               	<c:if test="${loginUser.no==userInfo.no}">
               	<label>
                <i class="fas fa-camera img_icon"></i>
                <input id="addPetPhoto" class="pet_and_user_file" type="file" />
                </label>
                </c:if>
                	
                    
              
            </div> <!--// petImgAddBtn end -->

            <ul id="petImgAddUl" >

            </ul> <!--// petImgAddUl end -->

            <div id="reviewDetailTab" >
                <div id="myReview" class="user_menu_tab_on">남긴 리뷰</div>
                <div id="myPoomReview">품 리뷰</div>
            </div> <!--// reviewDetailTab end -->

            <div id="myPoomReviewList" class="review_card">
                <ul>

                </ul>
            </div><!--// review_card end -->

            <div id="myReviewList" class="review_card">
                <ul>

                </ul>
            </div>


        </div><!--  userPoomListBox end  -->

    </div> <!--// userInfoSection -->

<c:import url="/WEB-INF/template/footer.jsp"/>





<script type="text/template" id="myReviewTmp">
<@
_.each(reviews,function(review){
@>             
                    <li>
                        <div class="review_card_hotel_name"><@=review.title@></div>
                        <div class="review_card_content"><@=review.content@>
                        </div>
                        <div class="review_card_img"><img src="/profile/user/defaultProfile.jpg"></div>
                        <div class="review_card_user_name"><@=review.name@></div>
                        <div class="review_card_date"><@=review.formatDate@></div>
                    </li>

<@
})
@>
</script>
<!-- 내 리뷰 -->


<script type="text/template" id="myPoomReviewTmp">
<@
_.each(reviews,function(review){
@>             
       <li>
             <div class="review_card_hotel_name"></div>
             <div class="review_card_content">
			 <@=review.content@>	
             </div>
             <div class="review_card_img"><img src="/profile/user/defaultProfile.jpg"/></div>
             <div class="review_card_user_name"><@=review.name@></div>
             <div class="review_card_date"><@=review.formatDate@></div>
			<c:if test="${loginUser.no==userInfo.no}">
 			<div class="review_card_warning" data-userName="<@=review.name@>" data-userNo="${userNo}" data-reviewNo="<@=review.no@>">신고</div>
			</c:if>

             
             </li>

<@
})
@>
</script>
<!-- 내품 리뷰 -->


<script type="text/template" id="poomListTmp">
<@
_.each(pooms,function(poom){
console.log(poom);
@>
 				<li>
                    <div class="small_card">
                        <a href="/poom/<@=poom.no@>">
                            <ul>
                                <li class="small_card_li">
                                    <img class="small_card_img" src="/img/poom/<@=poom.img@>" alt="숙소 카드입니다."/></li>
                                <div class="small_card_hotel small_card_padding"><i class="fas fa-hotel"></i> <@=poom.title@></div>
                                <div class="small_card_pet small_card_padding small_star"><i class="fas fa-star"></i> <@=poom.score@> (<@=poom.count@>)</div>
                                </li>
                            </ul>
                        </a>
                    </div> 
                </li>
<@
})
@>
</script>
<!-- 내품 리스트 보여주기 end -->


<script type="text/template" id="petProfileTmp">
    <@ _.each(pets, function(pet){ @>
    <li class="pet_profile" >
		

        <div class="pet_profile_img"><img src="/profile/pet/<@=pet.profileImg@>"/></div>
        <div class="pet_name"><i class="fas
        <@ if(pet.gender=="F"){@>
            fa-venus
            <@ }
            else if(pet.gender=="M") {@>
            fa-mars
            <@ } @>
            "></i> <@=pet.name@></div>
			<c:if test="${loginUser.no==userInfo.no}">
 			<div class="updateBtn"><i class="fas fa-ellipsis-h"></i></div>
		<div class="updatePopup">
		<div class="update_update" data-no="<@=pet.no@>">수정</div>
		<div class="update_delete" data-no="<@=pet.no@>">삭제</div>	
		</div>
			</c:if>
		
    </li>
    <@ }) @>
</script>
<!-- 펫프로필 보여주기 -->

<script type="text/template" id="petImgAddTmp"> 
    <@ _.each(petImgs, function(petImg){ @>
    <li>
        <div class="pet_img"><img src="/upload/<@=petImg.img@>"/></div>
		<div class="pet_img_bg"><i data-no="<@=petImg.no@>"class="fas fa-times pet_img_close"></i></div>
    </li>
    <@ }) @>
</script>
<!-- 동물이미지 사진 end -->

<script>
    _.templateSettings = {
        interpolate : /\<\@\=(.+?)\@\>/gim,
        evaluate : /\<\@([\s\S]+?)\@\>/gim,
        escape : /\<\@\-(.+?)\@\>/gim
    };

    let petPageNo = 1; // pet 사진 목록 무한스크롤 페이지
    let poomPageNo = 1; // poom 목록 무한스크롤 페이지
    let poomReviewPageNo = 1; //poom 리뷰목록 무한스크롤 페이지
    let myReviewPageNo =1; // 내리뷰목록 무한스크롤 페이지
    let flag = true; // 무한 스크롤링의 로딩을 기다리기 위해 필요함
    let oldProfile = null; //프로필 파일 사진의 중복을 막기 위한 비교
    const petProfileTmp = _.template($("#petProfileTmp").html());
    const $petProfileUl = $("#petProfileWrap ul");
    const petImgAddTmp = _.template($("#petImgAddTmp").html());
    const $petImgAddUl = $("#petImgAddUl ");
    const poomListTmp = _.template($("#poomListTmp").html());
    const $poomListInner = $("#poomListInner");
    const myPoomReviewTmp = _.template($("#myPoomReviewTmp").html());
    const $myPoomReviewListUl = $("#myPoomReviewList ul");
    const myReviewTmp = _.template($("#myReviewTmp").html());
    const $myReviewListUl = $("#myReviewList ul");
    //image인지 확인하는 정규표현식
    var profileReg = /^image/;
	const $profileInput = $("#profileInput"); 
	const $addPetPhoto = $("#addPetPhoto");
	const $petInput = $("#petInput");
    
    function profileCheck(){
    	let profile = "${userInfo.profileImg}"
    	if(profile != "defaultProfile.jpg"){
			$("#userProfileImgSection label").css("display","none");
			$("#profilePhoto").css("display","block");
			$("#userProfileImgSection").css("background","#fff");
			$("#profileCloseBtn").show();
    	}
     }
    
    profileCheck();
    
 


    // *************************************** userMenuTab 이동

    $("#userMenuTab li").click(function () {

        $(".user_menu_tab").removeClass('user_menu_tab_on');
        $(this).addClass('user_menu_tab_on');
    });

    // *************************************** poomTab

    $("#poomTab").click(function () {
        $("#myPoomReviewList").hide();
        $("#myReviewList").hide();
        $("#petImgAddUl").hide();
        $("#reviewDetailTab").hide();
        $("#petImgAddBtn").hide();
        $(".small_card_ul").show();
    })

    // *************************************** petTab

    $("#petTab").click(function () {
        $("#myPoomReviewList").hide();
        $("#myReviewList").hide();
        $(".small_card_ul").hide();
        $("#reviewDetailTab").hide();
        $("#petImgAddBtn").show();
        $("#petImgAddUl").show();
        getPetPhotos();
    })

    // *************************************** reviewTab
    $("#reviewTab").click(function () {
        $("#myReviewList").show();
        $(".small_card_ul").hide();
        $("#petImgAddUl").hide();
        $("#petImgAddBtn").hide();
        $("#reviewDetailTab").show();
        getmyReview();

    })
    

    
   $("#myPoomReview").click(function () {
	   getMyPoomReview();

    })
    
      $("#myReview").click(function () {
    	  getmyReview();

    })


    // *************************************** reviewDetailTab 이동

    $("#reviewDetailTab div").click(function () {
        $("#reviewDetailTab div").removeClass('user_menu_tab_on');
        $("#myReview").removeClass('user_menu_tab_on');
        $(this).addClass('user_menu_tab_on');
    });
    
    

    // *************************************** review reportPopup

    $("body").on("click",".review_card_warning",function () {
    

    	$("#reportsNo").val($(this).attr("data-userNo"));
    	$("#reportsReviewNo").val($(this).attr("data-reviewNo"));
		
        $("#reportBg").show();
    })

    $(".report_popup_close").click(function () {

        $("#reportBg").hide();
    })

    // *************************************** reviewTab

    $("#myReview").click(function () {
        $("#myPoomReviewList").hide();
        $("#myReviewList").show();

    })

    $("#myPoomReview").click(function () {
        $("#myPoomReviewList").show();
        $("#myReviewList").hide();
    })


    // *************************************** petAddpopUp 띄우고 닫기

    $("#addPetBtnInList").click(function () {
    	
    	
        $("#addPetBg").show();
        $("#male").prop("checked",false);
        $("#female").prop("checked",false);
   		$("#petNameInput").val("");
        $("#petImg").atte("src","");
     
        
    });

    $(".popup_close").click(function () {
        $("#addPetBg").hide();
    });

    // *************************************** 소개 수정하기


    function getIntroduce() {

        //$introduce.text(introduceText);
        /*
        $.ajax({
            url : "/ajax/user/${user.no}/intro/" + introduce,
            dataType : "json",
            type : "POST",
            error : function() {
                alert("에러");
            },//error end
            success : function(json) {

            }//success end
        });//ajax end
        */

    }

    getIntroduce();

    $("#profileUpdateBtn").click(function () {

        let introduceText = $("#profileTextAreaBox").text();
        console.log(introduceText);

        $("#profileUpdateTextArea").text(introduceText);

        $("#profileUpdateBtn").hide();
        $("#profileUpdateCompleteBtn").show();
        $("#profileTextAreaBox").hide();
        $("#profileUpdateTextAreaBox").show();

    })

    $("#profileUpdateCompleteBtn").click(function () {

        $("#profileUpdateTextAreaBox").hide();
       
        $("#profileUpdateCompleteBtn").hide();
    

    })

    // *************************************** 함께 사는 펫 이동

    let movePet = 0;
    let nowLeft = 0;

    // move클래스 때주기
    $("#petProfileWrap ul").on("transitionend", function (e) {
        $(this).removeClass("move");
    });

    // 다음사진 버튼
    $("#petProfileWrap").on("click", ".fa-angle-right",function () {

        let $petProfileWrapUl = $(this).parent().find("ul");

        if (!$petProfileWrapUl.hasClass("move")) {
            $petProfileWrapUl.addClass("move");
            console.log("시작");

            var length = $("#petProfileWrap ul li").length;
            console.log("zzzzzz: "+length);

            $("#petProfileWrap ul").css("width",length*252);
            console.log($("#petProfileWrap ul").css("width"));

            // console.log("ul: "+ $petProfileWrapUl);

            nowLeft = $petProfileWrapUl.css("left");
            console.log("left: " + nowLeft);

            nowLeft = nowLeft.substring(0, nowLeft.length - 2);
            console.log("left: " + nowLeft);

            movePet = (length - 3) * 252;
            console.log("movePet: " + movePet);

            if (nowLeft == -1 * movePet) {
                console.log("if");
                nowLeft = 0;
                $petProfileWrapUl.css("left", nowLeft);
            } else if (nowLeft >= -1 * movePet - 252) {
                console.log("if else");
                nowLeft -= 252;
                $petProfileWrapUl.css("left", nowLeft);
                console.log(nowLeft);
            }//if()~else() end

        }//if() end

    }); // next click() end


    // 이전사진 버튼
    $("#petProfileWrap").on("click", ".fa-angle-left",function () {

        let $petProfileWrapUl = $(this).parent().find("ul");

        if (!$petProfileWrapUl.hasClass("move")) {
            $petProfileWrapUl.addClass("move");
            console.log("시작");

            var length = $("#petProfileWrap ul li").length;
            console.log("zzzzzz: "+length);

            $("#petProfileWrap ul").css("width",length*252);
            console.log($("#petProfileWrap ul").css("width"));

            //nowLeft = nowLeft.substring(0, nowLeft.length - 2);

            movePet = (length - 3) * 252;
            console.log("movePet: " + movePet);

            if (nowLeft == 0) {
                console.log("if");
                nowLeft = -1 * movePet;
                $petProfileWrapUl.css("left", nowLeft);
            } else if (nowLeft <= -252) {
                console.log("if else");
                nowLeft = parseInt(nowLeft);
                nowLeft += 252;
                $petProfileWrapUl.css("left", nowLeft);
                console.log(nowLeft);
            } else {
                console.log("else");
            } // prev click() end

        }//if() end

    });//prev_photo click() end


    // petProfile ajax
    function getPetProfileList(){
        $.ajax({
            url:"/ajax/user/petProfile/",
            data :{userNo: ${userNo}},
            dataType : "json",
            type : "GET",
            error:function(){
                alert("서버점검");
            },
            success:function (json) {
                console.log(json);
                $("#petProfileWrap ul").css("width",json.length*252);
                $petProfileUl.html(petProfileTmp({"pets":json}));
                console.log(json.length);
                console.log(json.length*252);
            }
        })// ajax() end
    }// getPetProfile() end

    getPetProfileList();

    /*
    // 펫 이미지 추가 에이젝스 end
    $("#petImgAddBtn input").change(function () {
        var file = this.files[0];
        if(!fileTypeExp.test(file.type)) {
            alert("이미지만 선택해주세요.");
            return;
        }
        $.ajax({
            url:"json/profileImg.json",
            dataType:"json",
            type:"GET",
            error: function () {
                alert("서버점검중");
            },
            success: function (json) {
				
                $(".pet_img img").attr("src",json.url);

                getPetImgList();

            }
        })

    }); // 펫 이미지 추가 에이젝스 end



    // 펫 추가 팝업 에이젝스 end
    $("#petInput").change(function () {
        var file = this.files[0];
        if(!fileTypeExp.test(file.type)) {
            alert("이미지만 선택해주세요.");
            return;
        }
        $.ajax({
            url:"json/profileImg.json",
            dataType:"json",
            type:"GET",
            error: function () {
                alert("서버점검중");
            },
            success: function (json) {

                $("#petImg").attr("src",json.url);
                $("#petImg").css("display","block");
                $("#petAddPopupLabel").css("display","none");
                $("#petImgBox").css("display","block");
            }
        })

    }); // 펫추가 팝업 에이젝스 end
*/
	$("#profileUpdateCompleteBtn").click(function () {
		
		
	
		let updateIntroduce = $("#profileUpdateTextArea").val();
		
		console.log(updateIntroduce);
		
    	$.ajax({
  		  url:"/ajax/user/${userNo}/introduce/"+updateIntroduce,
	            data :{userNo:1 , content:updateIntroduce},
  		  		dataType: "json",
	            type: "PUT",

	            error: function () {
	                alert("서버점검중");
	            },
	            success: function (json) {
	               console.log(json);
					
	              $("#profileTextAreaBox").html(updateIntroduce);
	              $("#profileUpdateBtn").show();
	              $("#profileTextAreaBox").show();
	              
	            }//success end
  	});//ajax end
  }); //getPoomList() end
		
		

/*----------------------------------------------------------------------------- */	
	
	//품 리스트 불러오기
	function getPoomList(){
		console.log("품");
		if (flag) {
			flag = false;
    		$.ajax({
 
    	
    		  url:"/ajax/user/poom/",
	            data :{userNo: ${userNo},pageNo:poomPageNo++},
    		  	dataType: "json",
	            type: "GET",

	            error: function () {
	                alert("서버점검중");
	            },
	            success: function (json) {
	               console.log(json);
					
	                $poomListInner.append(poomListTmp({"pooms":json}));
	              
	                
		             // 완료 후 다시 falg를 true로
						flag = true;
		             
		             
	
	                
	            }//success end
    	});//ajax end
    		}//if()end
    }; //getPoomList() end
	
getPoomList(); // 한번호출




 	//펫 사진들 불러오기
function getPetPhotos(){
	console.log("펫");
		if (flag) {
			flag = false;
			$.ajax({
				url:"/ajax/user/petPhoto",
				data :{userNo: ${userNo},pageNo: petPageNo++},
				dataType: "json",
				 error: function () {
		                alert("서버점검중");
		            },
		            success: function (json) {
		              
		               console.log("소환");
		               console.log(json);
						
		                $petImgAddUl.append(petImgAddTmp({"petImgs":json.Photos}));
	       
		             // 완료 후 다시 falg를 true로
						flag = true;
	                
		            }//success end

		});//ajax end
		}//if end
	}
 	

	 
	
	
	//품 리뷰 불러오기
	function getMyPoomReview(){
		console.log("품리뷰");
		if (flag) {
			flag = false;
 		
		$.ajax({
			url:"/ajax/user/poomReivew",
			data :{userNo: ${userNo}, pageNo : poomReviewPageNo++ },
			dataType: "json",
			 error: function () {
	                alert("서버점검중");
	            },
	            success: function (json) {
	              // console.log(json);
					
	                $myPoomReviewListUl.append(myPoomReviewTmp({"reviews":json}));
	                
	                flag = true;
	                
	            }//success end

		});//ajax end
		}//if end
	}
	
	
	

$("#myReview").click(getMyPoomReview);

	function getmyReview(){
		console.log("내리뷰");
		if (flag) {
			flag = false;
			
		
		$.ajax({
			url:"/ajax/user/myReivew",
			data :{userNo: ${userNo}, pageNo:myReviewPageNo++},
			dataType: "json",
			 error: function () {
	                alert("서버점검중");
	            },
	            success: function (json) {
	               //console.log(json);
					
	                $myReviewListUl.append(myReviewTmp({"reviews":json}));
	             
	                flag = true;
	                
					//스크롤이 하단과 닿으면 호출하는 코드
					let $window = $(window);
					let $document = $(document);
				    $window.scroll(function () {
				        let sTop = $window.scrollTop();
				        let $dHeight = $document.height();
				        let $wHeight = $window.height();

				        if($dHeight<=$wHeight + sTop + 30) {
				        	getPetPhotos();
				        }//if end
				    });
				    
	            }//success end
	                
	                
	   

		});//ajax end
		}
	}
	
	

	
	//프로필 사진 업로드---------------------
	
	$("#profileInput").change(function() {
		 checkProfile();
	})

	function checkProfile() {
	
	//jquery객체에서 순수자바스크립트요소객체 얻기
	var profileInput = $profileInput.get(0);
	
	//input type=file요소(순수자바스크립트)는 무조건
	//files배열을 가지고 있습니다.
	
	//한 개의 파일
	var file = profileInput.files[0];
		
	//File 객체의 속성
	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	//- name : 파일명
	//- lastModified : 최종수정일
	//- size : 파일 크기
	
	if(file==null||file.size<=0) {
		
		
	 alert("제대로 된 파일을 선택해주세요.");
		
		return;
	}//if end
	
	//이미지인지 확인!!
	if(!profileReg.test(file.type)) {
		
		alert("이미지 파일을 선택해주세요.");
		
		return;
	}
	
	if(oldProfile!=file.name) {
		
	oldProfile = file.name;
	
	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	
	//ajax로 넘길 폼을 생성하고
	var form = new FormData();
	
	//우리가 선택한 파일을 붙임
	form.append("type","Profile");//일반적인 데이터
	form.append("userNo",${userNo});//일반적인 데이터
	
	//1)파라미터명, 2) 파일 3) 파일명
	form.append("uploadImg",file,file.name);
	
	//multipart/form-data로 ajax처리
	$.ajax({
		url:"/ajax/profile/upload",
		dataType:"json",
		type:"POST",//multipart/form-data
		processData:false,//multipart/form-data
		contentType:false,//multipart/form-data
		data:form,
		error:function() {
			alert("사진 서버 점검중!");
		},
		success:function(json) {
			
			$("#profilePhoto").attr("src","/profile/user/"+json.src);
			$("#userProfileImgSection label").css("display","none");
			$("#profilePhoto").css("display","block");
			$("#userProfileImgSection").css("background","#fff");
			$("#profileCloseBtn").show();
		}//success end
	
	});//ajax() end
	
	}//if end
	
} //checkProfile() end
	
//프로필 사진 업로드 end---------------------	
	
//프로필 사진 삭제

$("#profileCloseBtn").click(function(){
	
	$.ajax({
		url:"/ajax/profile/user/${userNo}",
		dataType:"json",
		type:"DELETE",
		error:function(){
			alert("사진 서버 점검중!");
		},
		success:function(json){
			
			$("#userProfileImgSection label").css("display","block");
			$("#profilePhoto").css("display","none");
			$("#userProfileImgSection").css("background","#EEE");			
			$("#profileCloseBtn").hide();
		}//success
		
	});//ajax() end
		
})


//프로필 사진 삭제
	
//펫 사진 업로드---------------------	

$("#addPetPhoto").change(function() {
		addPetPhoto();
	})

	function addPetPhoto() {
	
	//jquery객체에서 순수자바스크립트요소객체 얻기
	var addPetPhoto = $addPetPhoto.get(0);
	
	//input type=file요소(순수자바스크립트)는 무조건
	//files배열을 가지고 있습니다.
	
	//한 개의 파일
	var file = addPetPhoto.files[0];
		
	//File 객체의 속성
	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	//- name : 파일명
	//- lastModified : 최종수정일
	//- size : 파일 크기
	
	if(file==null||file.size<=0) {
		
		
	 alert("제대로 된 파일을 선택해주세요.");
		
		return;
	}//if end
	
	//이미지인지 확인!!
	if(!profileReg.test(file.type)) {
		
		alert("이미지 파일을 선택해주세요.");
		
		return;
	}
	
	if(oldProfile!=file.name) {
		
	oldProfile = file.name;
	
	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	
	//ajax로 넘길 폼을 생성하고
	var form = new FormData();
	
	//우리가 선택한 파일을 붙임
	form.append("type","Pet");//일반적인 데이터
	form.append("userNo",${userNo});//일반적인 데이터
	
	//1)파라미터명, 2) 파일 3) 파일명
	form.append("uploadImg",file,file.name);
	
	//multipart/form-data로 ajax처리
	$.ajax({
		url:"/ajax/profile/upload",
		dataType:"json",
		type:"POST",//multipart/form-data
		processData:false,//multipart/form-data
		contentType:false,//multipart/form-data
		data:form,
		error:function() {
			alert("사진 서버 점검중!");
		},
		success:function(json) {
		
           	
			
			 $petImgAddUl.empty();
			 
			 let nowPage = petPageNo;
			 petPageNo = 1;
			 
			 getPetPhotos();
			 /* 질문
			 for(let i = 1 ; i<=nowPage; i++){
				 console.log("11");
				 
			 }
			 */
			
		}//success end
	
	});//ajax() end
	
	}//if end
	
} //checkProfile() end

//펫 사진 업로드 end---------------------	   

//펫 사진 삭제 

$("body").on("click",".pet_img_close",function(){
	

	
	
	let no = 0;
	no =  $(this).attr("data-no");
	$(this).parents("li").remove();
	
	
	$.ajax({
		url:"/ajax/petPhoto/"+no ,
		dataType:"json",
		type:"DELETE",
		error:function(){
			alert("사진 서버 점검중!");
		},
		success:function(json){
			 petPageNo = 1;
			 
			 getPetPhotos();
		}//success
		
	});//ajax() end
		
})



//펫 사진 삭제

//펫프로필
	
	$("#petInput").change(function() {
		petInput();
	})

	function petInput() {
	
	//jquery객체에서 순수자바스크립트요소객체 얻기
	var petInput = $petInput.get(0);
	
	//input type=file요소(순수자바스크립트)는 무조건
	//files배열을 가지고 있습니다.
	
	//한 개의 파일
	var file = petInput.files[0];
		
	//File 객체의 속성
	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	//- name : 파일명
	//- lastModified : 최종수정일
	//- size : 파일 크기
	
	if(file==null||file.size<=0) {
		
		
	 alert("제대로 된 파일을 선택해주세요.");
		
		return;
	}//if end
	
	//이미지인지 확인!!
	if(!profileReg.test(file.type)) {
		
		alert("이미지 파일을 선택해주세요.");
		
		return;
	}
	
	if(oldProfile!=file.name) {
		
	oldProfile = file.name;
	
	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	
	//ajax로 넘길 폼을 생성하고
	var form = new FormData();
	
	//우리가 선택한 파일을 붙임
	form.append("type","petProfile");//일반적인 데이터
	form.append("userNo",${userNo});//일반적인 데이터
	
	//1)파라미터명, 2) 파일 3) 파일명
	form.append("uploadImg",file,file.name);
	
	//multipart/form-data로 ajax처리
	$.ajax({
		url:"/ajax/profile/upload",
		dataType:"json",
		type:"POST",//multipart/form-data
		processData:false,//multipart/form-data
		contentType:false,//multipart/form-data
		data:form,
		error:function() {
			alert("사진 서버 점검중!");
		},
		success:function(json) {
		
            $("#petImg").attr("src","/profile/pet/"+json.src);
            $("#petImg").css("display","block");
            $("#petAddPopupLabel").css("display","none");
            $("#petImgBox").css("display","block");
            $("#petProfile").val(json.src);
			
		}
	});//ajax() end
	
	}//if end
	
} //checkProfile() end
//펫프로필


	//스크롤이 하단과 닿으면 호출하는 코드
	let $window = $(window);
	let $document = $(document);
    $window.scroll(function () {
        let sTop = $window.scrollTop();
        let $dHeight = $document.height();
        let $wHeight = $window.height();

     
        if($dHeight<=$wHeight + sTop + 30){
        
     if($("#poomTab").hasClass("user_menu_tab_on")){
       console.log("poomTab");
        	getPoomList();
      
	}else if($("#petTab").hasClass("user_menu_tab_on")){
		  console.log("petTab");
        	getPetPhotos();
      
	}else{
		 console.log("reviewTab");
		if($("#myReview").hasClass("user_menu_tab_on")){
			 console.log("myReview");
	        	getmyReview();
	      
		}else if($("#myPoomReview").hasClass("user_menu_tab_on")){
			 console.log("myPoomReview");
	        	getMyPoomReview();
	       
		}//if else end
		
	}//if else end	
        }//if end

    });//seroll end  

    $("body").on("click",".updateBtn", function(){
    	
    	
    	$(this).next().toggle();
    	
    });

    
    $("#review_card_warning").click(function(){
    	$("#reportedPerson").html($(this).attr("data-userName"));
    });
    
    
    
    $("body").on("click",".update_delete",function(){
    	
    	let no = 0;
    	no =  $(this).attr("data-no");
    	$(this).parents("li").remove();
    	
    	$.ajax({
    		url:"/ajax/mypet/"+no,
    		dataType:"json",
    		type:"DELETE",
    		error:function() {
    			alert("서버 점검중!");
    		},
    		success:function(json) {
      
    		}//sucess end
    		
  
    	})//ajax end
 	
    	
    }) //delete function() end
    
    
    $("body").on("click",".update_update",function(){
    	
    	let myPetNo = 0;
    	myPetNo =  $(this).attr("data-no");
    	
    	$.ajax({
    		url:"/ajax/mypet/"+myPetNo,
    		dataType:"json",
    		type:"GET",
    		error:function() {
    			alert("서버 점검중!");
    		},
    		success:function(json) {
    			$("#addPetBg").show();
    			
    			if(json.gender == "M"){
    				$("#male").prop("checked",true);
    				
    				
    			}else{
    				$("#female").prop("checked",rue);
    			}
    			
    	   		$("#petNameInput").val(json.name);
    			
    	        $("#addPetBg").show();
    	  		
    	        $("#petAddPopupLabel").append("<input type='hidden' name='no' value="+myPetNo+">");
    	        $("#petAddPopupLabel").append('<input type="hidden" name="_method" value="PUT"/>');
    	        
    	        $("#petProfile").val(json.profileImg);
    	        $("#petAddPopup h1").html("펫 수정하기");
    	        $("#petAddBtn").html("수정");
    		}//sucess end
    				
    	}) //ajax end
   	
    }) //delete function() end
    
    

</script>
</body>
</html>