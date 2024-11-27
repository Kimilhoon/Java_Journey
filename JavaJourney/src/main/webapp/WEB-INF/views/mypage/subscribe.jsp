<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
$(function () {
	$(".custom-image img").css({
        width: "100px",
        height: "100px",
        "margin-right": "-130px"
    });
    $("#btnCancle").click(function () {
        // 선택한 subNo 변수를 null로 초기화
       const subNo = $('input[name="subNo"]:checked') .map(function() {
            return this.value;
        }).get();
        console.log(subNo);
//         AJAX 요청
        $.ajax({
            type: "post"
            , url: "/mypage/cancelsub"
            , traditional:  true
            , data: { "subNo": subNo }
            , success: function(res) {
                console.log("ajax 성공");
                console.log(res);
				//성공시 모든 체크박스 해제
				$("input[type='checkbox'][name='subNo']").prop("checked", false);
// 		        $("#retable").load("/mypage/subscribe #retable > *");
				alert("구독이 취소되었습니다.");
// 				$("body").children().remove(); //화면을 갱신하기 전에 기존 내용을 초기화
// 				$("body").html(res); //현재 페이지의 내용이 검색 결과로 완전히 대체
// 				$("#retable").children().remove(); //화면을 갱신하기 전에 기존 내용을 초기화
// 				$("#retable").load("/mypage/subscribe"); //현재 페이지의 내용이 검색 결과로 완전히 대체
				location.reload();//새로고침 -> 추후 append로 body부문 append로 바꾸기
				//현재 ajax의 장점을 살리고 있지 못함
            },
            error: function(error) {
                console.log("ajax 실패");
            }
        });
    });
    
});
</script>
<style type="text/css">
    .form-check-input {
        width: 15px; /* 체크박스 너비 */
        height: 15px; /* 체크박스 높이 */
        border-width: 0.5px; /* 테두리 두께 */
        border-color: #000; /* 테두리 색상 (검정색) */
    }
#btnCancle{
    padding: 7px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}       
</style>
<div class="mb-4">
</div>
<!-- <div class="container" style="width: 870px; height: 187px;"> -->
<div class="container" style="width: 870px; min-height: 300px; margin-bottom: 100px;">
<%-- ${beanSubList } --%>
<c:forEach var="sub" items="${beanSubList }">
<%-- ${sub.nonSub } --%>
<div>
<table id="retable" class="table">
<tr>
	<td>
	<div class="custom-image">
	<a href="/bean/info?beanNo=${sub.beanNo}">
	${sub.beanOriginName }
	</a>
	</div>
	<div style="width: 10px; height: 50px;">
	<c:if test="${sub.nonSub == 'N' }">
	<input class="form-check-input" type="checkbox" id="${sub.subNo}" name="subNo" value="${sub.subNo}">
	</c:if>
	</div>
	</td>
	<td>
		<div style="width: 370px; height: 50px; margin-left: 50px;">
		<ul style="list-style:none">
			<li>원두명 : ${sub.beanName }</li>
			<li>
			날짜 : <fmt:formatDate value="${sub.subStartDate }" pattern="yyyy-MM-dd"/>(시작)
			~ <fmt:formatDate value="${sub.subEndDate }" pattern="yyyy-MM-dd"/>(종료)
			</li>
			<li>구독기간 : ${sub.subTime }</li>
			<li>금액 : ${sub.price }</li>
			<c:if test="${sub.nonSub == 'Y' }">
			<li>
			취소 날짜 : <fmt:formatDate value="${sub.nonSubDate }" pattern="yyyy-MM-dd"/>
			</li>
			</c:if>
		</ul>
		</div>
	</td>
	<td>

	<td class="text-center"  style="width: 15%">
		<a href="/comm/breview/view?revNo=${sub.revNo}">
	    <c:forEach var="star" begin="1" end="${ sub.revStarPoint != null ? sub.revStarPoint : 0 }">
	     ★
	    </c:forEach>
	    </a>
	    <c:if test="${sub.revStarPoint == 0}">
			<a href="/comm/breview/write?subNo=${sub.subNo}">
			<span id="isRev">리뷰쓰러가기</span>
			</a>
		</c:if>
	</td>
</tr>
</table>
</div>
</c:forEach>
<div id="btn">
<button id="btnCancle" type="button">구독취소</button>
</div>
</div>
<c:import url="./layout/mybeansubpage.jsp"/>

<c:import url="../layout/footer.jsp"/>