<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<style>
.container {
	width: 500px;
	margin: 0 auto;
	padding: 25px
}

.container h1 {
	text-align: left;
	padding: 5px 5px 5px 5px;
	color: black;
	margin-bottom: 20px;
}

.chatting {
	border: 1px solid gray;
	width: 700px;
	height: 700px;
	overflow: auto;
}

.chatting p {
	text-align: left;
}

input {
	width: 450px;
	height: 50px;
}

th {
	width: 100px;
}

#yourMsg {
	width: 700px;
}

.me {
	color: blue;
}

.other {
	color: red;
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

	function connect() {
		//StompConfig.java에 설정된 endpoint로 SockJS 객체, StompClient 객체 생성
		var socket = new SockJS("/chatting");
		console.log("");
		//do Handshake
		stompClient = Stomp.over(socket);
		console.log("악수");

		// connect(header,연결 성공시 콜백,에러발생시 콜백)
		stompClient.connect({}, function() {
			$('#chatting').append("<p style='text-align:center;'>" + userId + "님이 입장하셨습니다.</p>");
			//subscribe(subscribe url,해당 url로 메시지를 받을때마다 실행할 함수)
			sub = stompClient.subscribe('/app/topic/1', function(e) {
				//e.body에 전송된 data가 들어있다
				showMessage(JSON.parse(e.body));
				//                 console.log("됐다");
			});
		}, function(e) {
			//에러 콜백
			alert('에러발생!!!!!!');
		});
		console.log("연결 성공");

	}

	connect();

	$(function() {
		//엔터 눌렀을때 전송
		$('#msg').keypress(function(e) {
			if (e.keyCode === 13)
				send();
		});

	})
	//화면에 메시지를 표시하는 함수
	function showMessage(data) {
		//     console.log("쇼 메세지");                                                                                                                          

		if (data.sender === userId) {
			$('#chatting').append(
					"<p class='me' style='text-align:right;'>" +data.contents
							+ "</p>");
		} else {
			
			$('#chatting').append(
					"<p class='other' style='text-align:left;'>" + data.sender + "<br>" + data.contents
							+ "</p>");
		}
	}

	//메시지 브로커로 메시지 전송
	function send() {
		console.log("보낸다");

		data = {
			'sender' : userId,
			'contents' : $("#msg").val()
		};
		// send(destination,헤더,페이로드)
		stompClient.send("/app/topic/1", {}, JSON.stringify(data));
		$("#msg").val('');
	}
</script>
<div id="content">
    <div class="container" id="container">
        <h1 id="title_room">채팅방제목</h1>
        <div id="chatting" class="chatting">
        </div>
        <div id="yourMsg">
            <table class="inputTable">
                <tr>
                    <th>메시지</th>
                    <th><input id="msg" placeholder="보내실 메시지를 입력하세요."></th>
                    <th><button onclick="send()" id="sendBtn">보내기</button></th>
                </tr>
            </table>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>