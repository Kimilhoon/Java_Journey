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
			url: "./commentdelete?myRipCommNo="+$(this).parent().prev().prev().prev().text(),
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
		content += '<td colspan="3"<div class="input-group mb-3">><input type="text" class="reply_input form-control" >';
		content += '<button onclick="testsubmit(this)" class="input-group-text btn btn-outline-primary">작성</button><button class="input-group-text btn btn-outline-primary"onclick="cancelreplysubmit(this)">취소</button></div></td>';
		content += '</tr>';
		
		$(this).parent().parent().after(content);	
		
	});
	$(".btn_reply_reply").click(function() {
	
		var content = '<tr>'
		content += '<td colspan="3"><div class="input-group mb-3"><input type="text" class="reply_input form-control" >';
		content += '<button onclick="replysubmit(this)" class="input-group-text btn btn-outline-primary">작성</button><button class="input-group-text btn btn-outline-primary"onclick="cancelreplysubmit(this)">취소</button></div></td>';
		content += '</tr>';
		$(this).parent().parent().after(content);	
		$(this).css("display","none");
		
		
	});
	
	
	
})//j

function cancelreplysubmit(e) {
	
	$(e).parent().css("display","none");
	$(".btn_reply_reply").css("display","");
}

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
<style>

#write-btn-div {
	display: flex;
}

#write-btn {
	margin: 0 auto;
}
	
/* 전체적인 레이아웃 여백 */
#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    font-size: 2em;
    color: #333;
    margin-bottom: 20px;
}

/* 테이블 레이아웃 */
#table {
    width: 100%;
    margin-bottom: 30px;
    border-collapse: collapse;
}

#table .table {
    width: 100%;
    margin-bottom: 20px;
    border: 1px solid #ddd;
}

#table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}

#table td[colspan="3"] {
    text-align: left;
}

#boardContent {
    height: 250px;  /* 기본 높이를 200px로 설정 */
    text-align: left;
    padding: 10px;
    background-color: #f4f4f4;
    word-wrap: break-word;
    border-top: 1px solid #ddd;
}

/* bottom div (상단 공유, 수정, 삭제 버튼) */
#bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
}

#bottom .bi-share {
    font-size: 1.5em;
    cursor: pointer;
    color: #007bff;
}

#bottom a {
    font-size: 1em;
    margin-left: 15px;
    text-decoration: none;
    color: #007bff;
}

#bottom a:hover {
    text-decoration: underline;
}

/* 댓글 영역 */
#comment {
/*     margin-top: 30px; */
	height: 100px;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

#comment table {
    width: 100%;
    margin-bottom: 20px;
}

#comment td {
    padding: 10px;
    vertical-align: top;
}

#comment td small {
    color: #666;
}

#comment hr {
    border: 1px solid #ddd;
    margin: 15px 0;
}

/* 댓글 작성 부분 */
form label {
    width: 100%;
    display: flex;
}

form input[type="text"] {
    width: calc(100% - 40px);
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-size: 1em;
    margin: 0 auto;
    align-content: center;
}

form button {
    padding: 10px 20px;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
}

form button:hover {
    background-color: #0056b3;
}

/* 페이지 네비게이션 버튼 (목록, 이전, 다음) */
button.btn-light {
	display: flex;
	margin: 0 auto;
    padding: 10px 20px;
    background-color: #f8f9fa;
    border: 1px solid #ddd;
    color: #333;
    cursor: pointer;
    border-radius: 10px;
    font-size: 1em;
    margin: 30px auto;
}

button.btn-light:hover {
    background-color: #e2e6ea;
}




/* 반응형 디자인 (화면 크기 조정) */
@media (max-width: 768px) {
    #content {
        padding: 20px;
    }

    #table td {
        font-size: 0.9em;
        padding: 8px;
    }

    h1 {
        font-size: 1.6em;
    }

    #comment form input[type="text"] {
        width: 100%;
        margin-right: 0;
    }

    #bottom {
        flex-direction: column;
        align-items: flex-start;
    }

    button.btn-light {
        width: 100%;
        margin-bottom: 10px;
    }
}
	
	
</style>





<div id="content">
<div class="table">

<table class="table table-bordered">

	<tr>
		<td colspan="2">제목</td>
		<td colspan="2">${myRecipeView.myRipTitle}</td>
		<td colspan="2">작성자</td>
		<td colspan="2">${member.userNick}</td>
	</tr>
	<tr>
		<td colspan="2">파일</td>
		<td colspan="2"><a href="./download?myRipNo=${myRecipeView.myRipNo }" >${myRecipeView.myRipFileOriginName}</a></td>
		<td colspan="2">작성일</td>
		<td colspan="2"><fmt:formatDate value="${myRecipeView.myRipWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
	<tr>
		<td colspan="8">추천 레시피</td>
	</tr>
	
	<tr>
		<td>원두이름</td>
		<td>${myRecipeView.beanName }</td>
		<td>추출법</td>
		<td>${myRecipeView.extractionName }</td>
		<td>분쇄도</td>
		<td>${myRecipeView.grindName }</td>
		<td>맛</td>
		<td>${myRecipeView.cupNoteName }</td>
	</tr>
	<tr id="boardContent">
		<td colspan="8">${myRecipeView.myRipContent}</td>
	</tr>


<tbody>

</tbody>
</table>
</div> <!-- table -->
<script>

