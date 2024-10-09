<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Login Form page</title>
</head>
<body>
<%
  if(session.getAttribute("UserId") ==null){
%>
<form action="LoginProcess.jsp" method="post">
  아이디 : <input type="text" name="user_id"><br/>
  패스워드 : <input type="password" name="user_pw"><br/>
  <input type="submit" value="로그인하기">
  <input type="button" value="회원가입" onclick="location.href='JoinForm.jsp'">
</form>
<%
  }else{
%>
<%=session.getAttribute("UserId") %> 회원님, 로그인하셨습니다.<br/>
<a href="Logout.jsp">로그아웃</a>
<%
  }
%>

</body>
</html>
