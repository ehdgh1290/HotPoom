<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/passwordUpdateForm.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
    <form id="passwordUpdateSection" action="/user/password/update" method="post">
    <input type="hidden" name="no" value="${no}"/>
        <p>비밀번호 재설정</p>
        <input id="passwordInput" type="password" placeholder="새비밀번호">
        <p>신규 비밀번호</p>
        <input id="passwordCheckInput" type="password" name="password" placeholder="새비밀번호 확인">
        <p>비밀번호 확인</p>
        <span id="passwordCheck2">비밀번호가 같지 않습니다.</span>
        <span id="passwordCheck1">비밀번호는 영문, 숫자 혼합하여 6~20자리 이내입니다.</span>
        <button class="btn">비밀번호 변경</button>
    </form><!--//passwordUpdateSection-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script>
    /* -----------------------------------------------------비밀번호 수정---------------------------------------- */

    let password = "";
    let passwordCheck = "";
    let $passwordUpdateSection = $("#passwordUpdateSection");
    let $passwordInput = $("#passwordInput");
    let $passwordCheckInput = $("#passwordCheckInput");
    let $passwordCheck1 = $("#passwordCheck1");
    let $passwordCheck2 = $("#passwordCheck2");

    $passwordUpdateSection.on("submit", function () {

        password = $passwordInput.val();
        passwordCheck = $passwordCheckInput.val();

        let regPassword = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

        if(regPassword.test(password)) {
        	$passwordCheck1.css("display", "none");
        }

        if (!regPassword.test(password)) {
        	$passwordCheck1.css("display", "block");
            return false;
        } else if (password != passwordCheck) {
        	$passwordCheck2.css("display", "block");
            return false;
        }
        
       	//$passwordCheck2.text("비밀번호 변경이 완료되었습니다.");
       	//$passwordCheck2.css({
       	//	"color":"#339af0",
       	//	"display":"block"
       	//});
        //return false;

    });//passwordUpdateSection submit end
    
    
</script>
</body>
</html>