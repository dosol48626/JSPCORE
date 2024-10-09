<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    //방법 1
    session.removeAttribute("userId");
    session.removeAttribute("userName");

    //방법2
    session.invalidate();
    response.sendRedirect("LoginFrom.jsp");
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
