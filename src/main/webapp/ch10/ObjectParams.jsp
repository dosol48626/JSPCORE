<%@ page import="membership.MemberDTO" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-19
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  MemberDTO member = new MemberDTO();
  member.setName("홍길동");
  member.setPass("1234");
  member.setId("abcd");
  member.setRegidate(new Date());
  request.setAttribute("member",member);
  request.setAttribute("stringObj", "나는 문자열");
  request.setAttribute("integerObj", 10);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:forward page="ObjectResult.jsp">
  <jsp:param name="firstNum" value="10"/>
  <jsp:param name="secondNum" value="20"/>
</jsp:forward>
</body>
</html>
