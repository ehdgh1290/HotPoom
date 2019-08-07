<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/passwordFindForm.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
    <div id="passwordFindSection">
        <p>비밀번호 찾기</p>
        <p>계정으로 등록된 이메일 주소를 입력하시면<br>비밀번호 재설정 링크를 전송해드립니다.</p>
        <p>이메일 주소</p>
        <p id="passwordCheckMsg">올바른 이메일 형식을 입력해주세요.</p>
        <form id="passwordFindForm" action="/user/password/find" method="post">
            <input id="emailInput" name="email" autocomplete="off" placeholder="ex) people@gmail.com">
            <button id="passwordFindBtn" type="submit" class="btn">전 송</button>
        </form>
    </div><!--//passwordFindForm-->
    <div id="bg">
        <div id="passwordFindPopup">
            <p><span></span>으로 <br>비밀번호 재설정 링크를 보냈습니다.<br>링크를 클릭하여 비밀번호를 재설정하세요.</p>
            <a id="emailLinkBtn" href="">비밀번호 재설정하러 가기</a>
        </div>
    </div>
<c:import url="/WEB-INF/template/footer.jsp"/>
<script>
    /* -----------------------------------------------------비밀번호 찾기---------------------------------------- */

    let email = "";
    let $passwordFindBtn = $("#passwordFindBtn");
    let $emailInput = $("#emailInput");
    let $passwordFindPopupSpan = $("#passwordFindPopup span");
    let $bg = $("#bg");
    let $passwordCheckMsg = $("#passwordCheckMsg");
    let $emailLinkBtn = $("#emailLinkBtn");
    
    let flag = true;

    $passwordFindBtn.on("click", function (e) {
    	e.preventDefault();
    	if(flag){
    	email = $emailInput.val();
        $passwordFindPopupSpan.text(email);
        
        //let subCheck = email.indexOf("@");
        //let site = email.substring(subCheck+1,email.length);
        
        let site = email.substring(email.indexOf("@")+1);
        
        var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (regEmail.test(email)) {      	
        	$.ajax({
                url:"/ajax/send/email",
                dataType:"json",
                type:"post",
                data:{email:email},
                error:function () {
                    alert("서버점검중입니다.");
                },
                success:function (data) {
                	 console.log(data);                	
                	 if(data >= 1) {
                		 $bg.css("display","block");
                     	 $passwordCheckMsg.css("display", "none");
                     	 $emailLinkBtn.attr("href","https://www." + site);
                     	 flag = false;
                     }else {
                    	 $passwordCheckMsg.text("존재하지 않는 아이디입니다.");
                    	 $passwordCheckMsg.css("display", "block");
                     }              	
                }//success end
            });//$.ajax() end
        } else {
        	$passwordCheckMsg.css("display", "block");
        }
    	}
    });//passwordFindBtn click end

    
    

</script>
</body>
</html>