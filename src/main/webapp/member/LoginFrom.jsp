<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Login Form page</title>
</head>
<body>
<c:choose>
  <c:when test="${empty member}">
    <form action="/member/loginProcess.m" method="post">
      아이디 : <input type="text" name="id"><br/>
      패스워드 : <input type="password" name="pass"><br/>
      <input type="submit" value="로그인하기">
      <input type="button" value="회원가입" onclick="location.href='JoinForm.jsp'">
    </form>
  </c:when>
  <c:otherwise>
    ${member.id}(${member.name})회원님, 로그인하셨습니다.
    <a href="Logout.jsp">로그아웃</a><br/>
  </c:otherwise>
</c:choose>
</body>
</html>
