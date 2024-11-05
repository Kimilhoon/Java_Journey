<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->`
<c:import url="../../layout/header.jsp"/>


<h1>구독원두 작성</h1>
<script>
  $(document).ready(function() {
    $('#beanComm').summernote({
      height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
    });
  });
</script>

<div class="container">
<form action="" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>원두이름</td>
			<td><input type="text" id="beanName" name="beanName" value="t"></td>
		</tr>
		<tr>
			<td>원두원산지</td>
			<td><input type="text" id="origin" name="origin" value="t"></td>
		</tr>
		<tr>
			<td>원두설명</td>
			<td><textarea class="summernote" id="beanComm" name="beanComm"
			rows="5" cols="25" value="t"></textarea></td>
		</tr>
		<tr>
			<td>원두상세설명</td>
			<td><input type="file" id="beanInfo" name="beanInfo"></td>
		</tr>
		<tr>
			<td>원두금액</td>
			<td><input type="text" id="beanPrice" name="beanPrice" value="1"></td>
		</tr>
		<tr>
			<td>사업자번호</td>
			<td><input type="text" id="businessNo" name="businessNo" value="1"></td>
		</tr>
	</table>
	
	<div id="btnWrite"><button>-완-</button></div>
	
</form>
</div>



<!-- footer -->
<c:import url="../../layout/footer.jsp"/>