<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-19
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>ELTest03 페이지</h2>
<ul>
    <li>페이지 영역 : ${pageScope.scopeValue}</li>
    <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
    <li>세션 영역 : ${sessionScope.scopeValue}</li>
    <li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
</ul>
<h2> 영역 지정 없이 속성 읽기</h2>
<ul>
    <li>${scopeValue}</li>
</ul>
<a href="ELTest04.jsp">ELTest04.jsp</a>
</body>
</html>
