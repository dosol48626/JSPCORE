<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>쿠키값 확인하기</h2>
  <%
    Cookie[] cookies = request.getCookies();
    if (cookies != null){
      for (int i = 0; i< cookies.length; i++){
        String cookieName = cookies[i].getName();
        String cookieValue = cookies[i].getValue();
        out.println(String.format("쿠키명 : %s - 쿠키값 : %s<br/>",
                cookieName, cookieValue));
      }
    }
  %>
</body>
</html>
