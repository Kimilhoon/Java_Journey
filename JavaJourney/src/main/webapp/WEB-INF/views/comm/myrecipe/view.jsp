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
			url: "./commentdelete?myRipCommNo="+$(this).next().text(),
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
		content += '<td colspan="3"><div class="input-group mb-3"><input type="text" class="reply_input form-control" >';
		content += '<button onclick="replysubmit(this)" class="input-group-text btn ">작성</button><button class="input-group-text btn "onclick="cancelreplysubmit(this)">취소</button></div></td>';
		content += '</tr>';
		
		$(this).parent().parent().after(content);	
		$(this).css("display","none");
		
	});
	$(".btn_reply_reply").click(function() {
	
		var content = '<tr>'
		content += '<td colspan="3"><div class="input-group mb-3"><input type="text" class="reply_input form-control" >';
		content += '<button onclick="replyreplysubmit(this)" class="input-group-text btn ">작성</button><button class="input-group-text btn "onclick="cancelreplysubmit(this)">취소</button></div></td>';
		content += '</tr>';
		$(this).parent().parent().after(content);	
		$(this).css("display","none");
		
		
	});
	
	
	
	
	
	
	
})//j

//모달 열기
function openEditModal(commentNo, content) {
  document.getElementById("myRipCommNo").value = commentNo;
  document.getElementById("updatedComment").value = content;
  document.getElementById("editCommentModal").style.display = "flex";
}

//모달 닫기
function closeModal() {
  document.getElementById("editCommentModal").style.display = "none";
}

//수정 폼 제출
function submitEditForm() {
  document.getElementById("editCommentForm").submit();
}

function cancelreplysubmit(e) {
	
	$(e).parent().css("display","none");
	$(".btn_reply_reply").css("display","");
	$(".btn_reply").css("display","");
}

function replysubmit(e) { // 기본 댓글에 답글 달 경우
// 	console.log("답글 작성");	
// 	console.log($(e).parent().prev().children().first().val());	//답글 내용
// 	console.log($(e).parent().parent().prev().children().first().next().text());//원댓글 작성자 닉
// 	console.log($(e).parent().parent().prev().children().first().next().next().next().text());	//원댓글 번호
	
	var myRipCommCont = $(e).prev().val();
	var myRipCommTag =$(e).parent().parent().parent().prev().prev().children().first().next().text();
	var myRipCommNickTag = $(e).parent().parent().parent().prev().prev().children().first().text();
	
// 	console.log(myRipCommCont);
// 	console.log(myRipCommTag);
// 	console.log(myRipCommNickTag);
	
		
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
function replyreplysubmit(e) { // 답글에 답글 달 경우
	
	var myRipCommCont = $(e).prev().val();
	var myRipCommTag =$(e).parent().parent().parent().prev().prev().children().first().next().text();
	var myRipCommNickTag = $(e).parent().parent().parent().prev().prev().children().first().text();
	
		
// 	console.log(myRipCommCont);
// 	console.log(myRipCommTag);
// 	console.log(myRipCommNickTag);
	
	
		
		
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
input:focus, select:focus {
    outline: none;  /* 기본 파란색 테두리 제거 */
    box-shadow: 0 0 5px #6f4e37;  /* 원하는 색상으로 그림자 설정 */
    border-color: #6f4e37;  /* 테두리 색상 변경 (선택 사항) */
}
#write-btn-div {
	display: flex;
}

#write-btn {
	margin: 0 auto;
}
.btn{
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}
.btn:hover{
	background: #6f4e37;
	color: white;
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
	
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    align-items: center;
    justify-content: center;
    z-index: 1000;
}

.modal-dialog {
    max-width: 500px;
    background-color: #fff;
    border-radius: 5px;
    overflow: hidden;
}

	
.comm-update {
	cursor: pointer;
	color: #ccc;
}
	
.comm-delete {
	cursor: pointer;
	color: #c88;
}
a {
	color: #6f4e37;
}
	
