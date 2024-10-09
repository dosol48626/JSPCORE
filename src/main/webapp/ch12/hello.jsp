<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-23
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>${hello}</h2>
<h2><%=request.getAttribute("hello")%></h2>
</body>
</html>
