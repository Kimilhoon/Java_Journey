<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function selectImage(beanImgNo) {
    window.opener.document.getElementById("beanImgNo").value = beanImgNo;
    window.close();
}
</script>
</head>
<body>

<h1>TEST</h1>
    <table>
        <tr>
        <c:forEach var="beanImg" items="${imgList}">
            <td class="d-flex align-items-center">
                <img src="<c:url value='${beanImg.beanStoredName}' />"
                     alt="원두이미지" width="200" height="200" 
                     style="cursor: pointer;"
                     onclick="selectImage(${beanImg.beanImgNo})" />
            </td>
			<td>${beanImg.beanImgNo}</td>
        </c:forEach>
        </tr>
    </table>
</body>
</html>