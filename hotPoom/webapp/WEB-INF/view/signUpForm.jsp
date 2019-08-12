<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/signUpForm.css"/>
    <link rel="stylesheet" href="/css/default.css">
</head>
<style>
#signUpForm{
	position: relative;
	min-height: 500px;
	margin-top: 30px;
}

#signUpForm h3{
	margin: 20px 0 20px 0;
	font-weight: bold;
}

.sign_up_legend{
	margin-bottom: 20px;
}

.hr{
	border-width: 2px 0 0;
}

.sign_up_input{
	width: 200px;
	text-indent: 5px;
}

#emailCheckBtn{
	position: absolute;
	left: 220px;
	top: 230px;
}

.btn.register{
	padding: 5px;
}

#numBtn{
	position: relative;
	left: 15px;
}

.btn.register.success{
	margin: 30px 0 30px 0; 
}

#content{
	position: relative;
	margin: auto;
	min-height: 800px;
}

#signUpForm select{
	height: 30px;
	width: 70px;
}

#signUp{
	position: relative;
}
.true{
    color:#42A5F5;
    margin:10px 0;
    display: none;
}

</style>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<div id="signUpSection">
    <form id="signUpForm" action="/join" method="POST">
        <fieldset class="sign_up_fieldset">
            <legend class="sign_up_legend">회원가입</legend>
            <hr class="hr">

            <div id="nameRegisterWrap">
                <h3>이름</h3>
                    <input id="nameRegisterInput" name="name" autocomplete="none" placeholder="이름을 입력해주세요" class="sign_up_input"/>
                    <div class="name_insert"></div>
            </div>
            <div id="IdPwdRegisterWrap">
                <h3>아이디/비밀번호</h3>
                <div id="emailRegisterInner">
                    <input id="emailRegisterInput" name="email" autocomplete="none" placeholder="xxxx@naver.com" class="sign_up_input"/>
                    <button type="button" id="emailCheckBtn" class="btn register email_check">중복 확인</button>
                </div>
                <span class="msg wrong_email_form">올바른 아이디 형식을 지켜주세요 :(</span>
                <span class="msg email_check_fail">해당 이메일은 이미 등록된 이메일입니다.</span>
                <span class="msg true email_check_success">사용 가능한 이메일입니다.</span>                
                <div id="passwordRegisterInner">
                    <div id="passwordRegister">
                        <input type="password"  id="passwordRegisterInput" name="password" autocomplete="none"
                           placeholder=" 비밀번호" class="sign_up_input"/><span class="msg password_confirm">제대로 된 비밀번호를 입력해주세요.</span>
                    </div>
                    <input type="password" id="passwordCheckInput" name="passwordCheck" autocomplete="none"
                           placeholder=" 비밀번호확인" class="sign_up_input">
                    <span class="msg password_check"> 비밀번호를 똑같이 재입력주세요</span>
                </div>
            </div>
            <div id="genderRegisterWrap">
                <h3>성별</h3>
                    <label for="female">
                        <input type='radio' id="female" name='gender' value='F' checked/>여성
                    </label>
                    <label for="male">
                        <input type='radio' id="male" name='gender' value='M' />남성
                    </label>
            </div>
            <div id="birthRegisterWrap">
                <h3>생년월일</h3>
                <p>
                    <select id="year" name="year" value=""></select>&nbsp;년&nbsp;&nbsp; 
                    <select id="month" name="month" value=""></select>&nbsp;월&nbsp;&nbsp;  
                    <select id="date" name="date" value=""></select>&nbsp;일&nbsp;&nbsp;  
                </p>
            </div>
            <div id="phoneNumRegisterWrap">
                <h3>휴대전화</h3>
                <input maxlength="11" id="phoneNumInput" name="phoneNum" autocomplete="off" placeholder="입력 방식 ex.01012344575 " class="sign_up_input"/>
                <button type="button" id="numBtn" class="btn register authentication" value="numBtn">인증번호 받기</button>
                <div>
                <span class="msg phone_num_insert">올바른 핸드폰 번호를 입력해주세요.</span>
                <input id="phoneNumConfirm" name="phoneNumConfirm" autocomplete="off" placeholder=" 인증번호 입력" class="sign_up_input"/>
                <span class="msg phone_num_confirm">올바른 인증번호를 입력해주세요.</span>
                </div>
            </div>
            <!--가입확인 버튼 처음에 비활성화-->
            <button id="signUp" class="btn register success">가입하기</button>
        </fieldset>
    </form>
</div><!--wrap-->
<c:import url="/WEB-INF/template/footer.jsp"/>


<script>
	let $userName = $("#nameRegisterInput");
	let $email = $("#emailRegisterInput");
	
	let $password = $("#passwordRegisterInput");
	let $passwordCheck = $("#passwordCheckInput");
	let $phoneNumCheck = $("#phoneNumConfirm");
	
	//1) 변수 선언
	let $year =$("#year");
	let $month = $("#month");
	let $date = $("#date");
	
	//2) 년도와 월에 따라 날짜 받도록 년,월 change
	$("#year").change(makeDate);
	$("#month").change(makeDate);
	
	//3) month메서드 함수
	function makeMonth() {
	
	    //4) 날짜 만들기
	    for (var i = 1; i < 13; i++ ) {
	        //$("<option>").appendTo($month).text(i+"월").attr("value"+i);
	        $("<option>").appendTo($month).text(i);
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
	
	
	function makeDate() {
	
	    var selectDate = $date.val();
	
	    //0) 이전의 option요소를 비움
	    $date.empty();
	
	    let lastDate = getLastDate();
	
	    for (let i = 1; i < lastDate; i++ ) {
	
	        let $option = $("<option>").appendTo($date).text(i);
	
	        if (i == selectDate) {
	            $option.attr("selected",true);
	        }//if end
	
	    }//for end
	
	}//makeDate() end
	
	
	function getLastDate() {
	
	    //1) 년도 얻기
	    let year = $year.val();
	
	    //2) 월 얻기
	    let month = $month.val();
	
	    //3) 해당년도와 월을 가지고 moment객체를 생성
	    let that = moment([year,month-1]);
	
	    //4) 마지막 날자로 변경(moment객체)하고, 마지막 날짜를 얻음(숫자형)
	    let lastDate = that.endOf("month").date();
	
	    return lastDate+1;
	}//getLastDate() end
	
	//-----------------------> date
	
	makeYear();
	makeMonth();
	makeDate();
	
	
	let nameExp = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,20}$/;
	let emailExp = /^[0-9a-zA-Z]{5,30}@[a-z]{1,10}\.[a-z]{2,3}$/i;
	let passwordExp = /^.*(?=.{6,12})(?=.*[\0-9])(?=.*[a-zA-Z]).*$/;
	
	let nameFlag = false;
	let emailFlag = false;
	
	let $nameCheck = $("#nameCheckBtn")
	let $emailCheck = $("#emailCheckBtn");//중복 확인 버튼
	
	let $nameMsg = $(".name_insert");
	let $emailMsg = $(".msg.email_check_fail");//span
	let $emailSuccessMsg = $(".msg.true.email_check_success");//span
	let $emailFormMsg = $(".msg.wrong_email_form");
	let $passwordMsg = $(".msg.password_confirm");
	let $passwordCheckMsg = $(".msg.password_check");
	let $phoneNumMsg = $(".msg.phone_num_insert");
	let $authenticationMsg = $(".msg.phone_num_confirm");

	    //id입력창에 글이 써지면 수행하는 함수
	    $email.blur(function(){
	        let email = $email.val();
	        //id값이 공백이 아닐때
	        if(email != ''){
	            //정규표현식 검사
	            if(emailExp.test(email)){
	                emailFlag=true;
	                //올바를 경우 id메세지 사라짐
	                $emailFormMsg.text('');
	            }
	            else{
	                //id가 정규표현식에 맞지 않을때
	                //메세지 띄워주고 입력창에 글씨 사라지면서 포커스 맞춤
	                $emailFormMsg.css("display","block");
	                $email.val('');
	                $email.focus();
	                return false;
	            }
	        }
	        return false;
	    });

	
	    //id입력창에 글이 써지면 수행하는 함수
	    $email.blur(function(){
	        let email = $email.val();
	        //id값이 공백이 아닐때
	        if(email != ''){
	            //정규표현식 검사
	            if(emailExp.test(email)){
	                emailFlag=true;
	                //올바를 경우 id메세지 사라짐
	                $emailFormMsg.text('');
	            }
	            else{
	                //id가 정규표현식에 맞지 않을때
	                //메세지 띄워주고 입력창에 글씨 사라지면서 포커스 맞춤
	                $emailFormMsg.css("display","block");
	                $email.val('');
	                $email.focus();
	                return false;
	            }
	        }
	        return false;
	    });

	
	// 이메일 중복검사 버튼 눌렀을때 실행되는 이벤트
	$emailCheck.click(function () {
		
		let email = $email.val();

	    // 정규표현식에 맞을 경우에만 실행
	    if(emailFlag){
			// console.log("어디니");
	        $.ajax({
	        	url:"/ajax/email/"+email,
	            dataType:"json",
	            data:{"check":email},
	            type:"GET",
	            success : function(json) {
	            	console.log(json);
	                let emailValue="";

 				   if(json.result == true) {
 					  $emailSuccessMsg.css("display","block");
 					  $emailMsg.css("display","none");
				   }else {
					   $emailMsg.css("display","block");
					   $emailSuccessMsg.css("display","none");
				   }//if~else end
				   
	                if(emailValue!=""){
	                    $emailMsg.css("display","block");
	                    $email.val('');
	                    $email.focus();
	                    return false;
	                }//if end
	            },
	            error : function() {
	                alert("서버점검중");
	            }
	        });
	    }
	});
	
	
	//password
	
	    $password.blur(function(){
	        let password = $password.val();
	        if(password != ''){
	            if(passwordExp.test(password)){
	                //alert("올바름"+password);
	                $passwordMsg.css("display","none");
	            }
	            else{
	                //alert("올바르지 않음"+password);
	                $passwordMsg.css("display","block");
	                $password.val('');
	                $password.focus();
	                return false;
	            }
	        }
	    });
	
	
	//비밀번호 확인
	    $passwordCheck.blur(function(){
	        if($password.val() != $passwordCheck.val()){
	            if($passwordCheck.val()!=''){
	                $passwordCheckMsg.css("display","block");
	                $passwordCheck.val('');
	                $passwordCheck.focus();
	                return false;
	            }
	        }
	        else{
	            if($passwordCheck.val()!='') {
	                $passwordCheckMsg.css("display","none");
	                //alert("성공");
	            }else{
	                $passwordMsg.css("display","block");
	                $password.val('');
	                $password.focus();
	                return  false;
	            }
	        }
	    });

	
	let regularPhoneNum = /^[0-9]*$/;
	let phoneNum = null;
	
	// 전화번호 유효성 검사
	function testPhoneNum() {
	
	    phoneNum = $("#phoneNumInput").val();
	
	    if (!regularPhoneNum.test(phoneNum)) {
	        $("#phoneNumInput").val('');
	        $("#phoneNumInput").focus();
	        $phoneNumMsg.css("display", "block");
	        return false;
	
	    } else {
	        if (phoneNum.length > 11 || phoneNum.length < 10) {
	            $phoneNumMsg.css("display", "block");
	            return false;
	        } else {
	            $phoneNumMsg.css("display", "none");
	            return true;
	        }//안쪽 if~else end
	    }//바깥 if~else end
	
	};//testPhoneNum() end
	
	//인증번호를 누르면 alart 창으로 발송하였다는 확인 메세지.
	$("#numBtn").click(function () {
	    alert(phoneNum+"로 인증번호를 발송했습니다. 확인하여 3분 안에 기입해주세요.");
	    return false;
	}); //click end
	
	
	//인증번호 일치 유효성 검사.
	function testPhoneNumConfirm() {
	
	    //그 값(value)를 얻어옴
	    let phoneNumCheck = $phoneNumCheck.val();
	
	    //임의의 인증번호 값 부여
	    if( phoneNumCheck != "1129" ) {
	        $authenticationMsg.css("display","block");
	        return false;
	    }else {
	        $authenticationMsg.css("display","none");
	        return true;
	    }//if end
	}//testNumCfm() end
	
	
	$("#signUpForm").on("submit",function () {
		
		//return true;
	
		// alert("z");
		
		
	    if ($("#nameRegisterInput").val()==""){ 
	    	alert("이름은 필수 기재 사항입니다.");
	    	return false;
	    }
	
	    if(!testPhoneNum()){
	    	//alert("전화번호 유효성");
	        return false;
	    }
	
	    if(!testPhoneNumConfirm()) {
	       // return false;
	    	return false;
	    }
	
	    return true;
	    
	});//submit() end
	
	// $("#nameRegisterInput").keyup(testName);
	$("#phoneNumInput").keyup(testPhoneNum);
	$phoneNumCheck.keyup(testPhoneNumConfirm);


</script>
</body>
</html>