</style>

<div class="modal" id="editCommentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">댓글 수정</h4>
            </div>
            <div class="modal-body">
                <form id="editCommentForm" method="post" action="./commentupdate">
                    <input type="hidden" name="myRipNo" value="${myRecipeView.myRipNo}">
                    <input type="hidden" name="myRipCommNo" id="myRipCommNo">
                    <label for="updatedComment">수정할 댓글 내용</label>
                    <input type="text" class="form-control" id="updatedComment" name="myRipCommCont" required>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn " onclick="closeModal()">닫기</button>
                <button type="submit" class="btn " onclick="submitEditForm()">저장</button>
            </div>
        </div>
    </div>
</div>



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
	    <i class="bi bi-share" onclick="clip()" style="cursor: pointer;	color: #6f4e37; margin-right: 15px;"></i>
	    <button id="btn_rec" class="btn ">☆추천</button>
	</div>
    <div style="display: inline-block; float: right;">
		<a href="./list"><button class="btn "><small>목록</small></button></a>
	    <c:if test="${member.userNick eq userNick}">
			<a href="./update?myRipNo=${myRecipeView.myRipNo }"><button class="btn "><small>수정</small></button></a>
			<a href="./delete?myRipNo=${myRecipeView.myRipNo }"><button class="btn "><small>삭제</small></button></a>
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
		<td style="display: none;">${myRecipeComment.myRipCommNo}</td>
		<td></td>
		<td class="text-end">
			<c:if test="${ myRecipeComment.userNick eq userNick}">
				<button class="btn_cUpdate" style=" border: 0;  background-color: transparent;" onclick="openEditModal('${myRecipeComment.myRipCommNo}', '${myRecipeComment.myRipCommCont}')"><small>수정</small></button>|
				<button class="btn_cDelete" style=" border: 0;  background-color: transparent;"><small>삭제</small></button>
				<div style="display: none;">${myRecipeComment.myRipCommNo}</div>
			</c:if>
		<fmt:formatDate value="${myRecipeComment.commentDate }" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	
	<tr class="fw-normal">
		<td colspan="2">${myRecipeComment.myRipCommCont }</td>
		<td class="text-end">
			<button  class="btn_reply btn ">답글달기</button>
		</td>
	</tr>
	
	<tr>
		<td colspan="3"><hr></td>
	</tr>
	
	</c:if>
	
		<c:forEach var="reply" items="${myRecipeCommentList }">
		<c:if test="${myRecipeComment.myRipCommNo eq reply.myRipCommTag }">		
		
		<tr class="fw-light">
			<td style="display: none;">${reply.userNick}</td>
			<td style="display: none;">${myRecipeComment.myRipCommNo}</td>
			<td style="font-size: x-large;">ㄴ</td>
			<td>${reply.userNick} ⭢ ${reply.myRipCommNickTag}</td>
			<td class="text-end">
				<c:if test="${ reply.userNick eq userNick}">
					<button class="btn_cUpdate_reply" style=" border: 0;  background-color: transparent;" onclick="openEditModal('${reply.myRipCommNo}', '${reply.myRipCommCont}')"><small>수정</small></button>|
					<button class="btn_cDelete" style=" border: 0;  background-color: transparent;"><small>삭제</small></button>
					<div style="display: none;">${reply.myRipCommNo}</div>
				</c:if>
			<fmt:formatDate value="${reply.commentDate }" pattern="yyyy년 MM월 dd일"/>
			</td>
		</tr>
		
		<tr class="fw-normal">
			<td></td>
			<td colspan="1">${reply.myRipCommCont }</td>
			<td class="text-end">
				<button  class="btn_reply_reply btn ">답글달기</button>
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
<textarea  id="comment" class="form-control" aria-label="With textarea"></textarea>
<button id="btn_writeComment"  class="input-group-text btn ">댓글작성</button>
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
