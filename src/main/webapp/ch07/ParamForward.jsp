<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="member" class="membership.MemberDTO" scope="request"/>
<ul>
    <li><jsp:getProperty name="member" property="id"/></li>
    <li><jsp:getProperty name="member" property="pass"/></li>
    <li><jsp:getProperty name="member" property="name"/></li>
    <li><%=request.getParameter("param1")%></li>
    <li><%=request.getParameter("param2")%></li>
    <li><%=request.getParameter("param3")%></li>
</ul>
</body>
</html>
