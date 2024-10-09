<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="number" value="101"/>
<c:choose>
    <c:when test="${number mod 2 eq 0}">
        ${number}는 짝수입니다.<br/>
    </c:when>
    <c:otherwise>
        ${number}는 홀수입니다.<br/>
    </c:otherwise>
</c:choose>
</body>
</html>
