<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header --->
<c:import url="../layout/magheader.jsp"/>
<!-- 관리자 메뉴 모음( sidebar ) -->
<script type="text/javascript">
$(function() {
	$("ul a").click(function (e) {
		e.preventDefault(); // 기본 링크 이동 동작을 막기 위해 사용( 옵션 )
		const hrefValue = $(this).attr("href"); // 클릭된 a 태그의 href 속성 값
		console.log("a 태그의 href 값 : ", hrefValue);
// 		$("#target-element").attr("src",hrefValue);//다른 태그의 src속성에 href값 설정
		
		//3초 후에 href 값을 iframe의 src로 설정
		setTimeout(function () {
			$("#target-element").attr("src",hrefValue);
		}, 1000); // ex) 3000밀리초 = 3초 지연 
		//-> 연속으로 클릭하면 DB조회와 클릭을 한 시간이 서로 맞지 않게되어
		//설정을 하였음
	})
})
</script>
<div class="sidebar" style="position: absolute; width: 230px;">
	<a class="nav-link text-black fs-3 px-3" href="/main" role="button" aria-expanded="false">홈페이지</a>
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" role="button" aria-expanded="false">
	관리자 메뉴
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" href="/create/bean" style="text-decoration: none; color: black;">원두등록</a>
		<li><a class="dropdown-item" href="/create/cafe" style="text-decoration: none; color: black;">카페등록</a></li>
		<li><a class="dropdown-item" href="/manager/user" style="text-decoration: none; color: black;">유저관리</a></li>
		<li><a class="dropdown-item" href="/manager/subuser" style="text-decoration: none; color: black;">구독관리</a></li>
		<li><a href="/comm/notice/write" style="text-decoration: none; color: black;">공지사항등록</a></li>
		<li><a href="/comm/event/write" style="text-decoration: none; color: black;">이벤트등록</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item" style="position: relative;">
	</li>
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="/cafe/all" role="button" aria-expanded="false">
	카페
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" href="/cafe/all" style="text-decoration: none; color: black;">전체카페</a></li>
		<li><a class="dropdown-item" href="/comm/creview/list" style="text-decoration: none; color: black;">카페리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="/bean/all" role="button" aria-expanded="false">
	원두
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" href="/bean/all" style="text-decoration: none; color: black;">전체원두</a></li>
		<li><a class="dropdown-item" href="/comm/breview/list" style="text-decoration: none; color: black;">원두리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 자게, 나만의레시피, 공지 -->
	<li><a href="/comm/freeboard/list" style="text-decoration: none; color: black;">자유게시판</a></li>
	<li><a href="/comm/myrecipe/list" style="text-decoration: none; color: black;">나만의레시피</a></li>
	<li><a href="/comm/event/list" style="text-decoration: none; color: black;">이벤트</a></li>
	<li><a href="/comm/notice/list" style="text-decoration: none; color: black;">공지사항</a></li>
	<li><a href="/comm/faq/list" style="text-decoration: none; color: black;">자주묻는질문</a></li>
</ul>
</div>

<iframe id="target-element" src="/" style="margin-left: 240px; width: 1870px; height: 930px;
overflow: hidden; border: 1px solid #ccc;"></iframe>


</body>
</html>