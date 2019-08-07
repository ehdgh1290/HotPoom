<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
    <div id="headerSection">
        <img id="headerLogo" src="/img/logo.png">
        <input id="headerSearch" placeholder="어디에">
        <button id="headerSearchBtn" class="btn"><i class="fas fa-search"></i></button>
        <div id="gnbWrap">
            <div id="gnb">
                <a id="headerBookmark" href="/bookmark">북마크</a>
                <a id="headerMessage" href="/message">메시지</a>
                <a id="headerBooking" href="/booking">예약내역</a>
            </div>
            <div>
            <img id="headerProfileImage" src="/profile/user/defaultProfile.jpg"/>
            <ul id="lnb">
               <li><a href="/userPage">마이페이지</a></li>
               <li><a href="/account">개인정보 및 결제</a></li>
               <li>비지니스 전환</li>
               <li>로그아웃</li>
            </ul>
            </div>
        </div>
            <a id="headerLogin">로그인</a>
    </div>
</header>
<main id="content">
<!-- 
<div id="bg">
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
    </div><!-- //loginPopup -->
<!--</div>--><!-- //bg -->