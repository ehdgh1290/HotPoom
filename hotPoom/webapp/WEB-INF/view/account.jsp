<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>개인 정보</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/account.css"/>

<style>

#content{
	position: relative;
	margin: auto;
	min-height: 800px;
	margin-top: 50px;
}

.personal_information_inner_middle.personal_information_input {
	height: 25px;
}

#nameUpdateInner input{
	display: none;
}

#nameUpdateCompleteBtn{
	display: none;
}

#phoneNumUpdateCompleteBtn{
	display: none;
}

#defaultBtn{
	background: #C50532;
	color: #fff;
}

#userPhoneInput{
	display: none;
}

.phone_num_confirm_success{
	color : #0080ff;
	position : absolute;
	top : 123px;
	left : 100px;
}

.hypoon_span{
	position: relative;
	left: 10px;
}


</style>
</head>
<body>

<c:if test="${loginUser==null}">
	<c:redirect url="/index"/>
</c:if>

<c:import url="/WEB-INF/template/header.jsp"/>
<div id="bg"></div>
<div id="accountUpdateSection">
    <div id="personalInformationWrap">
        <h2 class="account_h2">개인정보</h2>
        <div id="nameUpdateInner" class="personal_information_inner">
            <span class="personal_information_inner_head">이름</span>
            <div id="userNameDiv" class="personal_information_inner_middle personal_information_div" value="${user.name }">${user.name }</div>
            <input id="userNameInput" name="name" class="personal_information_inner_middle personal_information_input" value="${user.name }"/>
            <button id="nameUpdateBtn" class="personal_information_inner_foot user_name">수정</button>
            <button id="nameUpdateCompleteBtn" class="personal_information_inner_foot user_name">완료</button>
            <div class="name_change_success"></div>
        </div>
        <div id="genderUpdateInner" class="personal_information_inner">
            <span class="personal_information_inner_head">성별</span>
            <span class="personal_information_inner_middle">${user.gender=="F" ? "여자" : "남자" }</span>
        </div>
        <div id="birthUpdateInner" class="personal_information_inner">
            <span class="personal_information_inner_head">생년월일</span>
            <span class="personal_information_inner_middle">${user.birthDate }</span>
        </div>
        <div id="emailUpdateInner" class="personal_information_inner">
            <span class="personal_information_inner_head">이메일</span>
            <span class="personal_information_inner_middle">${user.email }</span>
        </div>
        <div id="phoneNumUpdateInner" class="personal_information_inner">
            <span class="personal_information_inner_head">전화번호</span>

            <div id="userPhoneDiv" class="personal_information_inner_middle personal_information_ user_phone_num_input" value="${user.phoneNum }">${user.phoneNum }</div>            
            <input id="userPhoneInput" class="personal_information_inner_middle personal_information_input user_phone_num_input" maxlength="11" value="${user.phoneNum }"/>
            
            <button class="personal_information_inner_foot send_number">발송</button>
            <button id="phoneNumUpdateBtn" class="personal_information_inner_foot user_phone_num">수정</button>
            <button id="phoneNumUpdateCompleteBtn" class="personal_information_inner_foot user_phone_num">완료</button>
            <div class="phone_change_success"></div>
            
            <div class="account_msg phone_num_change_success"></div>

            <input id="accountPhoneConfirm" name="accountPhoneConfirm" placeholder=" 인증번호 입력" class="personal_information_inner_middle"/>
            <button class="phone_num_confirm">확인</button>
            <div class="account_msg phone_num_confirm_success"></div>
        </div>
    </div>
    <div id="paymentInformationWrap">
        <h2 class="account_h2">결제 정보</h2>
        <div id="creditCardSelectInner">
            
        </div>
        <div id="receiptAccountSelectInner">
            <h3 class="account_h3">수령 계좌</h3>
            <c:choose>
            <c:when test="${userAccount==null }">
            <div class="receipt_account_detail">
                <span class="receipt_account_no">아직 등록된 계좌가 없습니다.</span>
                <button id="addAccount" class="receipt_account_btn add_card">계좌 추가</button>
            </div>
            </c:when>
            <c:otherwise>
            <div id="receiptAccountDetailBox" class="receipt_account_detail">
                <span>${userAccount.name }</span>
                <div id="receiptAccountDetail">
                    <span>${userAccount.userName }</span>
                    <span>${userAccount.num }</span>
                </div>
                <form method="POST" action="/user/account/${userAccount.no}/${loginUser.no}">
	                   <input type="hidden" name="_method" value="DELETE"/>
	                   <button data-accountNo = "${userAccount.no}" id="removeAccount" class="receipt_account_btn delete_card ">삭제하기</button>
	            </form>
                
            </div>
            </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div id="creditCardAddSection">
    <h1 class="account_h1">결제수단 추가</h1>
    <div id="creditCardSelectWrap">
        <h3 class="account_h3">카드</h3>
        <select name='cardName'  class='card_list_select'>
            <option value=''>-선택-</option>
            <c:forEach items="${cardList }" var="card">
            <option value='${card.no }'>${card.name }</option>
            </c:forEach>
        </select>
    </div>
    <div id="cardPersonInsertWrap">
        <div id="cardPersonFirstNameInsertInner">
        	
            <h2 class="account_h3">성</h2>
            <input class="card_name_insert_input last_name" placeholder="last name"/>
        </div>
        <div id="cardPersonNameInsertInner">
            <h3 class="account_h3">이름</h3>
            <input class="card_name_insert_input first_name" placeholder="first name"/>
        </div>
    </div>
    <div id="cardInformaionInsertWrap">
        <h3 class="account_h3">카드 정보</h3>
        <input class="card_information_insert_input1" maxlength="4" placeholder="카드번호"/><span class="hypoon_span"> -</span>&nbsp;
        <input class="card_information_insert_input2" maxlength="4" placeholder="카드번호"/><span class="hypoon_span"> -</span>&nbsp;
        <input class="card_information_insert_input3" maxlength="4" placeholder="카드번호"/><span class="hypoon_span"> -</span>&nbsp;
        <input class="card_information_insert_input4" maxlength="4" placeholder="카드번호"/>
        <div id="cardInformaionInsertInner">
            <span class="card_information_detail limit">만료일</span>
            <input class="card_information_detail_input credit_card_month" maxlength="2" placeholder="MM"/>
            <span class="card_information_detail slash">/</span>
            <input class="card_information_detail_input credit_card_year" maxlength="2" placeholder="YY"/>
            <span class="card_information_detail">cvc</span>
            <input class="card_information_detail_input credit_card_cvc" maxlength="3" placeholder="cvc"/>
        </div>
    </div>

    <div id="creditCardInsertBtnWrap">
        <button type="button" class="credit_card_insert_btn credit_card_popup_cancel">취소</button>
        <button type="button" class="credit_card_insert_btn credit_card_popup_register">등록</button>
    </div>
