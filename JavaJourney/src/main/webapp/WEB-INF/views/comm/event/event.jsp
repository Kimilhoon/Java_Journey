<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
    // 모달 열기 함수
    function showModal(modalId) {
        document.getElementById(modalId).style.display = 'flex'; // 중앙 정렬을 위해 flex 사용
    }
    // 모달 닫기 함수
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>

<style type="text/css">
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
        justify-content: center; /* 중앙 정렬 */
        align-items: center; /* 중앙 정렬 */
        z-index: 1000; /* 다른 콘텐츠 위로 */
    }
    .modal-content {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        max-width: 80%; /* 최대 너비 */
        max-height: 80%; /* 최대 높이 */
        overflow-y: auto; /* 내용이 많을 경우 스크롤 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        position: relative;
        margin: 0 auto;
        text-align: center;
    }
    .close {
    position: fixed; /* 화면에서 고정 */
    top: 8.5%;
    right: 11%;
    font-size: 50px;
    cursor: pointer;
    color: #555;
    z-index: 1001; /* 모달보다 위에 있도록 z-index를 높게 설정 */
}
    
    #content {
    max-width: fit-content;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
}
</style>

<div id="content">
    <!-- 이벤트 리스트 반복 -->
    <c:forEach var="eventList" items="${eventList}" varStatus="status">
        <div>
            <!-- 이벤트 배너 버튼 -->
            <button type="button" onclick="showModal('modal-${status.index}')" style="margin-bottom: 20px; border: none;">
                <!-- 이벤트 이미지 출력 -->
                    ${eventList.eventBanner}
            </button>
            <!-- 모달 -->
            <div id="modal-${status.index}" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('modal-${status.index}')">&times;</span>
                    <!-- 모달 내부의 큰 이벤트 배너 이미지 출력 -->
                    <div>
		               	 ${eventList.eveImg}
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>