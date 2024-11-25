<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../layout/header.jsp" />

<script>

    $(function () {
    	
		$(".bean-img").css({
		    width: "200px",
		    height: "200px"
		});
		
        // 이스케이프 처리 함수
        function escapeHtml(text) {
            if (typeof text === 'string') {
                return text.replace(/[&<>"']/g, function (match) {
                    return {
                        '&': '&amp;',
                        '<': '&lt;',
                        '>': '&gt;',
                        '"': '&quot;',
                        "'": '&#39;'
                    }[match];
                });
            }
            return text;  // 문자열이 아니면 그대로 반환
        }

        $(".select-bean1").change(function () {
            const beanNo = $(this).val();
            $(".bean-info1").html("<p>정보를 불러오는 중입니다...</p>");

            if (beanNo) {
                $.ajax({
                    type: "POST",
                    url: "./compare",
                    data: JSON.stringify({ beanNo: beanNo }), // JSON 문자열로 변환
                    contentType: "application/json", // Content-Type 명시
                    dataType: "json",
                    success: function (res) {
                        console.log(res); // res 데이터 확인하기

                        let beanInfoHtml = "";

                        if (res) {
                            // 이스케이프 처리 적용
							const beanName = res.beanName || "정보 없음";
							const beanOriginName = res.beanOriginName || "정보 없음";
							const origin = res.origin || "정보 없음";
							const cupNoteName = res.cupNoteName || "정보 없음";
							const beanPrice = res.beanPrice || "정보 없음";

                            // 데이터가 제대로 있으면 HTML로 출력
                            if (beanName && beanOriginName && origin && cupNoteName && beanPrice) {
                            	
                            	console.log(beanName, beanOriginName, origin, cupNoteName, beanPrice);
                            	
                                beanInfoHtml += `
                                	<div class="bean-data"
                                    <div class="bean-name">`+ beanName + `</div>
                                    <div class="bean-img">` + beanOriginName + `</div>
                                    <div class="bean-origin">원산지 : ` + origin + `</div>
                                    <div class="bean-cupNoteName">맛과 향 : ` + cupNoteName + `</div>
                                    <div class="bean-price">가격 : ` + beanPrice + `</div>
                                    </div>
                                `;
                            } else {
                                beanInfoHtml = "<p>원두 정보가 불완전합니다.</p>";
                            }
                        } else {
                            beanInfoHtml = "<p>원두 정보를 찾을 수 없습니다.</p>";
                        }

                        $(".bean-info1").html(beanInfoHtml);
                    },
                    error: function (xhr) {
                        console.error("원두 정보를 가져오는 데 실패했습니다:", xhr);
                        $(".bean-info1").html("<p>정보를 가져오는 데 실패했습니다. 다시 시도해주세요.</p>");
                    }
                });
            } else {
                $(".bean-info").html(""); // 초기화
            }
        });
        

        $(".select-bean2").change(function () {
            const beanNo = $(this).val();
            $(".bean-info2").html("<p>정보를 불러오는 중입니다...</p>");

            if (beanNo) {
                $.ajax({
                    type: "POST",
                    url: "./compare",
                    data: JSON.stringify({ beanNo: beanNo }), // JSON 문자열로 변환
                    contentType: "application/json", // Content-Type 명시
                    dataType: "json",
                    success: function (res) {
                        console.log(res); // res 데이터 확인하기

                        let beanInfoHtml = "";

                        if (res) {
                            // 이스케이프 처리 적용
							const beanName = res.beanName || "정보 없음";
							const beanOriginName = res.beanOriginName || "정보 없음";
							const origin = res.origin || "정보 없음";
							const cupNoteName = res.cupNoteName || "정보 없음";
							const beanPrice = res.beanPrice || "정보 없음";

                            // 데이터가 제대로 있으면 HTML로 출력
                            if (beanName && beanOriginName && origin && cupNoteName && beanPrice) {
                            	
                            	console.log(beanName, beanOriginName, origin, cupNoteName, beanPrice);
                            	
                                beanInfoHtml += `
                                	<div class="bean-data"
                                    <div class="bean-name">`+ beanName + `</div>
                                    <div class="bean-img">` + beanOriginName + `</div>
                                    <div class="bean-origin">원산지 : ` + origin + `</div>
                                    <div class="bean-cupNoteName">맛과 향 : ` + cupNoteName + `</div>
                                    <div class="bean-price">가격 : ` + beanPrice + `</div>
                                    </div>
                                `;
                            } else {
                                beanInfoHtml = "<p>원두 정보가 불완전합니다.</p>";
                            }
                        } else {
                            beanInfoHtml = "<p>원두 정보를 찾을 수 없습니다.</p>";
                        }

                        $(".bean-info2").html(beanInfoHtml);
                    },
                    error: function (xhr) {
                        console.error("원두 정보를 가져오는 데 실패했습니다:", xhr);
                        $(".bean-info2").html("<p>정보를 가져오는 데 실패했습니다. 다시 시도해주세요.</p>");
                    }
                });
            } else {
                $(".bean-info").html(""); // 초기화
            }
        });
        
        
    });
