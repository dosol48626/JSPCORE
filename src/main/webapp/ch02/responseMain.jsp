<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  // loginErr 파라미터 확인
  String loginErr = request.getParameter("loginErr");
  if (loginErr != null && loginErr.equals("1")) {
%>
<p style="color:red;">로그인 오류: 잘못된 사용자 ID 또는 비밀번호입니다.</p>
<%
  }
%>
  <form action="responseLogin.jsp" method="post">
    id : <input type="text" name="user_id"><br/>
    pwd : <input type="text" name="user_pwd"><br/>
    <input type="submit"><br/>
  </form>
</body>
</html>
