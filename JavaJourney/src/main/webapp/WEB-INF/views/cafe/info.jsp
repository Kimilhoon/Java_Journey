<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {

	$(document).ready(function() {
		$("#wish").click(function() {
			
			//현재 버튼의 텍스트 가져오기
			const currentText = $(this).text();
			
			//데이터 객체 생성
			var cafeNo = cafeNo : ${cafeInfo.cafeNo },
			var cafeNo = userNo : ${userNo }
			
			//버트 클릭 시 텍스트 변경(찜 상태 토글)
			if (currentText === "찜 ♡") {
	            $(this).text("찜 ♥"); //찜 추가
	            sendWishData(cafeNo, userNo, 'add'); //데이터 추가 요청
	            
	        } else {
	            $(this).text("찜 ♡"); //찜 취소
	            sendWishData(cafeNo, userNo, 'remove'); //데이터 삭제 요청
	        }
			
		};
		
		function sendWishData(cafeNo, userNo, action) {
	    	
	        $.ajax({
	            url: './info',  // 요청 URL
	            type: 'POST',
	            contentType: 'application/json',  // JSON 형식
	            data: JSON.stringify({ 
	                cafeNo: cafeNo,
	                userNo: userNo,
	                action: action  // 'add' 또는 'remove'
	            }),
	            dataType: "json",  // 서버에서 JSON 응답을 받을 때
	            success: function(response) {
	                if (action === 'add') {
	                    console.log('찜 상태가 추가되었습니다.');
	                    
	                } else if (action === 'remove') {
	                    console.log('찜 상태가 취소되었습니다.');
	                    
	                }
	            },
	            error: function() {
	                console.error("AJAX 요청에 실패했습니다.");
	            }
	        })
	    };
	});
	/* 메뉴바 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */

		$("#cafeInfoBtn").click(function() {
			location.href="#cafeInfomation"
		})
		
		$("#cafeLocBtn").click(function() {
			location.href="#cafeLoc"
		})
		
		$("#cafeRevBtn").click(function() {
			location.href="#cafeReview"
		})
		
	/* 버튼 경로 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */
		
		$("#btnAll").click(function() {
			location.href="./all";
		});
		
		$("#btnBest").click(function() {
			location.href="./best";
		});
		
		$("#review").click(function() {
			location.href="/comm/creview/write";
		});
		
		
		
	
	/* -------------------------------------------------------------------------------------------------------------- */
		
		
		$(document).ready(function() {
			
			var tapsTop = $("#cafeMenu").offset().top; 
			console.log(tapsTop)
			
			$(window).scroll(function() {
			   
				var window = $(this).scrollTop();
			    
				if(tapsTop <= window) {
					$("#cafeMenu").addClass("fixed");
				}else{
					$("#cafeMenu").removeClass("fixed");
				} // if(tapsTop <= window) end
				
			}); // $(window).scroll(function() end
					
		}); // $(document).ready(function() end
				
		$(".custom-image img").css({
			width: "400px",
			height: "560px",
	        objectFit: "container",		// 이미지가 썸네일 크기에 맞도록 설정
	        borderRadius: "8px"		// 모서리를 둥글게 (선택 사항)
			 
		});
		
}) // $(function() end 
</script>

<style type="text/css">
#wish, #sub{
	width: 150px;
}

#imageDiv{
	 width: 399px; 
	 height: 559px;
}

#beanMenu.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background: white;
}

#beanComm p{
	width: 840px;
	height: 300px;
}

.custom-imgae{
	margin-right: 5px;
}

</style>

<div class="container">

<div class="text-center m-5">
<h1>카페 상세보기</h1>
</div>

<nav style="--breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item"><a href="./all">cafe</a></li>
		<li class="breadcrumb-item active" aria-current="page">info</li>
	</ol>
</nav>

<div id="commCafe" class="d-flex mb-3 grid gap-0 column-gap-5">
<div id="imageDiv" style="flex-shrink: 0;" >
<div class="custom-image">${ cafeInfo.cafeOriginName }</div>
 </div>

<div id="explain p-2">
<div id="cafeName">
<p class="fw-bold fs-1">${ cafeInfo.cafeName }</p>
</div>

