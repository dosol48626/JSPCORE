<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        try{
            int myAge = Integer.parseInt(request.getParameter("age")) + 10;
            out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
        } catch (Exception e) {
            out.println("예외 발생 : 매개 변수 age가 null 입니다.");
        }
    %>
</body>
</html>
