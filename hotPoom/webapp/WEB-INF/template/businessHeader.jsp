<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${loginUser==null }">
	<c:redirect url="/"/>
</c:if>
<header id="header">
	<div id="headerSection">
		<a href="/business"><img id="headerLogo" src="/img/businesslogo.png"></a>
		<div id="gnbWrap">
			<div id="gnb">
				<a id="headerBookmark" href="/business">홈</a>
				<a id="headerReservation" href="/reservation">예약</a> 
				<a id="headerCalendar" href="/calender">달력</a>
				<a id="headerPoom" href="/hosting/poom">품</a>
				<a id="headerResult" href="/chart">실적</a>
				<a id="headerMessage" href="/business/message">메세지</a>

			</div><!-- //gnb -->
			<div>
				<a id="poomRegister" href="/poom/register">품 등록하기</a>
				<img id="headerProfileImage" src="/profile/user/${loginUser.profileImg }" />
				<ul id="lnb">
					<li><a href="/userPage/${loginUser.no}">마이페이지</a></li>
					<li><a href="/account">개인정보 및 결제</a></li>
					<li><a href="/buisness/receipt">대금수령 내역</a></li>
					<li><a href="/">일반회원 전환</a></li>
					<li><button id="logout" class="btn" form="logoutForm" type="submit">로그아웃</button></li>
				</ul>
				<form id="logoutForm" action="/session" method="post">
					<input type="hidden" name="_method" value="delete"/>
				</form>
			</div><!-- //div -->
		</div><!-- //gnbWrap -->
	</div><!-- //headerSection -->
</header>
<main id="content">