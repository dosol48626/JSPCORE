<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach begin="1" end="10" step="1" var="i">
  <p>반복 ${i}</p>
</c:forEach>
<table>
  <c:forEach begin="5" end="10" var="i" varStatus="loop">
    <tr>
      <td>count:${loop.count}</td>
      <td>index:${loop.index}</td>
      <td>current:${loop.current}</td>
      <td>first:${loop.first}</td>
      <td>last:${loop.last}</td>
      <td>i:${i}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
