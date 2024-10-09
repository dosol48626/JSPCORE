<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>MemberDTO 객체 활용</h3>
<ul>
    <li>name : ${dto.name}</li>
    <li>id : ${dto.id}</li>
    <li>pass : ${dto.pass}</li>
    <li>regidate : ${dto.regidate}</li>
</ul>
</body>
</html>
