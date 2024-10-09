<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 12:45
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
    String rgba="Red,Green,Blue,Black";
%>
<c:forTokens items="<%=rgba%>" delims="," var="color">
    <span style="color: ${color};">${color}</span><br/>
</c:forTokens>
</body>
</html>
