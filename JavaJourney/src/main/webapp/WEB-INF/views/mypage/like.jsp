<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
var userNo = "${cafeWishNoList[0].userNo}";
$(function () {
	
	$("#all").click(function () {
		$("#cafeAll").show();
		$("#beanAll").show();
	})
	
	$("#cafe").click(function () {
		$("#cafeAll").show();
		$("#beanAll").hide();
	})

	$("#bean").click(function () {
		$("#cafeAll").hide();
		$("#beanAll").show();
	})
	
	$(".custom-image img").css({
        width: "200px",
        height: "200px"
    });
	
// 	$("#btnSearch").click(function () {
// 		var searchText = $("#searchText").val().toLowerCase();
// 		$("#contentall .cafetb, #contentall .beantb").each(function () {
// 			var rowText = $(this).text().toLowerCase();
// 			if(rowText.includes(searchText)) {
// 				$(this).show();
// 			} else {
// 				$(this).hide();
// 			}
// 		})
// 	});
	$("#order-list").css("cursor", "pointer");

	
});
</script>
<style type="text/css">
 a {
    cursor: pointer;
    text-decoration: none; /* 기본 밑줄 제거 */
    transition: color 0.3s ease, background-color 0.3s ease; /* 부드러운 전환 효과 */
}
a:hover {
    color: #007bff; /* 마우스 오버시 텍스트 색상 변화 */
    text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
}
a:active {
    font-weight: bold; /* 클릭할 때 텍스트를 진하게 */
}
.overflow-auto {
    white-space: nowrap;
    width: 100%;
    overflow-x: auto;
    cursor: grab;
    scrollbar-width: none; /* Firefox */
    -ms-overflow-style: none; /* IE */
}
.overflow-auto::-webkit-scrollbar {
    display: none; /* Chrome, Safari */
}
.overflow-auto:hover {
    cursor: grabbing;
}
.overflow-auto > .d-inline-block {
    min-width: 200px; /* 자식 요소 최소 너비 */
    display: inline-block;
}
#cafeWish,
#beanWish  {
    user-select: none; /* 텍스트 선택 방지 */
   /* -webkit-user-select: none;  웹킷 브라우저용 
    -ms-user-select: none;  구형 IE용 */
    cursor: default; /* 기본 커서, auto도 가능 */
}

#cafeWish.dragging,
#beanWish.dragging  {
    cursor: grabbing; /* 드래그 가능 커서 */
}

#cafeWish.dragging img,
#cafeWish.dragging p,
#beanWish.dragging img,
#beanWish.dragging p  {
    cursor: grabbing; /* 클릭 중일 때 커서 */
}

/* 찜목록 제목 글자 꾸미기 */
.wish-font-container {
    display: flex; /* Flexbox 활성화 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    background-color: #f5e6ca; /* 배경색 */
    padding: 10px 20px; /* 텍스트 주변 여백 */
    border-radius: 15px; /* 둥근 테두리 */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
    border: 1px solid #d4a373; /* 테두리 */
    text-align: center; /* 텍스트 가로 정렬 */
    height: 50px; /* 고정 높이 */
}

.wish-font {
    margin: 0; /* 기본 마진 제거 */
    padding: 0; /* 기본 패딩 제거 */
    color: #6f4e37; /* 글자 색상 */
    font-weight: bold; /* 글자 강조 */
    font-size: 1.2rem; /* 글자 크기 */
    font-family: 'Arial', sans-serif; /* 글꼴 */
}
</style>
<h1 style="text-align: center">찜목록</h1> 
<div class="col-2 d-flext flex-column">
<div id="order-list" class="mb-2">
<a id="all" style=" color: #6f4e37;">전체보기</a>
&nbsp;|&nbsp;
<a id="cafe" style=" color: #6f4e37;">카페</a>
&nbsp;|&nbsp;
<a id="bean" style=" color: #6f4e37;">원두</a>
</div> <!-- order-list -->
</div>

<div id="cafeAll" class="container mt-3 mb-3">
	<div class="wish-font-container">
    <h2 class="wish-font">카페찜</h2>
	</div>
    <div id="cafeWish" class="overflow-auto">
    <c:forEach var="cafe" items="${cafeWishNoList}">
        <div class="d-inline-block border bg-light">
        	<div class="custom-image">
                    <p><a id="custom-image" href="/cafe/info?cafeNo=${cafe.cafeNo}">${cafe.cafeImgOriName}</a></p>
                    <p>${cafe.cafeName}</p>
        	</div>
        </div>
    </c:forEach>
    </div>
</div>
<div id="beanAll" class="container mt-5">
	<div class="wish-font-container">
    <h2 class="wish-font">원두찜</h2>
	</div>
    <div id="beanWish" class="overflow-auto">
    <c:forEach var="bean" items="${beanWishList}">
    <div class="d-inline-block border bg-light">
        	<div class="custom-image">
                    <p><a href="/bean/info?beanNo=${bean.beanNo}">${bean.beanOriginName}</a></p>
                    <p>${bean.beanName}</p>
            </div>
        </div>
        </c:forEach>
    </div>
</div>


