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
			url: "./commentdelete?commentNo="+$(this).parent().prev().text(),
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
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${freeBoardView.freeBoardMapX }, ${freeBoardView.freeBoardMapY }), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
	
})
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
	</tr>
</thead>
<tbody>
	<tr>
		<td>${freeBoardView.freeBoardNo}</td>
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
	</tr>
</thead>
<tbody>
	<c:forEach var="freeBoardComment" items="${freeBoardCommentList }">
	<tr>
		<td>${freeBoardComment.commentContent}</td>
		<td>${freeBoardComment.userNick}</td>
		<td><fmt:formatDate value="${freeBoardComment.commentDate }" pattern="yyyy년 MM월 dd일"/></td>
		<td style="display: none;">${freeBoardComment.commentNo }</td>
		<td>
			<c:if test="${ freeBoardComment.userNick eq userNick}">
				<button class="btn_cDelete">삭제</button>
			</c:if>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>

</div>
</body>
</html>