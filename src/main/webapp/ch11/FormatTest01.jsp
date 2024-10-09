<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>숫자 포맷 설정</h4>
<c:set var="number1" value="12345"/>
콤마 O : <fmt:formatNumber value="${number1}"/>
콤마 X : <fmt:formatNumber value="${number1}" groupingUsed="false"/><br/>
<fmt:formatNumber value="${number1}" type="currency" var="printNum1"/>
통화기호 : ${printNum1}<br/>
<fmt:formatNumber value="${number1}" type="percent" var="printNum2"/>
포센트 : ${printNum2}<br/>

<h4>숫자를 문자열로 변경</h4>
<c:set var="number2" value="6,789.05879251"/>
<fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3"/>
소수점까지 출력 : ${printNum3}<br/>
<fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4"/>
정수부분만 출력 : ${printNum4}<br/>
</body>
</html>
