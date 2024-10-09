<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String[] rgba={"Red","Green","Blue","Black"};
%>
<c:forEach items="<%=rgba%>" var="color">
    <span style="color: ${color};">${color}</span>
</c:forEach>
<h2>varStatus 활용</h2>
<table>
    <c:forEach items="<%=rgba%>" var="color" varStatus="loop">
        <tr>
            <td>count:${loop.count}</td>
            <td>index:${loop.index}</td>
            <td>current:${loop.current}</td>
            <td>first:${loop.first}</td>
            <td>last:${loop.last}</td>
            <td>i:${color}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
