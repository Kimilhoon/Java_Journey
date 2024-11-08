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
	background: #ccc;
	cursor: pointer;
}
.con {
	background: #eee;
	border: 1px solid black;
}
</style>



<h1>FAQ 리스트</h1>
<div>
<table>
<thead>
	<tr>
		<th>보드 넘버</th>
		<th>제목</th>
	</tr>
</thead>
<tbody>
	<tr class="line">
		<td  >1</td>
		<td>군인은 현역을 면한 후가 아니면 국무총리로 임명될 수 없다.</td>
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
		<td  >2</td>
		<td>대한민국의 경제질서는 개인과 기업의 경제상의 자유와 창의를 존중함을 기본으로 한다.</td>
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
		<td  >3</td>
		<td>대통령은 제3항과 제4항의 사유를 지체없이 공포하여야 한다.</td>
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
		<td  >4</td>
		<td>대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다.</td>
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
		<td  >5</td>
		<td>비상계엄이 선포된 때에는 법률이 정하는 바에 의하여 영장제도, 언론·출판·집회·결사의 자유, 정부나 법원의 권한에 관하여 특별한 조치를 할 수 있다.</td>
	</tr>
	<tr class="con" style="display: none;">
		<td></td>
		<td colspan="2" >
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