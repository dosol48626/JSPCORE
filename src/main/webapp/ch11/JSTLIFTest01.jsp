<%--
    JSTLIFTest.jsp
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="number" value="100" />
<c:set var="string" value="java" />

<h4>짝수/홀수 판단하기</h4>
<c:if test="${number mod 2 eq 0}" var="result">
    ${number}는 짝수입니다.<br/>
</c:if>
result :${result}<br/>

<h4>문자열 비교와 else문 흉내내기</h4>
<c:if test="${string eq 'java'}" var="result2">
    문자열은 java입니다.<br/>
</c:if>
<c:if test="${not result2}">
    java가 아닙니다.<br/>
</c:if>
<c:if test=" ${ true } " var="result3">
    el이 아닌값을 조건으로 줌<br/>
</c:if>
result3 : ${result3}
</body>
</html>