</script>


<style>

/* 기본 스타일 */
.bean-name {
    font-size: 2rem; /* 루트 폰트 크기의 2배로 설정 */
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.bean-img, .bean-origin, .bean-cupNoteName, .bean-price {
    font-size: 1rem; /* 기본 폰트 크기 */
    color: #666;
    margin: 8px 0;
}

.bean-img {
    font-size: 1.2rem; /* 원산지와 이미지명은 좀 더 큰 폰트 크기 */
    margin-top: 10px;
}

.bean-origin, .bean-cupNoteName, .bean-price {
    margin-top: 8px;
}

/* 기본 스타일 */
.compare {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 30px;  /* 아이템 간 간격 */
}

.compare .bean {
    flex: 1;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.compare select {
    height: 35px;
    width: 100%;
    padding: 5px;
    border-radius: 30px;
    border: 1px solid #ccc;
    background-color: #fff;
    font-size: 16px;
}

.compare select:focus {
    outline: none;
    border-color: #007bff;
}

.compare .bean-info1, .compare .bean-info2 {
    margin-top: 20px;
    font-size: 14px;
    line-height: 1.6;
    color: #333;
}

.compare .bean-info1 p, .compare .bean-info2 p {
    font-size: 16px;
    color: #999;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .compare {
        flex-direction: column;
        align-items: stretch;
    }

    .compare .bean {
        margin-bottom: 20px;
    }

    .compare select {
        width: 100%;
    }

    /* 작은 화면에서 글자 크기 줄이기 */
    .bean-name {
        font-size: 1.5rem; /* 모바일에서는 글자 크기 줄이기 */
    }

    .bean-img, .bean-origin, .bean-cupNoteName, .bean-price {
        font-size: 0.9rem; /* 모바일에서는 글자 크기 줄이기 */
    }
}

</style>

<div class="container compare">

    <div class="bean">
        <div class="choose-bean">
            <select class="select-bean1">
                <option value="">선택하세요</option>
					<c:forEach var="bean" items="${list}">
					    <option value="${bean.beanNo}">${bean.beanName}</option>
					</c:forEach>
            </select>
        </div>

        <hr style="margin: 50px 80px">
				
        <!-- 동적으로 데이터를 추가할 영역 -->
        <div class="bean-info1">
            <p>원두를 선택하면 정보가 표시됩니다.</p>
        </div>
    </div>

    <div class="bean">
        <div class="choose-bean">
            <select class="select-bean2">
                <option value="">선택하세요</option>
					<c:forEach var="bean" items="${list}">
					    <option value="${bean.beanNo}">${bean.beanName}</option>
					</c:forEach>
            </select>
        </div>

        <hr style="margin: 50px 100px">
				
        <!-- 동적으로 데이터를 추가할 영역 -->
        <div class="bean-info2">
            <p>원두를 선택하면 정보가 표시됩니다.</p>
        </div>
    </div>
    
</div>

<c:import url="../layout/footer.jsp" />



