<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("pAttr","김유신");
    request.setAttribute("rAttr","계백");
    session.setAttribute("sAttr","연개소문");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:forward page="ForwardSub.jsp"></jsp:forward>
</body>
</html>
