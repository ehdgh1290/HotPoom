<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="paymentBg" class="bg">
    <div id="paymentPopup">
        <button type="button" class="close_popup far fa-times-circle"></button>
        <h3>결제</h3>
            <form id="reviewRegisterForm" action="" method="post">
            <div id="date" class="title">기간</div>
            <div id="dateContent">08.18 ~ 08.19, 2019</div>
            <div id="pet" class="title">펫</div>
            <div id="petContent">고양이 2마리</div>
            <div id="pay" class="title">금액</div>
            <div id="payContent">88,000원</div>
            <div id="paymentMethod" class="title">결제수단 선택</div>
            <select name="cardNo" id="paymentMethodSelect">
                <option value="1">신한 - 8409</option>
                <option value="2">농협 - 1204</option>
            </select>
            <button type="button" id="addCredit" class="btn">결제수단 추가</button><!--//없을때만 select없애고 넣기-->
            <div id="request" class="title">요청사항 작성</div>
            <textarea id="requestTextarea" name="" placeholder="요청사항을 입력해주세요."></textarea>
        <button type="submit" id="paymentBtn" class="btn">결제하기</button>
        </form>
    </div><!--//paymentPopup-->

    <div id="creditCardAddPopup">
        <button type="button" class="close_popup far fa-times-circle"></button>
        <h4>결제수단 추가</h4>
        <form id="creditCardAddForm" action="" method="post">
        <div id="creditCardSelectWrap">
            <h5 class="title">카드</h5>
            <input type="hidden" name="bankType" value="C"/>
            <select id="cardSelect" name='bankNo'  class='card_list_select'>
            	<c:forEach items="${cardList }" var="card">
                <option value='${card.no }'>${card.name }</option>
                </c:forEach>
            </select>
        </div><!--//creditCardSelectWrap-->
        <div id="cardPersonInsertWrap">
            <div id="cardPersonNameInsertInner">
                <h5 class="title">이름</h5>
                <input name="name" class="card_name_insert_input" placeholder="이름"/>
            </div><!--//cardPersonNameInsertInner-->
        </div><!--//cardPersonInsertWrap-->
        <div id="cardInformaionInsertWrap">
            <h5 class="title">카드 정보</h5>
            <input maxlength="4" id="cardInformationInput1" placeholder="카드번호"/> -
            <input maxlength="4" id="cardInformationInput2" placeholder="카드번호"/> -
            <input maxlength="4" id="cardInformationInput3" placeholder="카드번호"/> -
            <input maxlength="4" id="cardInformationInput4" placeholder="카드번호"/>
            <div id="cardInformaionInsertInner">
                <span class="card_information_detail limit">만료일</span>
                <input name="month" class="card_information_detail_input credit_card_month" placeholder="월"/>
                <span class="card_information_detail slash">/</span>
                <input name="year" class="card_information_detail_input credit_card_year" placeholder="년도"/>
                <span class="card_information_detail">cvc</span>
                <input name="cvc" class="card_information_detail_input" placeholder="cvc"/>
            </div><!-- //cardInformaionInsertInner -->
        </div><!-- //cardInformaionInsertWrap -->
        <button type="submit" id="creditCardRegisterBtn" class="btn">등 록</button>
        </form>
	</div>
</div><!-- //paymentBg -->