</div>

<form id="receiptAccountAddSection" action="/user/account" method="POST">
    <h1 class="account_h1">수령 계좌 추가</h1>
    <div id="bankSelectWrap">
        <h3 class="account_h3">은행</h3>
        <select name='bankName'  class='bank_list_select'>
            <option value=''>-선택-</option>
            <c:forEach items="${cardList}" var="card">
            <option value='${card.no }'>${card.name }</option>
            </c:forEach>
        </select>
        
        
    </div>
    <div id="personInsertWrap">
        <h3 class="account_h3">예금주명</h3>
        <input id="accountUserName" name="name" class="account_insert_input" placeholder="이름"/>
    </div>
    <div id="accountInsertWrap">
        <h3 class="account_h3">계좌번호</h3>
        <input id="accountNum" name="num" class="account_insert_input" placeholder="계좌번호"/>
    </div>
    <div id="accountInsertBtnWrap">
        <button type="button" class="account_insert_btn account_popup_cancel">취소</button>
        <button type="button" class="account_insert_btn account_popup_register">등록</button>
    </div>
</form>


<c:import url="/WEB-INF/template/footer.jsp"/>

<script type="text/temlpate" id="cardListTmp">
<h3 class="account_h3">결제 수단</h3>
<@_.each(cards,function(card){	
	let bankName = card.name;
	let bName = bankName.substring(0,2);

	let cardNum = card.num.substring(12,16); 
@>
	<div class="creditCardDetailBox">
                <img class="creditCardBankIcon" src="/img/<@=bName@>.JPG" alt="<@=bName@>"/>
                <div class="creditCardDetail">
                    <span><@=bName@> - <@=cardNum@></span>
                    <span>만료일 <@=card.dueMonth@>/<@=card.dueYear@></span>
                </div>
				<@ if(card.basic=="D") {@>
                <button id="defaultBtn" data-cardNo="<@=card.no@>" class="payment_information_credit_card_btn default_setting">기본 카드</button>
				<button data-cardNo="<@=card.no@>" class="payment_information_credit_card_btn remove_card delete_card">삭제하기</button>
				<@ } else if(card.basic=="N") { @>
                <button data-cardNo="<@=card.no@>" class="payment_information_credit_card_btn default_setting">기본으로 설정</button>
                <button data-cardNo="<@=card.no@>" class="payment_information_credit_card_btn remove_card delete_card">삭제하기</button>
				<@ } @>    
				</div>
<@})@>
<button class="payment_information_credit_card_btn add_card">결제 수단 추가</button>
</script>

