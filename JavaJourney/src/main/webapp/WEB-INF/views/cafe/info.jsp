<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

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
<h1>${cafe.cafeName }</h1>
</div>

<div id="commCafe" class="d-flex mb-3">
	<div id="img">
		<img src="/resources/img/cafe/c01.jpg" class="img-fluid" alt="${cafe.cafeNo }">
	</div>


<!--     <div class="details"> -->
<%--         <h2>${cafe.cafeName}</h2> --%>
<%--         <p><strong>위치:</strong> ${cafe.cafeLoc}</p> --%>
<%--         <p>${cafe.cafeComm}</p> --%>
<!--     </div> -->
<div id="explain p-2">
<div>
<h3>${ cafe.cafeName }</h3>
</div>

<div class="mb-2">
<span>${ cafe.cafeComm }</span>
</div>

<div>
<%-- <span>${ beanInfo.beanComm }</span> --%>
<p> 대충 카페 분위기에 대한 설명임...</p>
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
</div>

    <div class="btn-group mx-auto" role="group" aria-label="Basic radio toggle button group">
        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  		<label class="btn btn-outline-primary" for="btnradio1">상세정보</label>
        
        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
		<label class="btn btn-outline-primary" for="btnradio2">위치정보</label>
	
		<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
		<label class="btn btn-outline-primary" for="btnradio3">카페리뷰</label>
    </div>

    <!-- 탭에 따라 보여질 내용 영역 -->
    <div class="tab-content">
        <h3>제품 상세 정보</h3>
        <p>여기에 제품 상세 정보가 보여지는 곳임.</p>
    </div>
    
</div> <!-- container End -->

	<div class="d-grid gap-2 col-6 mx-auto" >
		<a class="btn btn-primary" href="./all" role="button">전체 카페</a>
		<a class="btn btn-primary" href="./best" role="button">베스트 카페</a>
<!-- 		<a href="./all"><button class="btn btn-primary" type="button">전체카페 보러가기</button></a> -->
<!-- 		<a href="./best"><button class="btn btn-primary" type="button">베스트카페 보러가기</button></a> -->
	</div>



<c:import url="../layout/footer.jsp"/>


