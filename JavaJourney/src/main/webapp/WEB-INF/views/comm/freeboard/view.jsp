<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8fbebe3028eb8e4ca3a2c1633eec190&libraries=services"></script>

<script type="text/javascript">

Kakao.init('f4c1cc8b7b37a15aa3f598f8c45acfef');
function shareToKakao() {

	  // 카카오톡 메시지 전송
    Kakao.Share.sendDefault({
      objectType: 'text',
      text: `${userNick } 님이 공유한 게시글!`,
      link: {
        webUrl: window.location.href
      },
      buttons: [
        {
          title: '자유 게시판 보러가기',
          link: {
            webUrl: window.location.href
          }
        }
      ]
    });
  }
$(function() {
	if(${not empty isLogin}){
		
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
	}
	
	
	
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
			url: "./commentdelete?commentNo="+$(this).next().text(),
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
		
		if(${empty isLogin}){
			var login = confirm("로그인 후 이용가능한 서비스입니다. 로그인 하시겠습니까?");
			if(login){
				location.href = "/member/login";
				return;
			}
			return false;
			
		}
		
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
	var marker = new kakao.maps.Marker({
        position: map.getCenter()	
    });
	
    marker.setMap(map);
    
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
	
	
	
	
	
	
})//jquery
//모달 열기
function openEditModal(commentNo, content) {
  document.getElementById("commentNo").value = commentNo;
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
	
	var commentContent = $(e).prev().val();
	var freeBoardCommTag =$(e).parent().parent().parent().prev().prev().children().first().next().text();
	var freeBoardCommNickTag = $(e).parent().parent().parent().prev().prev().children().first().text();
	
// 	console.log(myRipCommCont);
// 	console.log(myRipCommTag);
// 	console.log(myRipCommNickTag);
	
		
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
function replyreplysubmit(e) { // 답글에 답글 달 경우
	
	var commentContent = $(e).prev().val();
	var freeBoardCommTag =$(e).parent().parent().parent().prev().prev().children().first().next().text();
	var freeBoardCommNickTag = $(e).parent().parent().parent().prev().prev().children().first().text();
	
		
// 	console.log(myRipCommCont);
// 	console.log(myRipCommTag);
// 	console.log(myRipCommNickTag);
	
	
		
		
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

	
.share-button {
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}
.share-nav {
    position: absolute; 
    margin-bottom: 110px;
    display: flex;  /* 플렉스박스로 변경 */
    justify-content: center;  /* 아이콘을 가로로 가운데 정렬 */
    align-items: center;  /* 아이콘을 세로로 가운데 정렬 */
    display: none; 
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    opacity: 0;
    transition: opacity 0.3s ease, transform 0.3s ease;
    transform: translateY(-10px);
    z-index: 10;
    height: 60px;
    width: 130px;
}

.share-nav.active {
    display: flex;
    opacity: 1;
    transform: translateY(0);
}

.share-nav i {
  margin-right: 5px;
  font-size: 2rem;
}

#share-btn {
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    height: 100%; /* 부모 요소의 높이에 맞추기 */
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
                    <input type="hidden" name="freeBoardNo" value="${freeBoardView.freeBoardNo  }">
                    <input type="hidden" name="commentNo" id="commentNo">
                    <label for="updatedComment">수정할 댓글 내용</label>
                    <input type="text" class="form-control" id="updatedComment" name="commentContent" required>
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
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./list">freeboard</a></li>
		<li class="breadcrumb-item"><a href="./list">list</a></li>
		<li class="breadcrumb-item active" aria-current="page">view</li>
	</ol>
</nav>
<div class="table">

<table class="table table-bordered">

	<tr>
		<td colspan="2">제목</td>
		<td colspan="2">${freeBoardView.freeBoardTitle}</td>
		<td colspan="2">작성자</td>
		<td colspan="2">${member.userNick}</td>
	</tr>
	<tr>
		<td colspan="2">카테고리</td>
		<td colspan="2">${freeBoardView.freeBoardCategory}</td>
		<td colspan="2">작성일</td>
		<td colspan="2"><fmt:formatDate value="${freeBoardView.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
	
	<tr id="boardContent">
		<td colspan="8">${freeBoardView.freeBoardContent}</td>
	</tr>

<%-- 	<c:if test='${freeBoardView.freeBoardMapX ne"123" }'> --%>
<!-- 		<tr> -->
<!-- 			<td colspan="8"> -->
<!-- 				<div> -->
<!-- 					<div id="map" style="width: -webkit-fill-available; height:500px;"></div> -->
<!-- 				</div> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<%-- 	</c:if> --%>
		<c:choose>
		   <c:when test='${freeBoardView.freeBoardMapX ne"123" }'>
		      <tr>
		         <td colspan="8">
		            <div>
		               <div id="map" style="width: -webkit-fill-available; height:500px;"></div>
		            </div>
		         </td>
		      </tr>
		   </c:when>
		   <c:otherwise>
		      <tr style="display:none;">
		         <td colspan="8">
		            <div>
		               <div id="map" style="width: -webkit-fill-available; height:500px;"></div>
		            </div>
		         </td>
		      </tr>
		   </c:otherwise>
		 </c:choose>

</table>
</div> <!-- table -->
<!-- <div id="bottom" > -->
<!-- 	<div  style="display: inline-block; float: left; vertical-align: middle;"> -->
<!-- 		<i class="bi bi-share" onclick="clip()" style="cursor: pointer;	color: #6f4e37; margin-right: 15px;"></i> -->
<!-- 	    <i class="bi bi-chat" onclick="shareToKakao()" style="cursor: pointer; color: #6f4e37; font-size: 1.8em; margin-right: 15px;"></i> -->
<!-- 		<button id="btn_rec" class="btn">☆추천</button> -->
<!-- 	</div> -->
<!-- 	<div style="display: inline-block; float: right;"> -->
<!-- 		<a href="./list"><button class="btn">목록</button></a> -->
<%-- 		<c:if test="${(member.userNick eq userNick) or (userNick eq 'admin')}"> --%>
<%-- 			<a href="./update?freeBoardNo=${freeBoardView.freeBoardNo }"><button class="btn">수정</button></a> --%>
<%-- 			<a href="./delete?freeBoardNo=${freeBoardView.freeBoardNo }"><button class="btn">삭제</button></a> --%>
<%-- 		</c:if> --%>
<!-- 	</div> -->
<!-- </div>bottom -->
<div id="bottom" style="display: flex; justify-content: space-between; align-items: center;">
  <div style="display: flex; align-items: center;">
    <i class="bi bi-share share-button" onclick="toggleShareNav()" style="cursor: pointer; color: #6f4e37;"></i>
    <div class="share-nav" id="share-nav" style="margin-left: 8px;">
      <i class="bi bi-clipboard" onclick="clip()" style="cursor: pointer; color: #6f4e37;"></i>
      <a id="kakaotalk-sharing-btn" onclick="shareToKakao()" style="cursor: pointer;">
        <img src="/resources/img/kakaoLogo.png" style="cursor: pointer; width: 38px; height: 38px;">
      </a>
    </div>
    <button id="btn_rec" class="btn" style="margin-left: 15px;">☆추천</button>
  </div>
  <div>
    <a href="./list"><button class="btn"><small>목록</small></button></a>
    <c:if test="${member.userNick eq userNick or (userNick eq 'admin')}">
      <a href="./update?freeBoardNo=${freeBoardView.freeBoardNo }"><button class="btn"><small>수정</small></button></a>
      <a href="./delete?freeBoardNo=${freeBoardView.freeBoardNo }"><button class="btn"><small>삭제</small></button></a>
    </c:if>
  </div>
</div>

<div class="comment_reply_wrap">
<table style="width: -webkit-fill-available;">
	<tr>
		<td colspan="3"><hr></td>
	</tr>
	
	<c:forEach var="freeBoardComment" items="${freeBoardCommentList }">
	<c:if test="${freeBoardComment.freeBoardCommTag eq 0}">
	
	<tr class="fw-light">
		<td>${freeBoardComment.userNick}</td>
		<td style="display: none;">${freeBoardComment.commentNo }</td>
		<td></td>
		<td class="text-end">
			<c:if test="${ freeBoardComment.userNick eq userNick or (userNick eq 'admin')}">
				<button class="btn_cUpdate" style=" border: 0;  background-color: transparent;" onclick="openEditModal('${freeBoardComment.commentNo }', '${freeBoardComment.commentContent}')"><small>수정</small></button>|
				<button class="btn_cDelete" style=" border: 0;  background-color: transparent;"><small>삭제</small></button>
				<div style="display: none;">${freeBoardComment.commentNo }</div>
			</c:if>
		<fmt:formatDate value="${freeBoardComment.commentDate }" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	
	<tr class="fw-normal">
		<td colspan="2">${freeBoardComment.commentContent }</td>
		<td class="text-end">
			<button  class="btn_reply btn ">답글달기</button>
		</td>
	</tr>
	
	<tr>
		<td colspan="3"><hr></td>
	</tr>
	
	</c:if>
	
		<c:forEach var="reply" items="${freeBoardCommentList }">
		<c:if test="${freeBoardComment.commentNo eq reply.freeBoardCommTag}">
		
		<tr class="fw-light">
			<td style="display: none;">${reply.userNick}</td>
			<td style="display: none;">${freeBoardComment.commentNo}</td>
			<td style="font-size: x-large;">ㄴ</td>
			<td>${reply.userNick} ⭢ ${reply.freeBoardCommNickTag}</td>
			<td class="text-end">
				<c:if test="${ reply.userNick eq userNick or (userNick eq 'admin')}">
					<button class="btn_cUpdate" style=" border: 0;  background-color: transparent;" onclick="openEditModal('${reply.commentNo }', '${reply.commentContent}')"><small>수정</small></button>|
					<button class="btn_cDelete" style=" border: 0;  background-color: transparent;"><small>삭제</small></button>
					<div style="display: none;">${reply.commentNo }</div>
				</c:if>
			<fmt:formatDate value="${reply.commentDate }" pattern="yyyy년 MM월 dd일"/>
			</td>
		</tr>
		
		<tr class="fw-normal">
			<td></td>
			<td colspan="1">${reply.commentContent }</td>
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
//공유 네비게이션 토글
function toggleShareNav() {
    const shareNav = document.getElementById('share-nav');
    shareNav.classList.toggle('active');
}


// 네비게이션 클릭 외부 클릭 시 닫기
document.addEventListener('click', function (event) {
    const shareNav = document.getElementById('share-nav'); // 주의: share-nav의 id 확인
    const shareButton = document.querySelector('.share-button');
    if (!shareButton.contains(event.target) && !shareNav.contains(event.target)) {
        shareNav.style.display = 'none';
    }
});

</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>