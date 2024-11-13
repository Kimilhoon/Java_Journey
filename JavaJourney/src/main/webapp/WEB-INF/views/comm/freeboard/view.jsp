<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8fbebe3028eb8e4ca3a2c1633eec190&libraries=services"></script>

<script type="text/javascript">
$(function() {
	
	$.ajax({
		url: "./reccheck?freeBoardNo="+${freeBoardView.freeBoardNo },
		type: "get",
		dataType:"json",
		success: function(res) {
			
			if(res.isRec){
        		$("#btn_rec").css("background","gold");
        		$("#btn_rec").text("✔추천 ["+res.recCount+"]");
        	}else{
        		$("#btn_rec").text("☆추천 ["+res.recCount+"]");
        		$("#btn_rec").css("background","");
        	}
			
		}
	});
	
	
	
	$("#btn_writeComment").click(function() {
		console.log($("#comment").val());
		
		
		$.ajax({
			url: "./commentinsert?freeBoardNo="+${freeBoardView.freeBoardNo },
			type: "get",
			data:{
				"commentContent":$("#comment").val()
			},
			success: function() {
				location.href=location.href
			},
			error: function() {
				location.href=location.href
				
			}
			
		});
	});
	
	$(".btn_cDelete").click(function() {
		
		$.ajax({
			url: "./commentdelete?commentNo="+$(this).parent().prev().prev().prev().text(),
			type: "get",
			success: function() {
				location.href=location.href
			},
			error: function() {
				location.href=location.href
				
			}
			
		});
	});
	
	$("#btn_rec").click(function() {
		
		$.ajax({
			url: "./recommend?freeBoardNo="+${freeBoardView.freeBoardNo },
			type: "get",
			dataType:"json",
			success: function(res) {
				
				if(res.isRec){
            		$("#btn_rec").css("background","gold");
            		$("#btn_rec").text("✔추천 ["+res.recCount+"]");
            	}else{
            		$("#btn_rec").text("☆추천 ["+res.recCount+"]");
            		$("#btn_rec").css("background","");
            	}
				
			}
		});
	});
	
	if(${freeBoardView.freeBoardMapX}=='123'){
		$("#map").css("display","none");		
	}
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${freeBoardView.freeBoardMapX }, ${freeBoardView.freeBoardMapY }), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
	
	$(".btn_reply").click(function() {
	
		var content = '<tr>'
		content += '<td colspan="2"><input type="text" class="reply_input"></td>';
		content += '<td><button onclick="testsubmit(this)">작성</button></td>';
		content += '</tr>';
		
		$(this).parent().parent().after(content);	
		
	});
	$(".btn_reply_reply").click(function() {
	
		var content = '<tr>'
		content += '<td colspan="2"><input type="text" class="reply_input"></td>';
		content += '<td><button onclick="replysubmit(this)">작성</button></td>';
		content += '</tr>';
		
		$(this).parent().parent().after(content);	
		
	});
	
	$(".btn_cUpdate").click(function() {
		
// 		console.log($(this).parent().parent().children().first().text());
	})
	
	
	
})//jquery
function testsubmit(e) { // 기본 댓글에 답글 달 경우
	console.log("답글 작성");	
	console.log($(e).parent().prev().children().first().val());	//답글 내용
	console.log($(e).parent().parent().prev().children().first().next().text());//원댓글 작성자 닉
	console.log($(e).parent().parent().prev().children().first().next().next().next().text());	//원댓글 번호
	
	var commentContent = $(e).parent().prev().children().first().val();
	var freeBoardCommTag = $(e).parent().parent().prev().children().first().next().next().next().text()
	var freeBoardCommNickTag = $(e).parent().parent().prev().children().first().next().text()
	
		
		
		$.ajax({
			url: "./commentinsert?freeBoardNo="+${freeBoardView.freeBoardNo },
			type: "get",
			data:{
				
				"commentContent":commentContent,
				"freeBoardCommTag":freeBoardCommTag,
				"freeBoardCommNickTag":freeBoardCommNickTag
			},
			success: function() {
				location.href=location.href
			},
			error: function() {
				location.href=location.href
				
			}
			
		});
	
	
} 
function replysubmit(e) { // 답글에 답글 달 경우
	
	var commentContent = $(e).parent().prev().children().first().val();
	var freeBoardCommTag = $(e).parent().parent().parent().children().first().children().first().next().next().next().text()
	var freeBoardCommNickTag = $(e).parent().parent().prev().children().first().next().next().next().text()
	
		console.log(commentContent);
		console.log(freeBoardCommTag);
		console.log(freeBoardCommNickTag);
		
		$.ajax({
			url: "./commentinsert?freeBoardNo="+${freeBoardView.freeBoardNo },
			type: "get",
			data:{
				
				"commentContent":commentContent,
				"freeBoardCommTag":freeBoardCommTag,
				"freeBoardCommNickTag":freeBoardCommNickTag
			},
			success: function() {
				location.href=location.href
			},
			error: function() {
				location.href=location.href
				
			}
			
		});
	
	
} 
</script>
</head>
<body>
<a href="./list"><button>목록</button></a>
<c:if test="${member.userNick eq userNick}">
	<a href="./update?freeBoardNo=${freeBoardView.freeBoardNo }"><button>수정</button></a>
	<a href="./delete?freeBoardNo=${freeBoardView.freeBoardNo }"><button>삭제</button></a>
