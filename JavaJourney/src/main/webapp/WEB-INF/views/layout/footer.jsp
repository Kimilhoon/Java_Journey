<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- footer내용 -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<style>

a {
	color: #6f4e37;
	text-decoration: none;
}

.footer a {
	color: #6f4e37;
	text-decoration: none;
	font-weight: bold;
}

.footer {
	color: #A39E94;
}

.footer-btns {
    display: flex;
    justify-content: center; /* 전체 컨테이너의 가운데 정렬 */
    align-items: center;
    width: 100%; /* 부모 컨테이너의 전체 너비 사용 */
    padding: 0 20px; /* 좌우 여백 */
    position: relative; /* 자식 요소 정렬에 활용 */
}

.footer-icons {
    position: absolute;
    right: 30px; /* 화면 우측 끝에서 20px 떨어지게 설정 */
    display: flex;
    gap: 15px; /* 아이콘 간 간격 */
}


</style>

<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return w.console.error("ChannelIO script included twice.");
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement("script");
      s.type = "text/javascript";
      s.async = true;
      s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
      var x = document.getElementsByTagName("script")[0];
      if (x.parentNode) {
        x.parentNode.insertBefore(s, x);
      }
    }
    if (document.readyState === "complete") {
      l();
    } else {
      w.addEventListener("DOMContentLoaded", l);
      w.addEventListener("load", l);
    }
  })();
  
  ChannelIO('boot', {
	  "pluginKey": "d06a891b-9676-4688-9587-0f0f670f5b34" 
	  // 위에서 확인한 플러그인 키를 입력하세요.
	  });
  
</script>

</div>

<footer>
<div class="mt-5 footer" style="background: #F5F3EF">
	
	<br>
	<div class="footer-btns">
		<div class="footer text-center">
		    <a href="#" data-bs-toggle="modal" data-bs-target="#termsModal">이용약관</a>
		    <a href="#" data-bs-toggle="modal" data-bs-target="#privacyModal">개인정보처리방침</a>
		    <a href="#" data-bs-toggle="modal" data-bs-target="#refundModal">환불규정</a>
		</div>
		
		<div class="footer-icons">
		    <a href="http://www.youtube.com" target="_blank"><i class="bi bi-youtube icon" style="color: red; font-size: 2em;"></i></a>
		    <a href="http://www.facebook.com" target="_blank"><i class="bi bi-facebook icon" style="color: blue; font-size: 2em;"></i></a>
		</div>
	</div>

	<!-- Terms Modal -->
	<div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="termsModalLabel">이용약관</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
					<h6>1. 목적</h6>
	                <p>본 약관은 회사가 제공하는 서비스 이용과 관련하여 회원과의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p>
	                <h6>2. 서비스의 제공 및 변경</h6>
	                <p>회사는 다양한 서비스를 제공하며, 서비스의 내용과 구성을 변경할 수 있습니다.</p>
	                <h6>3. 회원가입</h6>
	                <p>사용자는 회사가 정한 절차에 따라 회원가입을 하며, 개인 정보는 회원의 동의 하에 수집됩니다.</p>
	                <h6>4. 회원의 의무</h6>
	                <p>회원은 서비스 이용 시 공공질서와 법령을 준수해야 합니다.</p>
	                <h6>5. 서비스 이용의 제한</h6>
	                <p>회사는 회원이 본 약관을 위반하거나 서비스의 정상적인 운영을 방해한 경우 이용을 제한할 수 있습니다.</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- Privacy Modal -->
	<div class="modal fade" id="privacyModal" tabindex="-1" aria-labelledby="privacyModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="privacyModalLabel">개인정보처리방침</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <h6>1. 개인정보 수집 목적</h6>
	                <p>회사는 회원의 서비스 이용을 원활히 하기 위해 필요한 최소한의 개인정보를 수집합니다.</p>
	                <h6>2. 수집하는 개인정보 항목</h6>
	                <p>회원가입 시 필수적으로 수집하는 정보는 이름, 이메일 주소, 연락처입니다.</p>
	                <h6>3. 개인정보의 이용 및 보유 기간</h6>
	                <p>수집한 개인정보는 회원 탈퇴 시까지 보유하며, 이후 지체 없이 파기합니다.</p>
	                <h6>4. 개인정보의 제3자 제공</h6>
	                <p>회사는 원칙적으로 회원의 개인정보를 제3자에게 제공하지 않습니다.</p>
	                <h6>5. 개인정보의 파기 절차 및 방법</h6>
	                <p>보유 기간이 만료된 개인정보는 즉시 파기되며, 전자적 파일은 삭제하고, 종이 문서는 소각합니다.</p>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- Refund Modal -->
	<div class="modal fade" id="refundModal" tabindex="-1" aria-labelledby="refundModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="refundModalLabel">환불규정</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
					<h6>1. 환불 요청 기간</h6>
	                <p>결제 후 7일 이내에 환불을 요청할 수 있습니다. 단, 이용한 서비스에 대해서는 환불이 제한됩니다.</p>
	                <h6>2. 환불 처리 절차</h6>
	                <p>환불 요청이 접수된 후 영업일 기준 7일 이내에 환불을 처리해 드립니다.</p>
	                <h6>3. 환불 예외 사항</h6>
	                <p>디지털 콘텐츠의 특성상 이미 다운로드한 콘텐츠에 대해서는 환불이 불가능합니다.</p>
	                <h6>4. 환불 수단</h6>
	                <p>결제 시 사용한 동일한 수단으로 환불되며, 결제 대행사의 처리에 따라 일정 기간이 소요될 수 있습니다.</p>
	                <h6>5. 부분 환불 규정</h6>
	                <p>서비스의 일부만 사용한 경우 사용 비율에 따라 부분 환불이 가능할 수 있습니다.</p>
           		 </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	
	
	<div class="d-flex justify-content-start">
		<pre>
		
		제휴정보 : 487-86-00763
		고객센터 : 1577-1577
		주소 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F
		번호 : 1577-1577
		Copyright © JavaJourney. All right Reserved. Created By 커피타조.
		</pre>
	</div>
