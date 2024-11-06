<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="./layout/header.jsp"/>

<body>

<c:choose>
	<c:when test="${isLogin }">
	<a href="./comm/freeboard/list" ><button>자유게시판</button> </a>
	<a href="./comm/creview/list" ><button>카페게시판</button> </a>
	<a href="./comm/breview/list" ><button>원두게시판</button> </a>
	<a href="./member/logout" ><button>로그아웃</button> </a>
	</c:when>
	<c:otherwise>
	<a href="./member/login" ><button>로그인</button> </a>
	<a href="./member/join" ><button>회원가입</button> </a>
	
	</c:otherwise>
</c:choose>



<!-- footer -->
<c:import url="./layout/footer.jsp"/>
