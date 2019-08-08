<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HOTPOOM</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="css/message.css">
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<div id="messageSection">
		<p id="pageTitle">메시지</p>
		<div id="messageListWrap">
			<input id="messageListSearch" placeholder="닉네임을 입력하세요.">
			<button id="messageListSearchBtn" class="btn">
				<i class="fas fa-search"></i>
			</button>
			<button id="messageListEditBtn" class="btn">
				<i class="fas fa-cog"></i>
			</button>
			<ul id="messageListInner">
				<li class="message_list receive"><img class="profile"
					src="profile/user/profile_3.jpg" width="60px" height="60px">
					<p class="nickname">앵주<i class="fas fa-circle"></i></p>
					<p class="message">화나요!</p> <time class="time">10분 전</time> <input
					type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list on"><img class="profile"
					src="profile/user/profile_2.jpg" width="60px" height="60px">
					<p class="nickname">도마뱀하선<i class="fas fa-circle"></i></p>
					<p class="message">도마뱀 가능??</p> <time class="time">17분 전</time> <input
					type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list receive"><img class="profile"
					src="profile/user/profile_4.png" width="60px" height="60px">
					<p class="nickname">수정이생일<i class="fas fa-circle"></i></p>
					<p class="message">수정이 생일인데 이벤트...</p> <time class="time">57분
						전</time> <input type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_5.jpg" width="60px" height="60px">
					<p class="nickname">자현</p>
					<p class="message">한달 빌리는데 얼마인가요?</p> <time class="time">1시간
						전</time> <input type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_6.jpg" width="60px" height="60px">
					<p class="nickname">동호</p>
					<p class="message">여기 더러운거같아요;;</p> <time class="time">2일 전</time>
					<input type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_7.jpg" width="60px" height="60px">
					<p class="nickname">영훈</p>
					<p class="message">너도 나가!!!!!</p> <time class="time">1달 전</time> <input
					type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_3.jpg" width="60px" height="60px">
					<p class="nickname">앵주</p>
					<p class="message">화나요!</p> <time class="time">10분 전</time> <input
					type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_2.jpg" width="60px" height="60px">
					<p class="nickname">도마뱀하선</p>
					<p class="message">도마뱀 가능??</p> <time class="time">17분 전</time> <input
					type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_4.png" width="60px" height="60px">
					<p class="nickname">수정이생일</p>
					<p class="message">수정이 생일인데 이벤트없나요?</p> <time class="time">57분
						전</time> <input type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_5.jpg" width="60px" height="60px">
					<p class="nickname">자현</p>
					<p class="message">한달 빌리는데 얼마인가요?</p> <time class="time">1시간
						전</time> <input type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/profile_6.jpg" width="60px" height="60px">
					<p class="nickname">동호</p>
					<p class="message">여기 더러운거같아요;;</p> <time class="time">2일 전</time>
					<input type="checkbox" class="listEditCheckBox" /></li>
				<li class="message_list"><img class="profile"
					src="profile/user/admin.png" width="60px" height="60px">
					<p class="nickname">관리자</p>
					<p class="message">대금수령은 어떻게..?</p> <time class="time">1달 전</time>
				</li>
			</ul>
			<div id="checkedDeleteBtn" class="btn">삭제</div>
		</div>
		<!--//messageListWrap-->
		<div id="messageDetailWrap">
			<p id="talkingUser">도마뱀하선</p>
			<div class="message_inner">
				<div id="messageScrollBox">
					<div class="message_box">
						<img class="profile" src="profile/user/profile_2.jpg" width="70px"
							height="70px">
						<div class="talk_balloon">안녕하세요!</div>
					</div>
					<!--//messageBox-->
					<div class="message_box you">
						<img class="profile" src="profile/user/profile_1.jpg" width="70px"
							height="70px">
						<div class="talk_balloon">안녕하세요!</div>
					</div>
					<!--//messageBox-->
					<div class="message_box">
						<img class="profile" src="profile/user/profile_2.jpg" width="70px"
							height="70px">
						<div class="talk_balloon">강아지 두마리랑 도마뱀 세마리 한번에 맡기고 싶은데 혹시
							가능한가요? 저희 애들이 많이 얘민해서 걱정도많고 불안해서...</div>
					</div>
					<!--//messageBox-->
					<div class="message_box you">
						<img class="profile" src="profile/user/profile_1.jpg" width="70px"
							height="70px">
						<div class="talk_balloon">맡기는건 가능하신데 혹시 맡기려고하시는 날짜를 알려주시겠어요?
							확인해보고 도와드릴께요!</div>
					</div>
					<!--//messageBox-->
					<div class="message_box">
						<img class="profile" src="profile/user/profile_2.jpg" width="70px"
							height="70px">
						<div class="talk_balloon">아 6.24부터 7.10까지 좀 길게 맡겨야할것같아요..</div>
					</div>
					<!--//messageBox-->
					<div class="message_box you">
						<img class="profile" src="profile/user/profile_1.jpg" width="70px"
							height="70px">
						<div class="talk_balloon">걱정안하셔두 되구요! 지금 확인해봤는데 마침 그 자리에 예약이
							적어서 집중해서 돌봐드릴 수 있을것 같아요~ 더 궁금하신게있으신가요?걱정안하셔두 되구요! 지금 확인해봤는데 마침 그
							자리에 예약이 적어서 집중해서 돌봐드릴 수 있을것 같아요~ 더 궁금하신게있으신가요?걱정안하셔두 되구요! 지금
							확인해봤는데 마침 그 자리에 예약이 적어서 집중해서 돌봐드릴 수 있을것 같아요~ 더 궁금하신게있으신가요?걱정안하셔두
							되구요! 지금 확인해봤는데 마침 그 자리에 예약이 적어서 집중해서 돌봐드릴 수 있을것 같아요~ 더
							궁금하신게있으신가요?</div>
					</div>
					<!--//messageBox-->
				</div>
				<!--//messageScrollBox-->
			</div>
			<!--//messageInner-->
			<form id="messageSendInner">
				<textarea id="messageSendInput" placeholder="내용을 입력해주세요."></textarea>
				<button id="messageSendBtn" class="btn">전 송</button>
			</form>
			<!--//messageSendInner-->
		</div>
		<!--//messageDetailWrap-->
	</div>
	<!--//messageSection-->
	<c:import url="/WEB-INF/template/footer.jsp" />
	<script type="text/template" id="msgListTmp">
	<@ _.each(list, function(item) { @>
		<@ if(item.type == "V") {@>
		<li class="message_list" data-room="<@=item.roomNo@>">
        	<img class="profile" src="profile/user/<@=item.profileImg@>" width="60px" height="60px">
            <p class="nickname"><@=item.name@><i class="fas fa-circle"></i></p>
            <p class="message"><@=item.title@></p>
            <time class="time"><@=moment(item.lastTime).fromNow()@></time>
            <input type="checkbox" class="listEditCheckBox" data-room="<@=item.roomNo@>"/>
        </li>
	<@ }}); @>
	</script>
	<script type="text/template" id="msgTmp">
		<div class="message_box <@if(msg.userNo == ${loginUser.no}) {@>you<@}@>">
			<img class="profile" src="profile/user/<@=msg.profileImg@>" width="70px" height="70px">
			<div class="talk_balloon"><@=msg.content@></div>
		</div>
	<!--//messageBox-->
	</script>
	<script>
	
	moment.locale("ko");
	
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
	
	const msgListTmp = _.template($("#msgListTmp").html());
	const msgTmp = _.template($("#msgTmp").html());
	
	let nowRoomNo = -1;
	
		/*-----------------------------메세지--------------------*/
		function moveScrollDown() {

			const sTop = $("#messageScrollBox").height();

			$(".message_inner").scrollTop(sTop);

		}//moveScroll() end

		moveScrollDown();
		
		
		let roomNo = -1;

		//메세지리스트 편집 아이콘 클릭
		$("#messageListEditBtn i").on("click", function() {

			$(".listEditCheckBox").css("display", "block");
			$("#checkedDeleteBtn").css("display", "block");

		});//messageListEditBtn i() end

		$("#messageListSearch").on("keyup", function() {
			let text = $("#messageListSearch").val();
			console.log(text);
			if (text == "") {
				$(".message_list").show();
			}//if() end
		});//messageListSearch.keyup() end

		
		//메세지리스트 삭제 버튼 클릭
		$("#checkedDeleteBtn").on("click", function() {

			$("input:checked").each(function() {
		
				const roomNo = this.dataset.room;
				const $this = $(this);
				
				console.log(roomNo);
				
				$.ajax({
					url:"/ajax/invisible",
					dataType:"json",
					data: {roomNo: roomNo, userNo: ${loginUser.no}},
					type:"GET",
					error:function() {
						alert("점검중");
					},
					success:function(json) {
						$this.parent().remove();
					}
				});//ajax() end
				
			})//.listEditCheckBox.each() end

			$(".listEditCheckBox").hide();
			$("#checkedDeleteBtn").hide();

		})//checkedDeleteBtn click() end

		// 메세지 검색
		$("#messageListSearchBtn").click(function() {
			const text = $("#messageListSearch").val();

			$(".nickname").each(function() {
				const txt = $(this).text();

				
				if (!txt.includes(text)) {
					$(this).parent().hide();
				}
			});

		});
		
		$("#messageListInner").on("click",".message_list",function() {
			
			getMessage($(this));
			
		});//message_list click() end
		
		
		//메세지 받아오기
		 function getMessage($this) {
			
			console.log("sddd");
				
				$(".message_list").removeClass("on");
				
				$this.addClass("on");
				
				$this.removeClass("receive");
				
				roomNo = $this.children(".listEditCheckBox").attr("data-room");
				
				nowRoomNo = roomNo;
				
				const name = $this.children(".nickname").text();
				
				$.ajax({
					url:"/ajax/message",
					dataType:"json",
					data: {roomNo: roomNo, userNo: ${loginUser.no}},
					type:"GET",
					error:function() {
						alert("점검중");
					},
					success:function(json) {
						
						$("#messageScrollBox").empty();
					
						_.each(json, function(item, index){ 
							
							$("#messageScrollBox").append(msgTmp({"msg" : item}));
							
							moveScrollDown();

						});

						$("#talkingUser").text(name);
						
						
						//stompClient.send("/app/chat/", {},json[0].no);
						
					}
					
				});//ajax() end
				
			}
		
		/*-----------------------------메세지--------------------*/
		/*-------------------------웹소켓-----------------------*/
		
		//webSocket stomp client
		let stompClient = null;
		
		function connect() {
			
			let socket = new SockJS('/chat');
			stompClient = Stomp.over(socket);
			
			// SockJS와 stomp client를 통해 연결을 시도.
			stompClient.connect({},function() {
				
				// 채팅방리스트 얻어오는 주소 구독
				stompClient.subscribe("/user/queue/chat/list", function(p) {
					
					const list = JSON.parse(p.body);
					
					console.log(list);
			
					$("#messageListInner").empty().append(msgListTmp({"list" : list}));
					
					roomNo = list[0].roomNo;
					
					console.log(roomNo);
					
					_.each(list,function(item) {
						
						// 웹소켓 채팅 받아오는 주소 구독
						stompClient.subscribe("/topic/chat/" + item.roomNo, function(protocol) {
							
							const msg = JSON.parse(protocol.body);
							
							console.log(msg);
							
							if(msg.roomNo == nowRoomNo) {
								
								$("#messageScrollBox").append(msgTmp({"msg" : msg}));
							
							moveScrollDown();
							
							}//if() end
							
							$(".message_list ").each(function() {
								if(this.dataset.room == msg.roomNo) {
									console.log("regdate" + msg.regdate);
									
									$("#messageListInner").prepend(this);
										
									$(this).children("p.message").text(msg.content);
									
									$(this).children(".time").text(moment(msg.regdate).fromNow());
									
									
									if(roomNo != msg.roomNo) {
										$(this).addClass("receive");
									}
									
								}//if() end
							});// message_list.each() end
							
						});// subscribe() end
						
					});
					
					getMessage($(".message_list:first"));
					
				});// subscribe() end
			
				
				stompClient.send("/app/chat/list", {},${loginUser.no});
							
				//채팅 보내기
				$("#messageSendInner").submit(function(e) {
					e.preventDefault();
					
					const msg = $("#messageSendInput").val();
					
					console.log(nowRoomNo);
					console.log(msg);
					
					let message = JSON.stringify({content: msg, userNo: ${loginUser.no}, roomNo: nowRoomNo, profileImg: "${loginUser.profileImg}"})	
					
					if(msg != "") {
						// 채팅 보내기
						stompClient.send("/app/chat/" + nowRoomNo , {}, message);
		
						// 채팅 인풋 비우기
						$("#messageSendInput").val(null);
					}// if() end
					
				});// submit() end
					
			});// stompClient.connect() end
			
		}// connect() end
				
		connect();// connect() end
		
		
		// 엔터 서브밋
		$(function() {
		    $("#messageSendInput").on('keydown', function(event) {
		        if (event.keyCode == 13){
		                event.preventDefault();
		                $('#messageSendInner').submit();
		            }// if() end
		    });// messageSendInput.keydown() end
		});
		
	</script>
</body>
</html>