<div id="cafeAdd1" class="mb-2">
<%-- <pclass="fw-bold fs-4">${ cafeInfo.cafeLoc }</p> --%>
<pclass="fw-bold fs-4">${ cafeInfo.cafeAdd1 }</p>
</div>

<div id="busytime" class="mb-2">
<p>${ cafeInfo.busyTime }</p>
</div>

<div id="cafeComm" class="mb-2">
<p>${ cafeInfo.cafeComm }</p>
<!-- <p> 대충 카페 분위기에 대한 설명임...</p> -->
</div>

<div id="starPoint">
<table class="table table-borderless p-2 text-center">
<tr>
	<th>별점</th>
	<td>
    <c:forEach var="star" begin="1" end="${starPoint.avgRevStarPoint != null ? starPoint.avgRevStarPoint : 0}">
        ★
    </c:forEach>
    <c:if test="${starPoint.avgRevStarPoint != null}">
        ( <c:out value="${starPoint.avgRevStarPoint}" /> )
    </c:if>
</td>
</tr>
</table>
</div> <!-- id="starPoint" End -->

	<div id="btn" class="d-flex justify-content-center align-self-end">
		<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
<!-- 		<a href="/comm/creview/write"> -->
			<button type="button" id="review" class="btn btn-secondary btn-lg m-2">리뷰쓰기</button>
<!-- 		</a> -->
	</div>
	
</div> <!-- explain p-2 End -->
</div> <!-- commCafe End -->

<div id="cafeMenu" class="btn-group w-100 nav" role="group" aria-label="Basic radio toggle button group">
	<input type="radio" class="btn-check" name="btnradio" id="cafeInfoBtn" autocomplete="off" checked>
	<label class="btn btn-outline-secondary" for="cafeInfoBtn">카페 상세 안내</label>
	        
	<input type="radio" class="btn-check" name="btnradio" id="cafeLocBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeLocBtn">카페 위치 정보</label>
		
	<input type="radio" class="btn-check" name="btnradio" id="cafeRevBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeRevBtn">카페 리뷰</label>
</div>

<div id="cafeInfo" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 상세 정보</p>
	</div>
	<div class="text-center">
		${ cafeInfo.cafeInfo }
		<p>해당 카페의 기본적인 편의제공 요소 및 어필하고자 하는 장점 등 소개</p>
	</div>
</div>

<div id="cafeLoc" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 위치 정보</p>
	</div>

	<div class="text-center">
		${cafeInfo.cafeAdd1 }, ${cafeInfo.cafeAdd2 }  
		<p>API 활용하여 지도 표시???</p>
	</div>
</div>

<div id="cafeRev" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 리뷰</p>
	</div>
	
	<table class="table" style="width: 100%">
	<c:forEach var="cafeRev" items="${ AllCafeList }">
	<tr>
		<td class="text-center" style="width: 10%">${ cafeRev.userNick }</td>
		<td style="width: 60%">${ cafeRev.revContent }</td>
		<td class="text-center"  style="width: 15%">
		<fmt:formatDate value="${ cafeRev.revDate }" pattern="yyyy년 MM월 dd일" />
		</td>
		<td class="text-center"  style="width: 15%">
		    <c:forEach var="star" begin="1" end="${ cafeRev.revsp != null ? cafeRev.revsp : 0 }">
		        ★
		    </c:forEach>
		    <c:if test="${ cafeRev.revsp != null }">
		        (<c:out value="${ cafeRev.revsp }" />)
		    </c:if>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>

</div><!-- id="commCafe" class="clearfix" End -->

</div><!-- container End -->

<div id="btnGroup" class="text-center">
<button type="button" id="btnAll" class="btn btn-secondary">전체 카페</button>
<button type="button" id="btnBest" class="btn btn-secondary">베스트 카페</button>
<!-- 		<a class="btn btn-secondary" href="./all" role="button">전체 카페</a> -->
<!-- 		<a class="btn btn-secondary" href="./best" role="button">베스트 카페</a> -->
<!-- 	<a href="./all"><button id="btnAll" class="btn btn-secondary" type="button">전체 카페</button></a> -->
<!-- 	<a href="./best"><button id="btnBest" class="btn btn-secondary" type="button">베스트 카페</button></a> -->
</div>



<c:import url="../layout/footer.jsp"/>


