<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
$(function () {
	$(".custom-image img").css({
        width: "200px",
        height: "200px",
        "margin-right": "-130px"
    });
})
</script>
<script type="text/javascript">
$(function () {
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
            , data: { "subNo": subNo, "nonSub" : 'Y' }
            , success: function(res) {
                console.log("ajax 성공");
				//성공시 모든 체크박스 해제
				$("input[type='checkbox'][name='subNo']").prop("checked", false);
				location.reload();//새로고침
            },
            error: function(error) {
                console.log("ajax 실패");
            }
        });
    });
    
});
</script>
<style type="text/css">
</style>
<h1 class="text-center">구독정보</h1>
<div class="container">
<%-- ${beanSubList } --%>
<c:forEach var="sub" items="${beanSubList }">
<div>
<table class="table">
<tr>
	<td>
	<input type="checkbox" id="${sub.subNo}" name="subNo" value="${sub.subNo}">
	<div class="custom-image">
	<a href="/bean/info?beanNo=${sub.beanNo}">
	${sub.beanOriginName }
	</a>
	</div>
	</td>
	<td>
		<ul>
			<li>${sub.beanName }</li>
			<li>
			<fmt:formatDate value="${sub.subStartDate }" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${sub.subEndDate }" pattern="yyyy-MM-dd"/>
			</li>
			<li>${sub.subTime }</li>
			<li>${sub.price }</li>
		</ul>
	</td>
	<td>
	<c:if test="${empty sub.revStarPoint}">
	<a href="/comm/breview/write?subNo=${sub.subNo}">
	<span id="isRev">리뷰쓰러가기</span>
	</a>
	</c:if>
	${sub.revStarPoint}
	</td>
</tr>
</table>
</div>
</c:forEach>
<div id="btn">
<button id="btnCancle" type="button">구독취소</button>
</div>
</div>
<c:import url="../layout/footer.jsp"/>