<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-23
  Time: 오전 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>MVC 패턴으로 회원인증하기</h2>
<p>
  <strong>${authMessage}</strong>
  <br/>
  <a href="/MemberAuth.mvc?id=abcd&pass=1234">회원인증(관리자)</a>&nbsp;&nbsp;
  <a href="/MemberAuth.mvc?id=must&pass=1234">회원인증(회원)</a>&nbsp;&nbsp;
  <a href="/MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>&nbsp;&nbsp;
</p>
</body>
</html>
