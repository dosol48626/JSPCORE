<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  pageContext.setAttribute("scopeValue","페이지 영역");
  request.setAttribute("scopeValue","리퀘스트 영역");
  session.setAttribute("scopeValue","세션 영역");
  application.setAttribute("scopeValue","애플리케이션 영역");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>ELTest02 페이지</h2>
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
<jsp:forward page="ELTest03.jsp"></jsp:forward>
</body>
</html>
