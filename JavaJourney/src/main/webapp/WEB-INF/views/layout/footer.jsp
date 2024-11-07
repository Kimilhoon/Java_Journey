<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- footer내용 -->
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

<div class="bg-light">
	<div class="d-flex justify-content-center">
		제휴정보 : 487-86-00763
		고객센터 : 1577-1577
		주소 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F
		번호 : 1577-1577
		Copyright © JavaJourney. All right Reserved. Created By 커피타조.
	</div>
</div>

</body>
</html>