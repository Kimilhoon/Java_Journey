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
		<li><a class="dropdown-item" onclick="loadContent('/cafe/all'); return false;" href="#" style="text-decoration: none; color: black;">전체카페</a></li>
		<li><a class="dropdown-item" onclick="loadContent('/comm/creview/list'); return false;" href="#" style="text-decoration: none; color: black;">카페리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="#" role="button" aria-expanded="false">
	원두
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" onclick="loadContent('/create/bean'); return false;" href="#" style="text-decoration: none; color: black;">원두등록</a>
		<li><a class="dropdown-item" onclick="loadContent('/bean/all'); return false;" href="#" style="text-decoration: none; color: black;">전체원두</a></li>
		<li><a class="dropdown-item" onclick="loadContent('/comm/breview/list'); return false;" href="#" style="text-decoration: none; color: black;">원두리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 자게, 나만의레시피, 공지 -->
	<li><a onclick="loadContent('/comm/freeboard/list'); return false;" href="#" style="text-decoration: none; color: black;">자유게시판</a></li>
	<li><a onclick="loadContent('/comm/myrecipe/list'); return false;" href="#" style="text-decoration: none; color: black;">나만의레시피</a></li>
	<li><a onclick="loadContent('/comm/notice/list'); return false;" href="#" style="text-decoration: none; color: black;">공지사항</a></li>
	<li><a onclick="loadContent('/comm/event/list'); return false;" href="#" style="text-decoration: none; color: black;">이벤트</a></li>
	<li><a onclick="loadContent('/comm/faq/list'); return false;" href="#" style="text-decoration: none; color: black;">자주묻는질문</a></li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 유저관리  -->
	<li><a onclick="loadContent('/manager/user'); return false;" href="#" style="text-decoration: none; color: black;">유저관리</a></li>
	<li><a onclick="loadContent('/manager/subuser'); return false;" href="#" style="text-decoration: none; color: black;">구독관리</a></li>
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
    <div id="main-content"></div>
</div>

</body>
</html>