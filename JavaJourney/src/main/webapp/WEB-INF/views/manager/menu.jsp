<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header --->
<c:import url="../layout/magheader.jsp"/>
<!-- 관리자 메뉴 모음( sidebar ) -->
<div class="sidebar" style="position: absolute; width: 230px;">
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="#" role="button" aria-expanded="false">
	카페
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" onclick="loadContent('/create/cafe'); return false;" href="#" style="text-decoration: none; color: black;">카페등록</a></li>
		<li><a class="dropdown-item" href="/cafe/all" style="text-decoration: none; color: black;">전체카페</a></li>
		<li><a class="dropdown-item" href="/comm/creview/list" style="text-decoration: none; color: black;">카페리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="#" role="button" aria-expanded="false">
	원두
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" href="/create/bean" style="text-decoration: none; color: black;"></a>
		<li><a class="dropdown-item" href="/bean/all" style="text-decoration: none; color: black;">전체원두</a></li>
		<li><a class="dropdown-item" href="/comm/breview/list" style="text-decoration: none; color: black;">원두리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 자게, 나만의레시피, 공지 -->
	<li><a href="/comm/freeboard/list" style="text-decoration: none; color: black;">자유게시판</a></li>
	<li><a href="/comm/recipe/list" style="text-decoration: none; color: black;">나만의레시피</a></li>
	<li><a href="/comm/notice/list" style="text-decoration: none; color: black;">공지사항</a></li>
	<li><a href="/comm/event/list" style="text-decoration: none; color: black;">이벤트</a></li>
	<li><a href="/comm/faq/list" style="text-decoration: none; color: black;">자주묻는질문</a></li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 유저관리  -->
	<li><a href="/manager/user" style="text-decoration: none; color: black;">유저관리</a></li>
	<li><a href="/manager/subuser" style="text-decoration: none; color: black;">구독관리</a></li>
</ul>
</div>
<script type="text/javascript">
function loadContent(url) {
	//AJAX 요청
	const xhr = new XMLHttpRequest();
	xhr.open("Get", url, true);
	xhr.onreadystatechange = function () {
		if(xhr.readyState === 4 && xhr.status === 200) {
			//응답을 main-content에 넣어 화면에 표시
			document.getElementById("main-content")
			.innerHTML = xhr.responseText;
		}
	};
	xhr.send();
}
</script>
<!-- 로드할 메인 컨텐츠 -->
<div class="content" style="margin-left: 240px; width: 1660px; height: 900px; overflow: auto; border: 1px solid #ccc;">
 	<!-- AJAX로 로드할 메인 콘텐츠 영역 -->
    <div id="main-content">여기에 콘텐츠가 로드됩니다.</div>
</div>

</body>
</html>