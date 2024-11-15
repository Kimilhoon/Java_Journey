<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="jua-regular">
<head>
<meta charset="UTF-8">
<title>Welcome to JavaJourney!</title>
<!-- bootstrap 링크 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Jua&display=swap" rel="stylesheet">
<style>

.ibm-plex-sans-kr-regular {
  font-family: "IBM Plex Sans KR", sans-serif;
  font-weight: 400;
  font-style: normal;
}

/* 로고를 동그랗게 하고 가운데 겹치게 배치 */
.logo-image {
    position: absolute;
    top: 50%;           /* 부모 요소의 세로 중앙 */
    left: 50%;          /* 부모 요소의 가로 중앙 */
    transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
    z-index: 1;         /* 로고가 앞에 보이도록 z-index 조절 */
}

.logo-image img {
    border-radius: 50%; /* 동그란 형태 */
}

html{
	height: 100%;
	overflow: hidden;
	
	
}
.jua-regular {
  font-family: "Jua", sans-serif;
  font-weight: 400;
  font-style: normal;
}

body {
	marin:0;
	height: 100vh;
}

.bestcafe{
	float: left;
}
.bestbean{
	float: right;
}
/* =================================================================== */

.box1{
    width: 50%;
    height:100%;
    margin: 0 ;
}
.box1>.imgbox{
    height:100%;
    display:block;
    position:relative;                   
    overflow:hidden;									    
}
.box1>.imgbox>img{
    display:block;
    width: 100%;
    height:100%;
    transition: transform 1s;
}

/* 이미지 오버 시 어둡게하기 */
.box1>.imgbox::after{                   
									      
    display:block;
    content:"";
    background-color:rgba(0,0,0,0.7);
    width: 100%;
    height:100%;
    position:absolute;                
    top:0;
    left:0;
    transition: background-color 0.5s;   
}
.box1:hover>.imgbox::after{        
    background-color:rgba(0,0,0,0);  
    transition: background-color 1s;  
}


.box1>.beanbox::before{
    content:url("/resources/img/welcome/beanpic.png");
    position:absolute;                  
    top:50%;
    left:50%;
    color : white;                      
    transform: translatex(-50%) translatey(-50%) scale(0.8); 
    padding:10px;
    opacity:0;                         
    transition: opacity 1s;            
    z-index:1;
}
.box1>.cafebox::before{
    content:url("/resources/img/welcome/cafepic.png");
    position:absolute;                  
    top:50%;
    left:50%;
    color : white;                      
    transform: translatex(-50%) translatey(-50%) ; 
    border-radius: 3px;
    padding:10px;
    opacity:0;                         
    transition: opacity 1s;            
    z-index:1;
   
}

.box1:hover>.imgbox::before{
    opacity:1;                         
    transition: opacity 1s;          
}
.box1:hover>.imgbox>img{
    transform: scale(1.03);  
    transition: transform 1s;   
}



.overlay-text {
    position: absolute;
    bottom: 10%;               /* 이미지 아래쪽에 위치 */
    left: 50%;
    transform: translateX(-50%);
    font-size: 1.2em;
    font
    padding:5px;
    color: white;
    opacity: 0;                /* 기본 상태에서는 숨김 */
    transition: opacity 0.5s;
    z-index: 2;                /* 이미지보다 위에 위치 */
}

/* 호버 시 텍스트 표시 */
.box1:hover .overlay-text {
    opacity: 1;                /* 호버 시 텍스트가 나타남 */
}



/* =================================================================== */
#inc01 .item{width:310px}
#inc01 .item .img{width:310px;height:310px}
#inc01 .item .img img{width:100%;height:100%; object-fit: cover;}
#inc01 .item .more{overflow: hidden;display:flex;align-items:center;justify-content:center;position:absolute;width:312px;height:312px;top:0;left:50%;transform:translateX(-50%);border-radius:50%;transition: all 0.3s ease}
#inc01 .item .more span{display:flex;align-items:center;justify-content:center;position:relative;width:159px;height:159px;padding-top:30px;border-radius:50%;font-size:25px;font-weight:500;letter-spacing:2px;color:white;background:var(--primary);font-family:var(--e-font)}
#inc01 .item .more span::before{content:"";display:inline-block;position:absolute;top:-50%;left:50%;transform:translateX(-50%);width:320px;height:321px;z-index:-11;background:rgba(0,0,0,0.7); border-radius: 50%;} 
#inc01 .item .more p{opacity:0;transition: all 0.3s ease;transform: translatex(75%) rotate(180deg)}
#inc01 .item .more:hover p {transform: translatex(0px) rotate(0deg);opacity:1}
</style>
</head>
<body class="ibm-plex-sans-kr-regular">
 		<a href="/cafe/best" style="height: 100%;" >
			<div class="box1 bestcafe">
			    <div class="imgbox cafebox">
			       	<img src="/resources/img/welcome/bestCafe.jpg" alt="베스트카페이미지" width="50%" height="100%" />
			       	<div class="overlay-text">이달의 카페</div> <!-- 추가된 텍스트 -->
			    </div>
			</div>
        </a>
   		<a href="/bean/best"  style="height: 100%;">
			<div class="box1 bestbean">
			    <div class="imgbox beanbox">
			       	<img src="/resources/img/welcome/bestBean.jpg" alt="베스트원두이미지" width="50%" height="100%" />
			       	<div class="overlay-text">취향 조사</div> <!-- 추가된 텍스트 -->
			    </div>
			</div>
        </a>

    <div id="inc01">
    <article class="item">
    <a href="/main" class="logo-image">
		<div class="img">
			<img src="<c:url value='/resources/img/coffeeLogo.png' />" alt="로고" width="240px" height="240px" class="logo" />
		</div>
		<div class="more">
			<p>
				<span>MAIN</span>
			</p>
		</div>
	</a>
	</article>
	</div>


</body>
</html>