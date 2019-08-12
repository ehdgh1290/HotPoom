<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
     <c:import url="/WEB-INF/template/buisnessLink.jsp"/>
</head>
    <style>
        #contentAll{
            width: 1100px;
            min-height: 1080px;
            margin: auto;
            position: relative;
        }

        #content1{
            width: 700px;
            min-height: 540px;
            position: relative;
            float: left;
            text-align: center;
        }

        #content2{
            width: 700px;
            min-height: 540px;
            position: relative;
            float: left;
            text-align: center;
        }

        #content3{
            width: 400px;
            min-height: 1080px;
            position: absolute;
            top: 0;
            right: 0;
            text-align: center;

        }

        #line{
            background: #9e9e9e;
            height: 3px;
            width: 630px;
            border-radius: 50px;
            position: absolute;
            top: 540px;
            left: 40px;
            z-index: 10;


        }

        #line2{
            width: 3px;
            height: 1060px;
            background: #9e9e9e;
            position: absolute;
            right: 400px;
            top: 10px;



        }

        .box{
            margin: auto;
            margin-bottom: 10px;
            width: 630px;
            height: 90px;
            line-height: 90px;
            background: #eeeeee;
            position: relative;
        }
        
        .box:hover{
        	cursor: pointer;
        	 box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

		#content h1{
			margin-top: 30px;
			margin-bottom: 30px;
			font-weight: bold;
			font-size: 20px
		}
	

       .s1{
           position: absolute;
           top: 5px;
           left: 35px;

       }

       .s2{
           position: absolute;
           top: 5px;
           left: 105px;
       }

       .s3{
           position: absolute;
           top: 5px;
           left: 230px;
       }

       .s4{
           position: absolute;
           top: 5px;
           left: 330px;
       }

       .s5{
           position: absolute;
           top: 5px;
           left: 450px;
       }

        .s6{
            position: absolute;
            top: 5px;
            left: 30px;
        }

        .s7{
            position: absolute;
            top: 5px;
            left: 110px;
        }

        .s8{
            position: absolute;
            top: 5px;
            left: 250px;
        }

        .s9{
            position: absolute;
            top: 5px;
            left: 360px;
        }

        .s10{
            position: absolute;
            top: 5px;
            left: 460px;
        }

        #box{
            background: #fff;
            margin-bottom: 0px;
        }

        .message{
            position: absolute;
            top: 33px;
            right: 15px;
            width: 70px;
            height: 30px;
            background: #0F8B8F;
            line-height: 30px;
            color: #fff;
            border-radius: 10px;
        }
        
        .message:hover{
        	  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        	 cursor: pointer
        }
        

        #content img{
            width: 60px;
            height: 60px;
            border-radius: 60px;
            position: absolute;
            top: 15px;
            left: 15px;

        }

        #boxbox{
            margin: auto;
             box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            width: 350px;
            height: 170px;

        }
        
        #content ul{
        padding-top: 10px;
        }

        #content li{
            position: relative;
            margin-bottom: 10px;
            width:350px;
            height:20px
        }
        .c1{
            position: absolute;
            left:10px;
        }

        .c2{
            position: absolute;
            right:10px;
            
        }
        
        #box2{
        	margin-top: 30px
        }



    </style>


<body>
<c:if test="${loginUser==null }">
	<c:redirect url="/"/>
</c:if>
<c:import url="/WEB-INF/template/businessHeader.jsp"/>

    <div id="contentAll">
    <div id="content1">
        <h1>알림판</h1>
        <div id="box2" class="box">
            <img src="/img/defaultProfile.jpg"> 고도라님이 개터파크 예약을(를) 취소했습니다
        </div>
        <div class="box">
            <img src="/img/defaultProfile.jpg""> 고도라님이 개터파크 예약을(를) 했습니다
        </div>
        <div class="box">
            <img src="/img/defaultProfile.jpg""> 최수정님이 개터파크 예약을(를) 취소했습니다
        </div>

    </div>

        <div id="line"></div>

    <div id="content2">
        <h1>예약현황</h1>
        <div class="box box2" id="box">
            <span class="s6" >게스트</span><span class="s7">숙박 기간</span><span class="s8">숙소</span><span class="s9">펫</span><span class="s10">수입</span>
        </div>
        <div class="box box3">
            <span class="s1">쌀이맘</span><span class="s2">8.25 ~ 8.26</span><span class="s3">개터파크</span><span class="s4">강아지(+3)</span><span class="s5">111,000원</span>
            <div class="message">메세지</div>
        </div>
        <div class="box box3">
            <span class="s1">김자현</span><span class="s2">9.1 ~ 9.7</span><span class="s3">개터파크</span><span class="s4">강아지(+2)</span><span class="s5">444,000원</span>
            <div class="message">메세지</div>
        </div>
        <div class="box box3">
            <span class="s1">최수정</span><span class="s2">9.25 ~ 9.28</span><span class="s3">개터파크</span><span class="s4">강아지(+1)</span><span class="s5">111,000원</span>
            <div class="message">메세지</div>
        </div>
    </div>

        <div id="line2"></div>
    <div id="content3">
        <h1>호스팅 성과</h1>

        <div id="boxbox">
            <ul>
                <li> <span class="c1">7월 수입</span><span class="c2">&#8361;72,150,000</span> </li>
                <li> <span class="c1">지난 30일간 조회수</span><span class="c2">279</span></li>
                <li> <span class="c1">지난 30일간 예약</span><span class="c2">54건</span></li>
                <li> <span class="c1">전체평점</span><span class="c2">4.7</span></li>
                <li> <span class="c1">전체 후기 수</span><span class="c2">764</span></li>


            </ul>

        </div>


    </div>
    </div>
<c:import url="/WEB-INF/template/businessFooter.jsp"/>
<script>


$("#headerLogo").attr("src","/img/businesslogo.png");


</script>

</body>
</html>