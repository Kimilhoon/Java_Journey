<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- header내용 --->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaJourney</title>
<!-- bootstrap 링크 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/png"
	href="/resources/favicon/JavaJourneyIcon.png">
<!-- bootstrap 링크 End -->
<!-- jquery 링크 -->
<!-- jquery 링크 END -->
<!-- summernote 링크 -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css"
	rel="stylesheet">
<!-- summernote 링크 End-->
<script type="text/javascript">
$(function() {
	
})
</script>
<style type="text/css">
body {
	font-family: 'Gothic A1', sans-serif;
	background-color: #f8f9fa;
}

.navbar {
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #343a40;
	color: white;
	font-size: 1.2rem;
	font-weight: bold;
	font-family: 'Gothic A1', sans-serif;
}

.d-flex {
	display: flex;
}

.sidebar {
	background-color: #e9ecef;
/* 	padding: 30px; */
	min-height: 100vh;
	width: 250px;
 	font-family: 'Gothic A1', sans-serif; 
}

.sidebar a {
	display: block;
	padding: 10px;
 	margin-bottom: 10px; 
	color: #495057;
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	text-align: center;
	border-radius: 1px;
	text-decoration: none;
	font-family: 'Gothic A1', sans-serif;
}

.sidebar a:hover, .sidebar a.active {
	background-color: #ced4da;
	color: #343a40;
}
.dropdown:hover .dropdown-menu {
      display: flex;
/*       flex-direction: column; */
      flex-direction: row;
      position: absolute;
      top: 0;
      left: 100%;
    }
.main-content {
	flex: 1;
	padding: 20px;
	font-family: 'Gothic A1', sans-serif;
}
</style>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>

<div style="width: 100%; background-color: #696969; color: #fffafa">
<h1 class="text-center">관리자 전용 화면</h1>
</div>

