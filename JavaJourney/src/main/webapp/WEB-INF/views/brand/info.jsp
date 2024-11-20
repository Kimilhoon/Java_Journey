<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script>
	

// AOS.init();
window.addEventListener('scroll', () => {
    const activeElements = document.querySelectorAll('.observe');
    activeElements.forEach(element => {
        console.log(element.getBoundingClientRect());
    });
});
// Intersection Observer를 이용하여 요소의 가시성을 관찰하는 함수
function observeVisibility() {
    const activeElements = document.querySelectorAll('.observe');
    function handleIntersection(entries, observer) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('on');
                observer.unobserve(entry.target);
            }
        });
    }
    const observer = new IntersectionObserver(handleIntersection, {
        root: null,
        rootMargin: '0px',
        threshold: 0.5,
        //delay: 500 // 지연 시간
    });

    activeElements.forEach(element => {
        observer.observe(element);
    });
}
// 페이지가 로드될 때 가시성을 관찰하는 함수를 호출
document.addEventListener('DOMContentLoaded', observeVisibility);


</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css');/* regular-400, medium-500, semibold-600, bold-700 */ 
body,html {height:100%;margin:0;padding:0}
ul, li, dl, dt, dd, p, span{margin:0;padding:0}
a{text-decoration:none}
li{list-style:none}
a{text-decoration:none}
*, :after, :before{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}