<script type="text/temlpate" id="accountTmp">
<h3 class="account_h3">수령 계좌</h3>
            <div id="receiptAccountDetailBox" class="receipt_account_detail">
                <span><@=account.bankName@></span>
                <div id="receiptAccountDetail">
                    <span><@=account.name@></span>
                    <span><@=account.num@></span>
                </div>
                <form id="deleteForm" method="POST" action="/user/account/<@=account.no@>/<@=account.userNo@>">
	                   <input type="hidden" name="_method" value="DELETE"/>
	                   <button form="deleteForm" data-accountNo = "<@=account.userNo@>" id="removeAccount" class="receipt_account_btn delete_card">삭제하기</button>
	            </form>
                
 			</div>
</script>

<script type="text/template" id="notYetTmp">
    	<span class="receipt_account_no">아직 등록된 카드가 없습니다.</span>
		<button class="payment_information_credit_card_btn add_card">결제 수단 추가</button>
</script>

<script>



	let userNo = ${loginUser.no};

	_.templateSettings = {
		interpolate : /\<\@\=(.+?)\@\>/gim,
		evaluate : /\<\@([\s\S]+?)\@\>/gim,
		escape : /\<\@\-(.+?)\@\>/gim
	};

    let $nameInput = $(".user_name_input");
    let $phoneNumImput = $(".user_phone_num_input");
    
    const cardListTmp = _.template($("#cardListTmp").html());
    const accountTmp = _.template($("#accountTmp").html());
    const notYetTmp = _.template($("#notYetTmp").html());

    // ************************************* pop up 처리 *************************************************
    
    $("#paymentInformationWrap").on("click",".payment_information_credit_card_btn.add_card",function(){
    	$("#bg").css("display","block");
        $("#creditCardAddSection").css("display","block");
    });// 결제 수단 추가 btn click end

    $(".credit_card_insert_btn").on("click",function () {
        $("#bg").css("display","none");
        $("#creditCardAddSection").css("display","none");
    });// popup 취소, 등록 btn click end

    $(".receipt_account_btn.add_card").on("click",function () {
        $("#bg").css("display","block");
        $("#receiptAccountAddSection").css("display","block");
    });// 계좌 추가 btn click end

    $(".account_insert_btn").on("click",function () {
        $("#bg").css("display","none");
        $("#receiptAccountAddSection").css("display","none");
    });// popup 취소, 등록 btn click end
    
    // ************************************* pop up 처리 end *************************************************

    $(".user_name").on("click", function () {
    	
    	$(".name_change_success").css("display","none");
    	$(".phone_change_success").css("display","none");
    	$("#userNameDiv").css("display","none");
    	$("#userNameInput").css({"display":"block","pointer-events":"auto"});
    	
    	$("#nameUpdateBtn").css("display","none");
    	$("#nameUpdateCompleteBtn").css("display","block");
    	
    });// 이름 수정 btn click end
    
    $("#nameUpdateCompleteBtn").on("click",function(){
    	
    	let name = $("#userNameInput").val();
    	console.log(name);

    	$.ajax({
    		url:"/ajax/updateName/${loginUser.no}/"+name,
    		type:"PUT",
    		datatype:"json",
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			// console.log(json);
    			
    			$("#userNameInput").css("display","none");
    			$("#userNameDiv").text(name);
    			$("#userNameDiv").css("display","block");
    			$("#nameUpdateCompleteBtn").css("display","none");
    			$("#nameUpdateBtn").css("display","block");
    			

                $(".name_change_success").text("이름이 성공적으로 변경되었습니다.").css({"display":"block","position":"relative","z-index":"1","left":"105px","top":"33px"});
    		}
    	});//$.ajax() end
    }) // 이름 수정 완료 btn click end