<script type="text/javascript">
/* 스크룰이벤트 */
document.addEventListener('DOMContentLoaded', function () {
    const cafeWish = document.querySelector('#cafeWish');
//     const cafeWish = $("#cafeWish");

    let isDown = false; // 마우스 클릭 여부 확인
    let startX;
    let scrollLeft;
    let isDragging = false; // 드래그 상태 여부를 판단

    // 마우스 눌렀을 때
    cafeWish.addEventListener('mousedown', (e) => {
        // .custom-image 영역에서 드래그 동작
        if (e.target.closest('.custom-image')) {
//         	console.log("e.target : " + e.target.closest('.custom-imag'));
            e.preventDefault(); // 기본 드래그 방지 (이미지가 따라오는 문제 방지)
            isDown = true;
            isDragging = false; // 드래그 여부 초기화
            cafeWish.classList.add('dragging'); // 드래그 상태 커서 활성화
            startX = e.pageX - cafeWish.offsetLeft;
//             console.log("e.pageX위치 : " + e.pageX);
//             console.log("cafeWish.offsetLeft위치 : " + cafeWish.offsetLeft);
//             console.log("statxX위치 : " + startX);
            
            scrollLeft = cafeWish.scrollLeft;
//             console.log("scrollLeft : " + scrollLeft);
            return;
        }
    });

    // 마우스가 영역 밖으로 나갈 때
    cafeWish.addEventListener('mouseleave', () => {
        isDown = false;
        cafeWish.classList.remove('dragging'); // 드래그 상태 해제
    });

    // 마우스를 뗐을 때
    cafeWish.addEventListener('mouseup', (e) => {
        if (!isDragging && e.target.closest('a')) {
            // 드래그하지 않고 클릭한 경우만 링크 이동
            window.location.href = e.target.closest('a').href;
        }
        isDown = false;
        cafeWish.classList.remove('dragging'); // 드래그 상태 해제
    });

    // 마우스 이동
    cafeWish.addEventListener('mousemove', (e) => {
        if (!isDown) return; // 마우스가 눌려있지 않으면 동작하지 않음
        e.preventDefault(); // 기본 동작 방지 (선택 방지)
        isDragging = true; // 드래그 중 상태로 설정
        const x = e.pageX - cafeWish.offsetLeft;
        const walk = (x - startX) * 1.5; // 스크롤 속도 조정
        cafeWish.scrollLeft = scrollLeft - walk;
    });

    // 이미지의 기본 드래그 방지 및 드래그 커서 표시
    cafeWish.querySelectorAll('.custom-image img').forEach((img) => {
        img.addEventListener('dragstart', (e) => {
            e.preventDefault(); // 기본 드래그 방지
        });

        img.addEventListener('mousedown', () => {
            cafeWish.classList.add('dragging'); // 드래그 상태 커서 표시
        });

        img.addEventListener('mouseup', () => {
            cafeWish.classList.remove('dragging'); // 드래그 상태 해제
        });
    });

    cafeWish.querySelectorAll('a').forEach((anchor) => {
        anchor.addEventListener('click', (e) => {
            if (isDragging) {
                e.preventDefault(); // 드래그 후 클릭 이벤트 방지
            }
        });
    });
});
document.addEventListener('DOMContentLoaded', function () {
    const beanWish = document.querySelector('#beanWish');

    let isDown = false;
    let startX;
    let scrollLeft;
    let isDragging = false; 

 	 beanWish.addEventListener('mousedown', (e) => {
        if (e.target.closest('.custom-image')) {
            e.preventDefault(); 
            isDown = true;
            isDragging = false; 
            beanWish.classList.add('dragging'); 
            startX = e.pageX - beanWish.offsetLeft;
            scrollLeft = beanWish.scrollLeft;
            return;
        }
    });

    beanWish.addEventListener('mouseleave', () => {
        isDown = false;
        beanWish.classList.remove('dragging');
    });

    beanWish.addEventListener('mouseup', (e) => {
        if (!isDragging && e.target.closest('a')) {
            window.location.href = e.target.closest('a').href;
        }
        isDown = false;
        beanWish.classList.remove('dragging'); 
    });

    beanWish.addEventListener('mousemove', (e) => {
        if (!isDown) return; 
        e.preventDefault(); 
        isDragging = true; 
        const x = e.pageX - beanWish.offsetLeft;
        const walk = (x - startX) * 1.5; 
        beanWish.scrollLeft = scrollLeft - walk;
    });

    beanWish.querySelectorAll('.custom-image img').forEach((img) => {
        img.addEventListener('dragstart', (e) => {
            e.preventDefault(); 
        });

        img.addEventListener('mousedown', () => {
        	beanWish.classList.add('dragging'); 
        });

        img.addEventListener('mouseup', () => {
        	beanWish.classList.remove('dragging'); 
        });
    });

    beanWish.querySelectorAll('a').forEach((anchor) => {
        anchor.addEventListener('click', (e) => {
            if (isDragging) {
                e.preventDefault();
            }
        });
    });
});
</script>

<div>
<c:import url="../layout/footer.jsp"/>
</div>