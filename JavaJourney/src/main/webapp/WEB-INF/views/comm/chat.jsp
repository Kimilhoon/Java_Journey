<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<style>

/* 전체 컨테이너 */
.chatcontainer {
    display: flex; /* 왼쪽과 오른쪽 영역을 나눔 */
    height: 80vh;
    margin: 0;
    padding: 0;
}

/* 사이드바 탭 */
.sidebar {
    width: 20%; /* 화면의 20% 차지 */
    background-color: #f0f0f0;
    padding: 0; /* 여백 제거 */
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
/*     border-right: 1px solid #ddd; /* 오른쪽 경계선 */ */
}

/* 탭 메뉴 */
.tab-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}

.tab {
    padding: 15px;
    background-color: #f0f0f0;
    cursor: pointer;
    text-align: center;
    border-bottom: 1px solid #ddd; /* 탭 구분선 */
    transition: background-color 0.3s;
}

.tab.active {
    background-color: #fff; /* 활성화된 탭 색상 */
/*     border-right: 1px solid #ddd; /* 채팅창과 연결 */ */
    border-bottom: none; /* 하단 경계선 제거 */
    font-weight: bold;
}

.tab:hover {
    background-color: #e0e0e0;
}

/* 채팅 영역 */
.chat-section {
    width: 80%; /* 화면의 80% 차지 */
    display: flex;
    flex-direction: column; /* 채팅창과 입력창을 위아래로 배치 */
    justify-content: space-between;
    background-color: #fff;
}

/* 채팅 내용 */
.chatting {
    flex: 1; /* 가변 크기 */
    overflow-y: auto; /* 스크롤 추가 */
    padding: 10px;
    box-sizing: border-box;
/*     border-left: 1px solid #ddd; /* 사이드바와 연결 */ */
}

/* 입력창 */
#yourMsg {
    border-top: 1px solid #ddd;
    padding: 10px;
    box-sizing: border-box;
    background-color: #f9f9f9;
}

/* 입력 필드 */
.inputTable {
	width: -webkit-fill-available;
}


.inputTable input {
    width: 100%; /* 입력 칸을 가득 채움 */
    padding: 8px;
    box-sizing: border-box;
    border-radius: 4px;
    
}

#sendBtn {
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
    background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}

#sendBtn:hover {
    background: #6f4e37;
	color: white;
}

/* 메시지 스타일 */
.me {
	margin-left: 7px;
	width: max-content;
    color: black;
    text-align: right;
    margin-bottom: 8px;
	background: #ffe4b5;
	border-radius: 10px;
	padding: 10px;
	max-width:50%;
	display: inline;
}
.mdiv p{
	display: inline;
}
.mdiv{
	text-align: -webkit-right;
	margin-bottom: 20px;
}
.other {
	margin-right: 7px;
	display: inline;
	max-width:50%;
	padding: 10px;
	border-radius: 10px;
	width: max-content;
	background: #add8e6;
    color: black;
    text-align: left;
    margin-bottom: 8px;
}
.odiv{
	text-align: -webkit-left;
	margin-bottom: 10px;
}
.oidiv{
	text-align: -webkit-left;
	margin-bottom: 10px;
}
.odiv p{
	display: inline;
}

.enter {
    color: gray;
    text-align: center;
    margin-bottom: 8px;
}
.exit {
    color: gray;
    text-align: center;
    margin-bottom: 8px;
}
#content {
	max-width: 1200px;
	margin: 0 auto;
	padding: 30px 50px;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
var userId = '${userNick}';
var roomId = '1';

window.onbeforeunload = function () {
    // 퇴장 메시지를 서버로 전송
    sendExitMessage();
};

