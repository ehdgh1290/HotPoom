<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<div id="headerSection">
		<a href="/"><img id="headerLogo" src="/img/logo.png"></a>
		<input id="headerSearch" placeholder="어디에">
		<button id="headerSearchBtn" class="btn"><i class="fas fa-search"></i></button>
		<c:if test="${loginUser!=null}">
		<div id="gnbWrap">
			<div id="gnb">
				<a id="headerBookmark" href="/bookmark">북마크</a>
				<a id="headerMessage" href="/message">메시지</a> 
				<a id="headerBooking" href="/booking">예약내역</a>
			</div>
			<div>
				<img id="headerProfileImage" src="/profile/user/${loginUser.profileImg }" />
				<ul id="lnb">
					<li><a href="/user/${loginUser.no}">마이페이지</a></li>
					<li><a href="/account">개인정보 및 결제</a></li>
					<li><a href="/business">비지니스 전환</a></li>
					<li><button id="logout" class="btn" form="logoutForm" type="submit">로그아웃</button></li>
				</ul>
				<form id="logoutForm" action="/session" method="post">
				<input type="hidden" name="_method" value="delete"/>
				</form>
			</div>
			</div>
		</c:if>
		<a id="headerLogin" ${loginUser!=null?"class='hide'":""}>로그인</a>
	</div>
</header>
<main id="content">
<div id="bg">
	<div id="loginPopup">
		<span id="loginTitle">Login</span><i class="far fa-times-circle cursor_pointer"></i>
		<span class="loginPopup_text">이메일</span>
		<input form="loginForm" name="email" id="idInput" class="loginPopup_input">
		<span class="loginPopup_text">비밀번호</span>
		<input form="loginForm" name="password" id="passwordInput" class="loginPopup_input" type="password">
		<div class="msg">아이디와 비밀번호가 맞지 않습니다.</div>
		<button form="loginForm" type="submit" id="loginBtn" class="btn cursor_pointer">로그인</button>
		<span id="passwordInfo">비밀번호가 기억나지 않으세요?</span>
		<a href="/password" id="findPasswordBtn" class="cursor_pointer">비밀번호찾기</a>
		<span id="joinInfo">핫품 계정이 없으세요?</span>
		<a href="/signUp" id="joinBtn" class="cursor_pointer">회원가입</a>
		<form id="loginForm" action="/session" method="post"></form>
	</div><!-- //loginPopup -->
</div><!-- //bg -->
<!-- <div id="bg">
    <div id="loginPopup">
        <span id="loginTitle">Login</span>
        <i class="far fa-times-circle cursor_pointer"></i>
        <span class="loginPopup_text">이메일</span>
        <input id="idInput" class="loginPopup_input">
        <span class="loginPopup_text">비밀번호</span>
        <input id="passwordInput" class="loginPopup_input" type="password">
        <button id="loginBtn" class="btn cursor_pointer">로그인</button>
        <span id="passwordInfo">비밀번호가 기억나지 않으세요?</span>
        <a id="findPasswordBtn" class="cursor_pointer">비밀번호찾기</a>
        <span id="joinInfo">핫품 계정이 없으세요?</span>
        <a id="joinBtn" class="cursor_pointer">회원가입</a>
    </div>//loginPopup
</div>//bg -->