<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-13
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pValue="방랑시인";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="member" class="membership.MemberDTO" scope="request"/>
<jsp:setProperty name="member" property="id" value="a111"/>
<jsp:setProperty name="member" property="pass" value="1234"/>
<jsp:setProperty name="member" property="name" value="kim"/>

<jsp:forward page="ParamForward.jsp?param1=김병연">
    <jsp:param name="param2" value="경기도 양주"/>
    <jsp:param name="param3" value="<%=pValue%>"/>
</jsp:forward>
</body>
</html>