function clip(){
	
	var url = '';
	var textarea = document.createElement("textarea");
	
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

</script>

<div id="bottom" >
	<div style="display: inline-block; float: left; vertical-align: middle;">
	    <i class="bi bi-share" onclick="clip()" style="cursor: pointer; margin-right: 15px;"></i>
	    <button id="btn_rec" class="btn btn-outline-primary">☆추천</button>
	</div>
    <div style="display: inline-block; float: right;">
	<a href="./list"><button class="btn btn-outline-primary">목록</button></a>
    <c:if test="${member.userNick eq userNick}">
	<a href="./update?myRipNo=${myRecipeView.myRipNo }"><button class="btn btn-outline-primary">수정</button></a>
	<a href="./delete?myRipNo=${myRecipeView.myRipNo }"><button class="btn btn-outline-primary">삭제</button></a>
	</c:if>
    </div>
</div> <!-- bottom -->


<div class="comment_reply_wrap">
<table style="width: -webkit-fill-available;">
	<tr>
		<td colspan="3"><hr></td>
	</tr>
	
	<c:forEach var="myRecipeComment" items="${myRecipeCommentList }">
	<c:if test="${myRecipeComment.myRipCommTag eq 0}">
	<tr class="fw-light">
		<td>${myRecipeComment.userNick}</td>
		<td></td>
		<td class="text-end">
			<c:if test="${ myRecipeComment.userNick eq userNick}">
				<button class="btn_cUpdate" style=" border: 0;  background-color: transparent;">수정</button>|
				<button class="btn_cDelete" style=" border: 0;  background-color: transparent;">삭제</button>
			</c:if>
		<fmt:formatDate value="${myRecipeComment.commentDate }" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	<tr class="fw-normal">
		<td colspan="2">${myRecipeComment.myRipCommCont }</td>
		<td class="text-end">
			<button  class="btn_reply_reply btn btn-outline-primary">답글달기</button>
		</td>
	</tr>
	<tr>
		<td colspan="3"><hr></td>
	</tr>
	</c:if>
	
		<c:forEach var="reply" items="${myRecipeCommentList }">
		<c:if test="${myRecipeComment.myRipCommNo eq reply.myRipCommTag }">		
		<tr class="fw-light">
			<td>➥</td>
			<td>${reply.userNick} ⭢ ${reply.myRipCommNickTag}</td>
			<td class="text-end">
				<c:if test="${ reply.userNick eq userNick}">
					<button class="btn_cUpdate" style=" border: 0;  background-color: transparent;">수정</button>|
					<button class="btn_cDelete" style=" border: 0;  background-color: transparent;">삭제</button>
				</c:if>
			<fmt:formatDate value="${reply.commentDate }" pattern="yyyy년 MM월 dd일"/>
			</td>
		</tr>
		<tr class="fw-normal">
			<td></td>
			<td colspan="1">${reply.myRipCommCont }</td>
			<td class="text-end">
				<button  class="btn_reply_reply btn btn-outline-primary">답글달기</button>
			</td>
		</tr>
		<tr>
			<td colspan="3"><hr></td>
		</tr>
		</c:if>
		
		</c:forEach>
	
	</c:forEach>
</table>
</div>

<div class="input-group mb-3">
<textarea   class="form-control" aria-label="With textarea"></textarea>
<button id="btn_writeComment"  class="input-group-text btn btn-outline-primary">댓글작성</button>
</div>

</div><!-- content -->

<c:import url="/WEB-INF/views/layout/footer.jsp"/>



<%-- 	<c:if test="${myRecipeComment.myRipCommTag eq 0}"> --%>
<!-- 	<tr class="comment"> -->
<%-- 		<td class="cno">${myRecipeComment.myRipCommCont}</td> --%>
<%-- 		<td>${myRecipeComment.userNick}</td> --%>
<%-- 		<td><fmt:formatDate value="${myRecipeComment.commentDate }" pattern="yyyy년 MM월 dd일"/></td> --%>
<%-- 		<td style="display: none;">${myRecipeComment.myRipCommNo }</td> --%>
<!-- 		<td></td> -->
<!-- 		<td></td> -->
<!-- 		<td></td> -->
<!-- 		<td></td> -->
<!-- 		<td> -->
<%-- 			<c:if test="${ myRecipeComment.userNick eq userNick}"> --%>
<!-- 				<button class="btn_cDelete">삭제</button> -->
<%-- 			</c:if> --%>
<!-- 		</td> -->
<!-- 		<td><button class="btn_reply">답글달기</button></td> -->
<!-- 		<td></td> -->
<!-- 	</tr> -->
<%-- 	</c:if> --%>
<%-- 		<c:forEach var="reply" items="${myRecipeCommentList }"> --%>
<%-- 			<c:if test="${myRecipeComment.myRipCommNo eq reply.myRipCommTag }"> --%>
<!-- 				<tr class="reply"> -->
<!-- 					<td>➥</td> -->
<%-- 					<td>@${reply.myRipCommNickTag}</td> --%>
<%-- 					<td class="cno">${reply.myRipCommCont}</td> --%>
<%-- 					<td>${reply.userNick}</td> --%>
<%-- 					<td><fmt:formatDate value="${reply.commentDate }" pattern="yyyy년 MM월 dd일"/></td> --%>
<%-- 					<td style="display: none;">${reply.myRipCommNo }</td> --%>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td> -->
<%-- 						<c:if test="${ reply.userNick eq userNick}"> --%>
<!-- 							<button class="btn_cDelete">삭제</button> -->
<%-- 						</c:if> --%>
<!-- 					</td> -->
<!-- 					<td><button class="btn_reply_reply">답글달기</button></td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>

<%-- 	</c:forEach> --%>