:root{--primary:#6f4e37;--k-font:'Pretendard';--e-font:'Poppins';--easing:cubic-bezier(.16,1,.64,1)}
.material-symbols-outlined{font-size:19px!important;font-variation-settings:'FILL' 1}
#inc01{display:flex;flex-flow:column;gap:20px;font-family:var(--e-font),var(--k-font)}
#inc01 .item{display:flex}
#inc01 .item .cont{display:flex;flex-flow:column;width:50%; background:#fdfaf6; border-radius: 1px;padding: 30px;}
#inc01 .item .cont .tit{display:flex;align-items:center;margin-bottom:35px;font-size:30px;font-weight:900;line-height:1.5;color:#512700}/* 제목 글자 색  */
#inc01 .item .cont .titl{display:flex;align-items:center;margin-bottom:35px;font-size:30px;font-weight:900;line-height:1.5;color:#361c01}/* 제목 글자 색  */
#inc01 .item .cont .tit span{margin-left:15px;font-size:30px;font-weight:600;white-space:nowrap}
#inc01 .item .cont div{word-break:keep-all;line-height:1.8}
#inc01 .item .cont a{display:flex;align-items:center;justify-content:center;position:relative;width:180px;height:60px;margin-top:auto;border:1px solid #512700;font-size:16px;font-weight:600;color:#512700;line-height:58px;transition:all .4s}
#inc01 .item .cont a:before{display:block;content:"";position:absolute;left:0;z-index:-1;width:0;height:100%;border-color:var(--primary);color:black;background:var(--primary);transition:all .6s var(--easing)}
#inc01 .item .cont a:hover{border-color:#fff;color:#fff; background: #6f4e37;}/* 호버시 글자 색 */
#inc01 .item .cont a:hover:before{width:100%}
#inc01 .item .cont a span{margin:0 0 2px 15px}
#inc01 .item .img_box{overflow:hidden;position:relative;width:50%; border-radius: 3px;}
#inc01 .item .img_box:before{display:block;content:"";position:absolute;left:0;top:0;width:0;height:100%;background:var(--primary);transition:all 1.2s var(--easing)}
#inc01 .item .img_box .img{opacity:0;overflow:hidden;position:relative;width:0;transition:all 1.8s var(--easing) .3s;}
#inc01 .item .img_box .img img{position:relative;left:50%;transform:translateX(-50%); height: 550px;}
#inc01 .item .img_box.on:before{width:100%}
#inc01 .item .img_box.on .img{opacity:1;width:100%}
#inc01 .item.reverse .img_box{order:-1}

@media(max-width:1500px){
#inc01 .item .cont{}
}
@media(max-width:1024px){
#inc01{gap:60px;padding:60px 0}  
#inc01 .item{align-items: flex-start}
#inc01 .item .cont{padding:0 30px;font-size:15px}
#inc01 .item .cont .tit{margin-bottom:15px;font-size:28px}
#inc01 .item .cont .tit span{margin-left:8px;font-size:20px}
#inc01 .item .img_box .img img{width:100%}
#inc01 .item .cont a{width:140px;height:45px;margin-top:15px;font-size:14px}
}
@media(max-width:768px){
#inc01 .item{flex-flow:column;gap:25px}  
  #inc01 .item .cont{width:100%}
  #inc01 .item .img_box{width:100%;order:-1}
}
#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #F5F3EF;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #fefbf7;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>

<!-- <div class="container position-relative"> -->

<!-- 	<div class="text-center" id="brandImg"> -->
<!-- 		커피의 향과 깊이를 경험하는 곳, [Java Journey] -->

<!-- [Java Journey]은 커피 문화를 사랑하는 사람들을 위해 고안된 프리미엄 커뮤니티와 구독 플랫폼입니다. 여기서는 커피 애호가들이 원두와 카페에 대한 정보를 공유하고, 취향에 맞는 새로운 원두를 만날 수 있습니다. 단순한 커뮤니티를 넘어, [Java Journey]은 커피와 관련된 모든 것이 연결되는 허브 역할을 합니다. -->

<!-- 원두 구독 서비스: 당신만의 완벽한 한 잔을 위한 여정 -->
<!-- [Java Journey]의 원두 구독 서비스는 국내외 다양한 로스터리의 고품질 원두를 큐레이팅하여, 사용자의 취향에 맞춘 맞춤형 커피 경험을 제공합니다. 정기적으로 제공되는 원두 추천은 물론, 각 원두에 대한 상세한 프로파일과 추출법 가이드를 통해 커피의 풍미를 깊이 이해할 수 있도록 돕습니다. -->

<!-- 원두와 카페에 대한 모든 정보가 모이는 커뮤니티 -->
<!-- 커피의 시작은 원두에서, 완성은 카페에서 이루어집니다. [Java Journey] 커뮤니티에서는 커피 전문가와 애호가들이 모여 다양한 원두와 카페에 대한 인사이트를 나누고, 커피를 매개로 하는 특별한 소통의 장이 펼쳐집니다. 커피 초보자도 전문가도 이곳에서 새로운 커피 경험을 찾아가며 영감을 얻을 수 있습니다. -->

<!-- 당신이 어디에 있든, 하루의 시작과 끝을 함께할 특별한 커피 경험을 [Java Journey]에서 만나보세요. -->
<!-- 	</div> -->

<!-- </div> -->

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<div id="content">
<div class="content">

<section id="inc01">
     <article data-aos="fade-up">
        <figure class="item">
            <div class="cont" style="width: 100%; background: #fdfaf6; color: #512700">
                <figcaption class="titl" >당신이 어디에 있든,<br>하루의 시작과 끝을 함께할 특별한 커피 경험을<br>Java Journey에서 만나보세요.</figcaption>
            </div>
        </figure>
   </article>
    <article data-aos="fade-up">
        <figure class="item">
            <div class="cont">
                <figcaption class="tit">Java Journey,<br>커피의 향과 깊이를 경험하는 곳</figcaption>
                <div style="color: #452020">Java Journey는 커피 문화를 사랑하는 사람들을 위해 고안된 프리미엄 커뮤니티와 구독 플랫폼입니다. 
                여기서는 커피 애호가들이 원두와 카페에 대한 정보를 공유하고, 취향에 맞는 새로운 원두를 만날 수 있습니다. 
                단순한 커뮤니티를 넘어, Java Journey는 커피와 관련된 모든 것이 연결되는 허브 역할을 합니다.</div>
                <a href="/main">자세히 보기<span class="material-symbols-outlined">play_arrow</span></a>            
            </div>
            <div class="img_box observe">
                <div class="img"><img src="/resources/img/java.jpg" alt="Innovation"></div>
            </div>
        </figure>
   </article>

   <article data-aos="fade-up">
        <figure class="item reverse">
            <div class="cont">
                <figcaption class="tit">당신만의 완벽한 한 잔을 위한 여정</figcaption>
                <div style="color: #452020">Java Journey의 원두 구독 서비스는 국내외 다양한 로스터리의 고품질 원두를 큐레이팅하여, 사용자의 취향에 맞춘 맞춤형 커피 경험을 제공합니다. 
                정기적으로 제공되는 원두 추천은 물론, 각 원두에 대한 상세한 프로파일과 추출법 가이드를 통해 커피의 풍미를 깊이 이해할 수 있도록 돕습니다.
				</div>
                <a href="/bean/best">자세히 보기<span class="material-symbols-outlined">play_arrow</span></a>            
            </div>
            <div class="img_box observe">
                <div class="img"><img src="/resources/img/oneshot.jpg" alt="Sustainability"></div>
            </div>
        </figure>
   </article>

   <article data-aos="fade-up">
        <figure class="item">
            <div class="cont">
                <figcaption class="tit">원두와 카페에 대한 모든 정보가<br>모이는 커뮤니티</figcaption>
                <div style="color: #452020">커피의 시작은 원두에서, 완성은 카페에서 이루어집니다. Java Journey 커뮤니티에서는 커피 전문가와 애호가들이 모여 다양한 원두와 카페에 대한 인사이트를 나누고, 커피를 매개로 하는 특별한 소통의 장이 펼쳐집니다. 커피 초보자도 전문가도 이곳에서 새로운 커피 경험을 찾아가며 영감을 얻을 수 있습니다.</div>
                <a href="/comm/freeboard/list">자세히 보기<span class="material-symbols-outlined">play_arrow</span></a>            
            </div>
            <div class="img_box observe">
                <div class="img"><img src="/resources/img/community.jpg" alt="Targeting"></div>
            </div>
        </figure>
   </article>
                  
</section>

</div>

</div>



<c:import url="../layout/footer.jsp"/>