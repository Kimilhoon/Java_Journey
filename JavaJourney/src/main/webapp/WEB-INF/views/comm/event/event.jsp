<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<script type="text/javascript">
	function showModal(modalId) {
	    document.getElementById(modalId).style.display = 'block';
	}
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>

<style type="text/css">
	.modal {
		display: none;
		position: fixed;
		background-color: white;
		top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
        justify-content: center;
        align-items: center;
    }
	.modal-content {
		background-color: white;
		margin: 15% auto;
		padding: 20px;
		width: 80%;
		display: inline-block;
        overflow-y: auto; /* 내용이 넘치면 세로 스크롤 */
	}

	.close {
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	
</style>
<c:forEach var="eventList" items="${eventList }">
<div >
<div id="c"  >
<button type="button" onclick="showModal('modal1')">${eventList.eveImg }</button>
	
<div id="modal1" class="modal modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal1')">&times;</span> <!-- 모달닫기기능 -->
       	${eventList.eventBanner }
    </div>
</div>
</div>
</div>

</c:forEach>
	





<c:import url="/WEB-INF/views/layout/footer.jsp"/>