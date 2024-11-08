<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(function() {
	$("#wish").click(function() {
		const currentText = $(this).text();
        
        if (currentText === "찜 ♡") {
            $(this).text("찜 ♥");
        } else {
            $(this).text("찜 ♡");
        }
	});
	
	$("#sub").click(function() {
		location.href="./bean/sub";
	})
	
	
})
</script>

<style type="text/css">
#wish, #sub{
	width: 150px;
}
</style>

<div class="container">

<div class="text-center m-5">
<h1>원두 상세보기</h1>
</div>

<div id="commbean" class="d-flex mb-3">
<div id="image" class="img-thumbnail" style="flex-shrink: 0; width: 400px; height: 400px; object-fit: contain;">
${ beanInfo.beanOriginName }
<%-- <img src="<c:url value='${beanInfo.beanOriginName}'/>" alt="${beanInfo.beanName}"  --%>
<!-- 		class="img-thumbnail"  -->
<!-- 		style="width: 400px; height: 400px; object-fit: contain;" /> -->
</div>

<div id="explain p-2">
<div>
<h3>${ beanInfo.beanName }</h3>
</div>

<div class="mb-2">
<span>${ beanInfo.origin }</span>
</div>

<div>
<%-- <span>${ beanInfo.beanComm }</span> --%>
<p>다아한 탱산뎌언인은 헐즛구에해의 로렘입숨 테스트 데이터 잘 보고 갑니다 ㅎㅎ 넘 ㅜ좋으네여 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를. </p>
</div>

<div>
<dl class="d-flex text-center">
<dt>별점</dt>
<dd>★★★★★(5.0)</dd>
</dl>
</div>

<div id="btn" class="d-flex justify-content-center align-self-end">
<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
<button type="button" id="sub" class="btn btn-secondary btn-lg m-2">구독</button>
</div>

</div>
</div> <!-- <div id="commbean" class="d-flex"> -->

<div id="buttons" class="d-flex">
<button>제품 상세 정보</button>
<button>제품 구매 안내</button>
<button>제품 리뷰</button>
</div>


</div> <!-- <div class="container"> -->
</body>
</html>