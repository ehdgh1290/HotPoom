<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</main>
<footer id="footer">
    <img id="footerLogo" src="/img/footerLogo.png" width="50" height="50">
    <address>&copy; 2019 HotPoom, Inc. All rights reserved.</address>
    <div id="policy">
        <ul>
            <li><a href="">회사소개</a></li><!--
         --><li><a href="">광고</a></li><!--
         --><li><a href="">검색등록</a></li><!--
         --><li><a href="">제휴제안</a></li><!--
         --><li><a href="">이용약관</a></li><!--
         --><li><a href=""><strong>개인정보이용약관</strong></a></li><!--
         --><li><a href="">청소년보호정책</a></li><!--
         --><li><a href="">고객센터</a></li>
        </ul>
    </div><!--//policy -->
</footer><!--// footer -->
<script>
$headerProfileImage = $("#headerProfileImage");
$lnb = $("#lnb");
$headerLogin = $("#headerLogin");
$loginPopup = $("#loginPopup");
$loginPopupClose = $("#loginPopup i");
$loginForm = $("#loginForm");
$body = $("body");
$loginPopupMsg = $("#loginPopup .msg");
$idInput = $("#idInput");
$passwordInput = $("#passwordInput");


$headerProfileImage.click(function (e) {

    $lnb.slideToggle(200);
    e.stopPropagation();
});//$headerProfileImage click end

$headerLogin.click(function () {
	//console.log("로그인 클릭");
	$loginPopup.parent().show();
    //$("#gnbWrap").show();
    //$(this).hide();
});//$headerLogin click end

$body.click(function () {
    // alert("zz");
    $lnb.hide();
});//$body click end
$loginPopupClose.on("click",function(){
	//console.log("로그인 닫기");
	$(this).parents("#bg").hide();
});//$loginPopupClose click end

<c:if test="${loginFail }">
$loginPopupMsg.show();
$loginPopup.parent().show();
</c:if>
</script>
