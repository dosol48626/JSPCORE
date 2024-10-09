<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    LinkedList<String> lists = new LinkedList<String>();
    lists.add("홍길동");
    lists.add("신인선");
    lists.add("용은혜");

    Map<String, Integer> maps = new HashMap<>();
    maps.put("홍길동", 85);
    maps.put("신인선", 90);
    maps.put("용은혜",85);
%>
<c:set var="names" value="<%=lists%>"/>
<c:forEach items="${names}" var="name">
    <p>이름 : ${name}</p>
</c:forEach>
<c:forEach items="<%=maps%>" var="map">
    Key:${map.key}, Value: ${map.value}<br/>
</c:forEach>
</body>
</html>
