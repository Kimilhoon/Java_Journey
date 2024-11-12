<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->

<script type="text/javascript">
$(function() {
	
	$.ajax({
		url: "./reccheck?myRipNo="+${myRecipeView.myRipNo },
		type: "get",
		dataType:"json",
		success: function(res) {
			console.log(res.isRec);
			if(res.isRec){
        		$("#btn_rec").css("background","gold");
        		$("#btn_rec").text("✔추천 ["+res.recCount+"]");
        	}else{
        		$("#btn_rec").text("☆추천 ["+res.recCount+"]");
        		$("#btn_rec").css("background","");
        	}
			
		}
	});
	
	$("#btn_rec").click(function() {
		
		$.ajax({
			url: "./recommend?myRipNo="+${myRecipeView.myRipNo },
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
	
	
	$("#btn_writeComment").click(function() {
		console.log($("#comment").val());
		
		
		$.ajax({
			url: "./commentinsert?myRipNo="+${myRecipeView.myRipNo },
			type: "get",
			data:{
				
				"myRipCommCont":$("#comment").val()
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
			url: "./commentdelete?myRipCommNo="+$(this).parent().prev().text(),
			type: "get",
			success: function() {
				location.href=location.href
			},
			error: function() {
				location.href=location.href
				
			}
			
		});
	});
	
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
	
	
})
function testsubmit(e) { // 기본 댓글에 답글 달 경우
// 	console.log("답글 작성");	
// 	console.log($(e).parent().prev().children().first().val());	//답글 내용
// 	console.log($(e).parent().parent().prev().children().first().next().text());//원댓글 작성자 닉
// 	console.log($(e).parent().parent().prev().children().first().next().next().next().text());	//원댓글 번호
	
	var myRipCommCont = $(e).parent().prev().children().first().val();
	var myRipCommTag = $(e).parent().parent().prev().children().first().next().next().next().text()
	var myRipCommNickTag = $(e).parent().parent().prev().children().first().next().text()
	
		
		
		$.ajax({
			url: "./commentinsert?myRipNo="+${myRecipeView.myRipNo },
			type: "get",
			data:{
				
				"myRipCommCont":myRipCommCont,
				"myRipCommTag":myRipCommTag,
				"myRipCommNickTag":myRipCommNickTag
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
	
	var myRipCommCont = $(e).parent().prev().children().first().val();
	var myRipCommTag = $(e).parent().parent().parent().children().first().children().first().next().next().next().text()
	var myRipCommNickTag = $(e).parent().parent().prev().children().first().next().next().next().text()
	
		
		
		$.ajax({
			url: "./commentinsert?myRipNo="+${myRecipeView.myRipNo },
			type: "get",
			data:{
				
				"myRipCommCont":myRipCommCont,
				"myRipCommTag":myRipCommTag,
				"myRipCommNickTag":myRipCommNickTag
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

<h1>뷰</h1>
<a href="./list"><button>목록</button></a>
<c:if test="${member.userNick eq userNick}">
	<a href="./update?myRipNo=${myRecipeView.myRipNo }"><button>수정</button></a>
	<a href="./delete?myRipNo=${myRecipeView.myRipNo }"><button>삭제</button></a>
</c:if>
<div>


<div id="select_quiz" >
	<label>원두이름:${myRecipeView.beanName }</label><br>
	<label>추출법:${myRecipeView.extractionName }</label><br>
	<label>분쇄도:${myRecipeView.grindName }</label><br>
	<label>맛:${myRecipeView.cupNoteName }</label><br>
	
</div>
<table>
<thead>



	<tr>
		<th>보드 넘버</th>
		<th>보드 제목</th>
		<th>보드 내용</th>
		<th>보드 작성자</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
		<th>파일 이름</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td class="bno">${myRecipeView.myRipNo}</td>
		<td>${myRecipeView.myRipTitle}</td>
		<td>${myRecipeView.myRipContent}</td>
		<td>${member.userNick}</td>
		<td>${myRecipeView.myRipHit}</td>
		<td><fmt:formatDate value="${myRecipeView.myRipWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
		<td><a href="./download?myRipNo=${myRecipeView.myRipNo }" >${myRecipeView.myRipFileOriginName}</a></td>
	</tr>

</tbody>
</table>

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
	<c:forEach var="myRecipeComment" items="${myRecipeCommentList }">
	<div class="comment_reply_wrap">

	<c:if test="${myRecipeComment.myRipCommTag eq 0}">
	<tr class="comment">
		<td class="cno">${myRecipeComment.myRipCommCont}</td>
		<td>${myRecipeComment.userNick}</td>
		<td><fmt:formatDate value="${myRecipeComment.commentDate }" pattern="yyyy년 MM월 dd일"/></td>
		<td style="display: none;">${myRecipeComment.myRipCommNo }</td>
		<td></td>
		<td></td>
		<td>
			<c:if test="${ myRecipeComment.userNick eq userNick}">
				<button class="btn_cDelete">삭제</button>
			</c:if>
		</td>
		<td><button class="btn_reply">답글달기</button></td>
		<td></td>
	</tr>
	</c:if>
		<c:forEach var="reply" items="${myRecipeCommentList }">
			<c:if test="${myRecipeComment.myRipCommNo eq reply.myRipCommTag }">
				<tr class="reply">
					<td>➥</td>
					<td>@${reply.myRipCommNickTag}</td>
					<td class="cno">${reply.myRipCommCont}</td>
					<td>${reply.userNick}</td>
					<td><fmt:formatDate value="${reply.commentDate }" pattern="yyyy년 MM월 dd일"/></td>
					<td style="display: none;">${reply.myRipCommNo }</td>
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