</c:if>
<div>
<table>
<thead>
	<tr>
		<th>보드 넘버</th>
		<th>보드 분류</th>
		<th>보드 제목</th>
		<th>보드 내용</th>
		<th>보드 작성자</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
		<th></th>
		<th></th>
		<th></th>
	</tr>
</thead>
<tbody>
	<tr>
		<td class="bno">${freeBoardView.freeBoardNo}</td>
		<td>${freeBoardView.freeBoardCategory}</td>
		<td>${freeBoardView.freeBoardTitle}</td>
		<td>${freeBoardView.freeBoardContent}</td>
		<td>${member.userNick}</td>
		<td>${freeBoardView.freeBoardHit}</td>
		<td><fmt:formatDate value="${freeBoardView.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>

</tbody>
</table>
<c:if test="${not empty freeBoardView.freeBoardMapX }">
<div>
	<div id="map" style="width:500px; height:400px;"></div>
</div>
</c:if>
</div>
<button id="btn_rec">☆추천</button>

<div>
<br>
<h3>댓글입력</h3>
<textarea rows="1" cols="30" id="comment"></textarea>
<br>
<button id="btn_writeComment">댓글작성</button>
<table>
<thead>
	<tr>
		<th>댓글 내용</th>
		<th>댓글 작성자</th>
		<th>댓글 작성일</th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:forEach var="freeBoardComment" items="${freeBoardCommentList }">
	<div class="comment_reply_wrap">
		<c:if test="${freeBoardComment.freeBoardCommTag eq 0}">
		<tr>
			<td class="cno">${freeBoardComment.commentContent}</td>
			<td>${freeBoardComment.userNick}</td>
			<td><fmt:formatDate value="${freeBoardComment.commentDate }" pattern="yyyy년 MM월 dd일"/></td>
			<td style="display: none;">${freeBoardComment.commentNo }</td>
			<td></td>
			<td>
				<c:if test="${ freeBoardComment.userNick eq userNick}">
					<button class="btn_cUpdate">수정</button>
				</c:if>
			</td>
			<td>
				<c:if test="${ freeBoardComment.userNick eq userNick}">
					<button class="btn_cDelete">삭제</button>
				</c:if>
			</td>
			<td><button class="btn_reply">답글달기</button></td>
			<td></td>
		</tr>
		</c:if>
			<c:forEach var="reply" items="${freeBoardCommentList }">
				<c:if test="${freeBoardComment.commentNo eq reply.freeBoardCommTag}">
				<tr>
					<td>➥</td>
					<td>@${reply.freeBoardCommNickTag}</td>
					<td class="cno">${reply.commentContent}</td>
					<td>${reply.userNick}</td>
					<td><fmt:formatDate value="${reply.commentDate }" pattern="yyyy년 MM월 dd일"/></td>
					<td style="display: none;">${reply.commentNo }</td>
					<td></td>
					<td>
						<c:if test="${ reply.userNick eq userNick}">
							<button class="btn_cUpdate">수정</button>
						</c:if>
					</td>
					<td>
						<c:if test="${ reply.userNick eq userNick}">
							<button class="btn_cDelete">삭제</button>
						</c:if>
					</td>
					<td><button class="btn_reply_reply">답글달기</button></td>
				</tr>
				</c:if>
			</c:forEach>
	</div>
	</c:forEach>
</tbody>
</table>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>