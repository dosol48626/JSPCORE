<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String str1 = "JSP";
  String str2 = "안녕하세요..";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>first page</h2>
  <P>
    <%
      out.println(str2 + str1 + "입니다. 화이팅");
    %>
  </P>
</body>
</html>