</div>

<!-- 최상단으로 이동하기 버튼 -->
<div id="scrollTopBtn" class="scroll-btn" aria-pressed="false">
	<img src="/resources/img/coffeeLogo.png" alt="최상단으로 이동" />
</div>

<script type="text/javascript">
//최상단으로 이동 버튼 로직
window.addEventListener("DOMContentLoaded", function() {
	const scrollTopBtn = document.getElementById("scrollTopBtn");

	// 최상단으로 이동 버튼 클릭 시 이벤트 리스너 추가
	if (scrollTopBtn) {
  		scrollTopBtn.addEventListener("click", function (e) {
  			e.preventDefault(); // 기본 동작 방지
  			window.scrollTo({
  				top: 0,
  		        behavior: "smooth", // 부드럽게 스크롤
  			});
      		console.log("버튼 클릭됨"); // 버튼이 표시되면 로그 출력
  		});
	}
	// 스크롤 시 버튼 표시/숨기기
	window.onscroll = function () {
		if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
		    scrollTopBtn.style.display = "block"; // 300px 이상이면 버튼 보이기
		} else {
			scrollTopBtn.style.display = "none"; // 그 외엔 버튼 숨기기
		}
	};

});
</script>

<style>
/* 최상단으로 이동 버튼 CSS */
.scroll-btn {
  position: fixed;
  bottom: 25px; /* 화면 하단에서의 위치 */
  right: 90px; /* 화면 오른쪽에서의 위치 */
  z-index: 999; /* ChannelIO와 겹치지 않도록 높은 우선순위 설정 */
  width: 55px; /* 버튼 크기 */
  height: 55px;
  border-radius: 50%; /* 동그랗게 */
  background-color: rgba(0, 0, 0, 0.6); /* 반투명 검정 배경 */
  display: none; /* 초기에는 숨김 */
  justify-content: center; /* 가운데 정렬 */
  align-items: center;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* 약간의 그림자 효과 */
  cursor: pointer;
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.scroll-btn img {
  width: 55px; /* 아이콘 크기 */
  height: 55px;
}

.scroll-btn:hover {
  background-color: rgba(0, 0, 0, 0.8); /* 호버 시 더 진한 색 */
  transform: scale(1.1); /* 살짝 확대 */
}
</style>

</footer>
</body>
</html>
