<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-19
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>영역을 통해 전달된 객체 읽기</h2>
<ul>
    <li>ID : ${member.id}</li>
    <li>PASS : ${member.pass}</li>
    <li>NAME : ${member.name}</li>
    <li>REGI Date:${member.regidate}</li>
    <li>String 객체 : ${stringObj}</li>
    <li>Integer 객체: ${integerObj}</li>
</ul>
<h2>매개 변수로 전달된 값</h2>
<ul>
    <li>${param.firstNum+ param.secondNum}</li>
    <li>${param.secondNum-param.firstNum}</li>
</ul>
</body>
</html>
