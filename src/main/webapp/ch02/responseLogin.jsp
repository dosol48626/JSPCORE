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
    String id = request.getParameter("user_id");
    String pwd = request.getParameter("user_pwd");
    if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
      response.sendRedirect("ResponseWelcome.jsp");
    }else {
      request.getRequestDispatcher("responseMain.jsp?loginErr=1").forward(request, response);
    }
  %>
</body>
</html>
