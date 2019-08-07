<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<div id="headerSection">
		<img id="headerLogo" src="/img/logo.png">
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
						<li><a href="/user/${loginUser.no }">마이페이지</a></li>
						<li><a href="/account">개인정보 및 결제</a></li>
						<li>비지니스 전환</li>
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
