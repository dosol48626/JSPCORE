<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Cookie cookie = new Cookie("myCookie", "deliciouse");
  cookie.setPath(request.getContextPath());
  cookie.setMaxAge(3600);
  response.addCookie(cookie);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    Cookie[] cookies = request.getCookies();
    if (cookies != null){
      for (int i = 0; i< cookies.length; i++){
        String cookieName = cookies[i].getName();
        String cookieValue = cookies[i].getValue();
        out.println(cookieName + cookieValue);
      }
    }
  %>
</body>
</html>
