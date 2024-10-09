<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-23
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>여러 요청을 한번에 처리하기</h2>
${resultValue}
<ol>
    <li>URI :${uri}</li>
    <li>요청명 :${commandStr}</li>
</ol>
<ul>
    <li><a href="../servlet/regist.one">회원가입</a></li>
    <li><a href="../servlet/login.one">로그인</a></li>
    <li><a href="../servlet/freeboard.one">자유게시판</a></li>
</ul>
</body>
</html>
