<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-13
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String newVar2="백제 온조왕";
%>
page 영역 변수 :<%=pageContext.getAttribute("pAttr")%><br/>
request 영역 변수 : <%=request.getAttribute("rAttr")%><br/>
</body>
</html>