$(function() {

//     console.log('처음 로드됐을 떄 roomId: '+roomId);
    
 	connect(roomId);
 	
 	 $('.tab').click(function () {
 		 var c = confirm("채널 이동 시 채팅방에서 나가지며 채팅 내역 확인이 불가능합니다. \n나가시겠습니까? ");
 		 if(c){
 			 
         const newRoomId = $(this).data('room'); // 클릭된 탭의 roomId 가져오기

         // 기존 탭에서 active 제거
         $('.tab').removeClass('active');

         // 클릭된 탭에 active 추가
         $(this).addClass('active');

         // 방 변경 로직 호출
         changeRoom(newRoomId);
 		 }
     });
	

	//엔터 눌렀을때 전송
	$('#msg').keypress(function(e) {
		if (e.keyCode === 13)
			send();
	});
	
	
}) // jquery
	function connect(roomId) {
		//StompConfig.java에 설정된 endpoint로 SockJS 객체, StompClient 객체 생성
		var socket = new SockJS("/chatting");
		console.log("");
		//do Handshake
		stompClient = Stomp.over(socket);
		console.log("악수");

		// connect(header,연결 성공시 콜백,에러발생시 콜백)
		stompClient.connect({}, function() {
			
			//subscribe(subscribe url,해당 url로 메시지를 받을때마다 실행할 함수)
			sub = stompClient.subscribe('/app/topic/'+roomId, function(e) {
				//e.body에 전송된 data가 들어있다
				showMessage(JSON.parse(e.body));
			});
			
			data = {
					'sender' : userId,
					'contents' : 'enter'
				};
			stompClient.send('/app/topic/'+roomId, {}, JSON.stringify(data));
			
			
		}, function(e) {
			//에러 콜백
			alert('에러발생!!!!!!');
		});
		console.log("연결 성공");

	}

	//화면에 메시지를 표시하는 함수
	
	function showMessage(data) {
		//     console.log("쇼 메세지");               
		
		const now = new Date();
    	const time = now.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });

		if(data.contents == 'enter'){
			$('#chatting').append(
					"<div><p class='enter' style='text-align:center;'>" + data.sender
							+ "님이 입장하셨습니다.</p></div>");
		} else if (data.contents == 'exit') {
	        $('#chatting').append(
	                "<div><p class='exit' style='text-align:center;'>" + data.sender + "님이 퇴장하셨습니다.</p></div>"
	            );
		}else {
	        if (data.sender === userId) {
	            $('#chatting').append(
	                "<div class='mdiv'><span class='time'><small>(" + time + ")</small></span><p class='me' >" + data.contents + "</p></div>"
	            );
	        } else {
	            $('#chatting').append(
	                "<div class='odiv'><div class='oidiv'>[" + data.sender + "]</div><p class='other'>" + data.contents + "</p><span class='time'><small>(" + time + ")</small></span></div>"
	            );
	        }
	    }
		

	    // 메시지 추가 후 스크롤 자동 내려가기
	    scrollToBottom();
		
	}

	//메시지 브로커로 메시지 전송
	function send() {
		
		if($('#msg').val() != null && $('#msg').val() != '' ){
		
			data = {
				'sender' : userId,
				'contents' : $("#msg").val()
			};
			// send(destination,헤더,페이로드)
			stompClient.send('/app/topic/'+roomId, {}, JSON.stringify(data));
			$("#msg").val('');
			$("#msg").focus();
			
		}
		
	}
	function changeRoom(newRoomId) {
		
		if (stompClient && roomId) {
	        // 기존 방에 퇴장 메시지 전송
	        const data = {
	            'sender': userId,
	            'contents': 'exit'
	        };
	        stompClient.send('/app/topic/'+roomId, {}, JSON.stringify(data));
	    }
		
	    // 현재 방에서 구독 해제
	    if (sub){
	    	sub.unsubscribe();
	    }

	    // 새로운 방으로 연결
	    roomId = newRoomId; // 새 방 ID 설정
	    connect(roomId);

	    // 채팅창 초기화
	    $('#chatting').empty();
	    console.log(`채팅방 전환: ${roomId}`);
	}
	function sendExitMessage() {
	    if (stompClient && roomId) { // stompClient와 roomId가 유효할 때만 실행
	        const data = {
	            'sender': userId,
	            'contents': 'exit' // 퇴장 메시지
	        };
	        stompClient.send('/app/topic/'+roomId, {}, JSON.stringify(data));
	    }
	}
	function scrollToBottom() {
	    const chattingDiv = $('#chatting');
	    chattingDiv.scrollTop(chattingDiv.prop("scrollHeight"));
	}
</script>
<jsp:useBean id="now" class="java.util.Date" />
<div id="content">
<fmt:formatDate value="${now}" pattern="HH:mm" var="now" />
    <div class="chatcontainer" id="container">
        <!-- 사이드바를 탭으로 변경 -->
        <div class="sidebar">
            <ul class="tab-menu">
                <li class="tab active" data-room="1">자유</li>
                <li class="tab" data-room="2">카페</li>
                <li class="tab" data-room="3">원두</li>
            </ul>
        </div>

        <!-- 오른쪽 채팅창 -->
        <div class="chat-section">
            <div id="chatting" class="chatting"></div>
            <!-- 입력창을 채팅 아래로 이동 -->
            <div id="yourMsg">
                <table class="inputTable">
                    <tr>
                        <th><input id="msg" placeholder="보내실 메시지를 입력하세요." style=" width: -webkit-fill-available" class="form-control"></th>
                        <th style="width:50px;"><button onclick="send()" id="sendBtn" class="input-group-text btn ">전송</button></th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>