//     $nameInput.on("keyup",function () {
//         let name = $nameInput.val();
//         console.log(name);

//         $.ajax({
//             url: "json/checkingUser.json",
//             type: "get",
//             dataType: "json",
//             data:{"name":name},
//             error:function() {
//                 alert("서버 점검중!");
//             },
//             success:function(json) {
//                 $(".name_change_success").text(name+" 으로 변경되었습니다.").css(
//                     {"color": "#C50532","position":"absolute","top":"50px","left":"110px"});
//                 return false;
//             }//success end
//         })//ajax end
//     });//keyup end

    $(".user_phone_num").on("click", function () {
    	
		$("#phoneNumUpdateBtn").css("display","none");
		$("#phoneNumUpdateCompleteBtn").css("display","block");
        $("#userPhoneInput").css({"display":"block","pointer-events":"auto"});
        $("#accountPhoneConfirm").css({"display":"block","`":"auto"});
        $(".phone_num_confirm").css({"display":"block","pointer-events":"auto"});
        $(".send_number").css("display","block");
        

    });// 핸드폰 수정 btn click end


//     $phoneNumImput.on("keyup",function () {
//         phoneNum = $phoneNumImput.val();
//         console.log(phoneNum);

//         $.ajax({
//             url: "json/checkingUser.json",
//             type: "get",
//             dataType: "json",
//             data:{"phoneNum":phoneNum},
//             error:function() {
//                 alert("서버 점검 중");
//             },
//             success:function(json) {
//                 $(".phone_num_change_success").text(phoneNum+" 으로 변경되었습니다.").css(
//                     {"color": "#C50532","position":"absolute","top":"50px","left":"110px"});
//                 return false;
//             }//success end
//         })//ajax end
//     });//keyup end

    $(".send_number").click(function () {
    	
    	let phoneNum = $("#userPhoneInput").val();
    	// console.log(phoneNum);
    	
        alert(phoneNum+"로 인증번호를 발송했습니다. 확인하여 3분 안에 기입해주세요.");
        // $(".phone_num_change_success").text('');
        return false;
    }); // 휴대폰 인증번호 발송 btn click end

  	//인증번호 일치 유효성 검사.
	function testPhoneNumConfirm() {
    	
        let phoneNumconfirm = $("#accountPhoneConfirm");
        let confirmSuccess = $("#accountPhoneConfirm").val();

	    if ( phoneNumconfirm == null || confirmSuccess != "1234") {
	        $(".phone_num_confirm_success").text("올바른 인증 번호를 입력해주세요.").css(
	            {"color": "#C50532","position":"absolute","top":"123px","left":"100px"});
	        phoneNumconfirm.val('');
	        phoneNumconfirm.focus();
	        return false;
	    }else {
	        $(".phone_num_confirm_success").text("본인 인증이 완료되었습니다.");
	    }//if ~ else end
    
    }
    
    $(".phone_num_confirm").on("click", function () {

        let phoneNumconfirm = $("#accountPhoneConfirm");
        let confirmSuccess = $("#accountPhoneConfirm").val();

        
        testPhoneNumConfirm();
        
    });// 인증번호 확인 btn end
    
    $("#phoneNumUpdateCompleteBtn").on("click",function(){
    	
    	let phoneNum = $("#userPhoneInput").val();

    	$.ajax({
    		url:"/ajax/updatePhoneNum/${loginUser.no}/"+phoneNum,
    		type:"PUT",
    		datatype:"json",
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			console.log(json);
    			
    			$("#userPhoneInput").css("display","none");
    			$("#userPhoneDiv").text(phoneNum);
    			$("#userPhoneDiv").css("display","block");
    			$("#phoneNumUpdateCompleteBtn").css("display","none");
    			$("#phoneNumUpdateBtn").css("display","block");
    			$("#accountPhoneConfirm").css("display","none");
    			$(".phone_num_confirm").css("display","none");
    			$(".send_number").css("display","none");
    			$(".phone_num_confirm_success").css("display","none");
    			

                $(".phone_change_success").text("전화번호가 성공적으로 변경되었습니다.").css({"display":"block","position":"relative","z-index":"1","left":"105px","top":"35px"});
    		}
    	});//$.ajax() end

    }) // 전화번호 수정 완료 btn click end
    
    
    function getMyCardList(){
    	$.ajax({
    		url:"/ajax/myCardList/${loginUser.no}",
    		type:"GET",
    		datatype:"json",
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			
    			if(json.length==0){
    				$("#creditCardSelectInner").html(notYetTmp({"cards":json}));
    			} else{
    				$("#creditCardSelectInner").html(cardListTmp({"cards":json}));
    			}    		
    		}
    	});//$.ajax() end
    }// getMyCardList() end 
    
    getMyCardList();
    
 	// ***************************************************** 카드 관련 메소드
 	
    $(".credit_card_popup_register").on("click",function(){
    	
    	let bankNo = $(".card_list_select").val();
    	let engName = $(".last_name").val()+$(".first_name").val();
    	let num1 = $(".card_information_insert_input1").val();
    	let num2 = $(".card_information_insert_input2").val();
    	let num3 = $(".card_information_insert_input3").val();
    	let num4 = $(".card_information_insert_input4").val();
    	let num = num1 + num2 + num3+ num4;
    	let dueMonth = $(".credit_card_month").val();
    	let dueYear = $(".credit_card_year").val();
    	let cvc = $(".credit_card_cvc").val();
    	
    	// let userNo = ${loginUser.no};
    
    	$.ajax({
    		url:"/ajax/addCard",
    		type:"POST",
    		datatype:"json",
    		data:{
    			bankNo : bankNo,
    			engName : engName,
    			num : num,
    			dueMonth : dueMonth,
    			dueYear : dueYear,
    			cvc : cvc,
    			userNo : userNo
    		},
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			getMyCardList();
    		}
    	});//$.ajax() end
    }) // 카드 등록 버튼 클릭시 
    
    $("#creditCardSelectInner").on("click",".remove_card",function(){
    	
    	let cardNo = this.dataset.cardno;
    	
    	$.ajax({
    		url:"/ajax/removeCard/"+cardNo,
    		type:"DELETE",
    		datatype:"json",
    		error:function(){
    			alert("에런데영");
    		},
    		success:function(){
    			getMyCardList();
    		}
    	})
    	
    }); // 카드 제거 end

    
	$("#creditCardSelectInner").on("click",".default_setting",function(){
    	
    	let cardNo = this.dataset.cardno;
    	
    	
    	let userNo = ${loginUser.no};
    	
    	$.ajax({
    		url:"/ajax/setDefault/"+userNo+"/"+cardNo,
    		type:"PUT",
    		datatype:"json",
    		error:function(){
    			alert("에런데영");
    		},
    		success:function(){
    			getMyCardList();
    		}
    	})
    	
    }); // 기본 카드로 지정
	
    $("#removeAccount").on("click",function(){
    	
    	location.reload();
    });
    
 	// ***************************************************** 계좌 추가

 	    $(".account_popup_register").on("click",function(){
    	
    	let bankNo = $(".bank_list_select").val();
    	let name = $("#accountUserName").val();
    	console.log(name);
    	let num = $("#accountNum").val();

    	let userNo = ${loginUser.no};
    
    	$.ajax({
    		url:"/ajax/addAccount",
    		type:"POST",
    		datatype:"json",
    		data:{
    			bankNo : bankNo,
    			name : name,
    			num : num,
    			userNo : userNo
    		},
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			getMyAccount();
    		}
    	});//$.ajax() end
    }) // 계좌 등록 버튼 클릭시 
 	
    function getMyAccount(){
    	$.ajax({
    		url:"/ajax/myAccount/${loginUser.no}",
    		type:"GET",
    		datatype:"json",
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			// console.log(json);
    			console.log(json);
    			// remove(this);
    			$("#receiptAccountSelectInner").html(accountTmp({"account":json}));
    		}
    	});//$.ajax() end
    }// getMyAccount() end 
    
    
//     $("#logout").click(function () {
		
//     	window.location.href = 'http://localhost/index'
// 	});
    
 
    
</script>
</body>
</html>