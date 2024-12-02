<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(function() {

	$(".line").click(function() {
		$(this).next().toggle();
	})
	
})
</script>
<style>
.line:hover{
	background-color: #ccc !important; 
	cursor: pointer;
}
.con {
	background-color: #eee !important;
}
.con td {
    background-color: #eee !important;
}
#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

</style>



<div id="content">
<table class="table table-bordered">
<thead style="text-align: center;">
	<tr>
		<th style="width: 5em;">글번호</th>
		<th>제목</th>
	</tr>
</thead>
<tbody>
	<tr class="line">
		<td style="text-align: center;">1</td>
		<td>Java Journey는 어떤 서비스를 제공하나요?</td>
	</tr>
	<tr class="con" style="display: none;">
		<td></td>
		<td colspan="2" >
			Java Journey는 커피 애호가들을 위한 원두 구독 서비스와 커뮤니티 플랫폼을 제공합니다.
			<ul>
				
				<li>원두 구독 서비스: 사용자 취향에 맞는 국내외 고품질 원두를 큐레이션하여 정기 배송합니다.</li>
				<li>커뮤니티: 커피 전문가와 애호가들이 모여 원두 추천, 카페 리뷰, 커피 추출법 등을 공유하며 새로운 커피 문화를 만들어갑니다.
Java Journey에서 커피와 관련된 모든 것을 경험해보세요!</li>
			</ul>
		</td>
	</tr>
	<tr class="line">
		<td  style="text-align: center;">2</td>
		<td>Java Journey의 원두 구독 서비스는 어떻게 작동하나요?</td>
	</tr>
	<tr class="con" style="display: none;">
		<td></td>
		<td colspan="2" >
			<ul>
				<li>대통령의 선거에 관한 사항은 법률로 정한다. 행정권은 대통령을 수반으로 하는 정부에 속한다.</li>
				<li>예비비는 총액으로 국회의 의결을 얻어야 한다. 예비비의 지출은 차기국회의 승인을 얻어야 한다.</li>
			</ul>
		</td>
	</tr>
	<tr class="line">
		<td style="text-align: center;" >3</td>
		<td>커피 초보자도 Java Journey를 이용할 수 있나요?</td>
	</tr>
	<tr class="con" style="display: none;">
		<td></td>
		<td colspan="2" >
			<ul>
				<li>대통령은 국회에 출석하여 발언하거나 서한으로 의견을 표시할 수 있다. 대통령은 국무회의의 의장이 되고, 국무총리는 부의장이 된다. 국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다.</li>
				<li>민주평화통일자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 법관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.</li>
			</ul>
		</td>
	</tr>
	<tr class="line">
		<td  style="text-align: center;">4</td>
		<td>Java Journey 커뮤니티에서는 무엇을 할 수 있나요?</td>
	</tr>
	<tr class="con" style="display: none;">
		<td></td>
		<td colspan="2" >
			<ul>
				<li>헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다.</li>
				<li>국회의원과 정부는 법률안을 제출할 수 있다. 헌법재판소는 법률에 저촉되지 아니하는 범위안에서 심판에 관한 절차, 내부규율과 사무처리에 관한 규칙을 제정할 수 있다.</li>

			</ul>
		</td>
	</tr>
	<tr class="line">
		<td  style="text-align: center;">5</td>
		<td>Java Journey의 지속 가능성(Sustainability) 노력은 무엇인가요?</td>
	</tr>
	<tr class="con" style="display: none;">
		<td></td>
		<td colspan="2" class="con" >
			<ul>
				<li>중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.</li>
				<li>모든 국민은 소급입법에 의하여 참정권의 제한을 받거나 재산권을 박탈당하지 아니한다.</li>
			</ul>
		</td>
	</tr>
</tbody>
</table>
</div>



<c:import url="/WEB-INF/views/layout/footer.jsp"/>