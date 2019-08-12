<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOTPOOM</title>
    <c:import url="/WEB-INF/template/buisnessLink.jsp"/>
    <link rel="stylesheet" href="/css/receipt.css">
</head>
<body>
<c:if test="${loginUser==null }">
	<c:redirect url="/index"/>
</c:if>
<c:import url="/WEB-INF/template/businessHeader.jsp"/>
	<div id="receiptSection">
	<h2>대금수령 내역</h2>
	<div class="title">숙소선택</div>
    <div id="selectWrap">
		<select id="startYear" name="startYear">
			<c:forEach var="i" begin="0" end="119" step="1">
				<option value="${2019-i}">${2019-i}년</option>
			</c:forEach>
		</select>
		<select id="startMonth" name="startMonth">
			<c:forEach var="i" begin="1" end="12">
				<option value="${i}" ${i==7?"selected":""}>${i}월</option>
			</c:forEach>
		</select>
		<span>~</span>
		<select id="endYear" name="endYear">
			<c:forEach var="i" begin="0" end="119" step="1">
				<option value="${2019-i}">${2019-i}년</option>
			</c:forEach>
		</select>
		<select id="endMonth" name="endMonth">
			<c:forEach var="i" begin="1" end="12">
				<option value="${i}" ${i==7?"selected":""}>${i}월</option>
			</c:forEach>
		</select>
		<select id="myPoomList" name="poomNo">
			<option value="26">jbp 개터파크는 특별합니다.</option>
			<option>라이언 농장에 오신걸 환영합니다~</option>
			<option>계속 보다보면 너무 귀엽답니다. 물개랜드</option>
			<option>뱀 돌봐주는 하선이네</option>
			<option>조용하고 느리지만 빠른 지금이의 거북이 ...</option>
		</select>
    </div><!-- //selectWrap -->
    <div id="contentWrap">
    <ul>
    	<li id="titleLl"><!-- title li -->
    		<ul id="titleUl">
	   			<li class="receipt_date">수령 날짜</li>
	   			<li class="bank_account">계 좌</li>
	   			<li class="price">금 액</li>
   			</ul>
    	</li>
    	
    	<li class="content_li"><!-- content li 반복 -->
    		<ul class="content_ul">
	    		<li class="receipt_date">2019.07.15</li>
	    		<li class="bank_account">신한 110-492-015256</li>
	    		<li class="price">&#8361; <fmt:formatNumber value="120000"/></li>
    		</ul>
    	</li>
    	<li class="content_li">
    		<ul class="content_ul">
	    		<li class="receipt_date">2019.07.17</li>
	    		<li class="bank_account">신한 110-492-015256</li>
	    		<li class="price">&#8361; <fmt:formatNumber value="120000"/></li>
    		</ul>
    	</li>
    	<li class="content_li">
    		<ul class="content_ul">
	    		<li class="receipt_date">2019.07.22</li>
	    		<li class="bank_account">신한 110-492-015256</li>
	    		<li class="price">&#8361; <fmt:formatNumber value="160000"/></li>
    		</ul>
    	</li>
    	<li class="content_li">
    		<ul class="content_ul">
	    		<li class="receipt_date">2019.07.24</li>
	    		<li class="bank_account">신한 110-492-015256</li>
	    		<li class="price">&#8361; <fmt:formatNumber value="400000"/></li>
    		</ul>
    	</li>
    	
    </ul>
    	<span id="totalAmount">수령완료 금액 : &#8361; <fmt:formatNumber value="800000"/></span>
    </div><!-- //contentWrap -->
    </div><!-- //receiptSection -->
<c:import url="/WEB-INF/template/businessFooter.jsp"/>
</body>
</html>