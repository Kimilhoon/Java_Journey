<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../../layout/header.jsp" />

<style>

input:focus, select:focus {
    outline: none;  /* 기본 파란색 테두리 제거 */
    box-shadow: 0 0 5px #6f4e37;  /* 원하는 색상으로 그림자 설정 */
    border-color: #6f4e37;  /* 테두리 색상 변경 (선택 사항) */
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

a {
	color: #6f4e37;
}

#write-btn-div {
	display: flex;
}

#write-btn {
	width: 100px;
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

#revContent {
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
    margin-top: 30px;
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
    display: block;
}

form input[type="text"] {
    width: calc(100% - 20px);
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-size: 1em;
    margin-right: 10px;
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

    #bottom .bi-share {
        margin-bottom: 10px;
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
	
</style>

<div style="padding-left: 100px; padding-right: 100px; margin-bottom: 100px;">

<script>

//모달 열기
function openEditModal(commentNo, content) {
    document.getElementById("cafeRevCommNo").value = commentNo;
    document.getElementById("updatedComment").value = content;
    document.getElementById("editCommentModal").style.display = "flex";
}

// 모달 닫기
function closeModal() {
    document.getElementById("editCommentModal").style.display = "none";
}

// 수정 폼 제출
function submitEditForm() {
	
	var content = $("#updatedComment").val();
	
		$.ajax({
			type: "post"
			, url: "./comm/update"
			, data: {
				cafeCommCont: content,
				cafeRevCommNo: $("#cafeRevCommNo").val()
				
			}
			, success: function( res ) {
					
				location.href = "./view?revNo=" + ${cafeRev.revNo };
				
			}
			, error: function( res ) {
				
				location.href = "./view?revNo=" + ${cafeRev.revNo };
				
			}
			
		});
		
}

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


<!-- 댓글 수정 모달 -->
<div class="modal" id="editCommentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">댓글 수정</h4>
            </div>
            <div class="modal-body">
               <input type="hidden" name="cafeRevCommNo" id="cafeRevCommNo">
               <label for="updatedComment">수정할 댓글 내용</label>
               <input type="text" class="form-control" id="updatedComment" name="cafeCommCont" required>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="closeModal()">닫기</button>
                <button type="submit" class="btn btn-primary" onclick="submitEditForm()">수정</button>
            </div>
        </div>
    </div>
</div>


<h1>카페리뷰상세보기</h1>
<br>

<div id="content">

<div id="table">
<table class="table table-bordered">
	<tr>
		<td>카페명</td>
		<td colspan="3">
		<a href="/cafe/info?cafeNo=${cafeRev.cafeNo }">
			${cafeRev.cafeName }
		</a>
		</td>
		<td>작성자</td>
		<td colspan="2">${writerNick }</td>
	</tr>
	<tr>
		<td>지역</td>
		<td>${cafeRev.cafeLoc }</td>
		<td>별점</td>
		<td>${cafeRev.revsp }</td>
		<td>작성일</td>
		<td><fmt:formatDate value="${cafeRev.revDate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr id="revContent">
		<td colspan="9">${cafeRev.revContent }</td>
	</tr>
</table>
</div> <!-- table -->

<div id="bottom" class="d-flex justify-content-between align-items-center">
    <i class="bi bi-share" onclick="clip()" style="cursor: pointer;	color: #6f4e37;"></i>

    <c:if test="${ (userId eq writerId) or (userNick eq 'admin') }">
        <span>
            <a href="./update?revNo=${cafeRev.revNo }" style="color: #6f4e37">수정</a>
            <a href="./delete?revNo=${cafeRev.revNo }" style="color: #6f4e37">삭제</a>
        </span>
    </c:if>
</div> <!-- bottom -->

<br>

<div style="padding-left: 50px; padding-right: 50px;">

<table style="width: -webkit-fill-available;">

<tr>
	<td colspan="2"><hr></td>
</tr>

<c:forEach var="comm" items="${crevcommList }">

<tr class="fw-light ">
	<td>${comm.userNick }</td>
	<td class="text-end">
	
	<c:if test="${ (comm.userNick eq userNick) or (userNick eq 'admin') }">
	    <span class="comm-update" onclick="openEditModal('${comm.cafeRevCommNo}', '${comm.cafeCommCont}')" style="color: #6f4e37;">
	        <small>수정</small>
	    </span>
	    	<span style="color: #D8D8D8"> | </span>
	    <span>
	    <a href="./comm/delete?revNo=${cafeRev.revNo }&cafeRevCommNo=${comm.cafeRevCommNo }" style="text-decoration: none; color: #6f4e37">
	        <small>삭제</small>
	    </a>
	    </span>
	    &nbsp;&nbsp;&nbsp;
	</c:if>
		
		<fmt:formatDate value="${comm.cafeCommDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/>
	</td>
</tr>
<tr class="fw-normal">
	<td colspan="2">${comm.cafeCommCont }</td>
</tr>
<tr>
	<td colspan="2"><hr></td>
</tr>

</c:forEach>

</table >

<c:if test="${ (cafeBN eq userBN) or (userNick eq 'admin') or (userNick eq writerNick) }">

	<form action="./comm?revNo=${cafeRev.revNo }" method="post">
	
	<div id="write-btn-div">
	
	<label>
	<input type="text" name="cafeCommCont">
	</label>
	<button id="write-btn" class="btn btn-primary">댓글작성</button>
	</div>
	
	</form>

</c:if>

</div>

<!-- 이전 게시글로 이동 -->
<c:if test="${not empty prevRevNo }">
    <a href="./view?revNo=${prevRevNo }" style="text-decoration: none;">
        <button class="btn btn-light"><i class="bi bi-caret-left-fill"></i></button>
    </a>
</c:if>

<a href="./list"><button class="btn btn-light"><i class="bi bi-list"></i></button></a>

<!-- 다음 게시글로 이동 -->
<c:if test="${not empty nextRevNo }">
    <a href="./view?revNo=${nextRevNo }" style="text-decoration: none;">
        <button class="btn btn-light"><i class="bi bi-caret-right-fill"></i></button>
    </a>
</c:if>

</div> <!-- content -->

</div> <!-- 여백 -->




<c:import url="../../layout/footer.jsp" />






















