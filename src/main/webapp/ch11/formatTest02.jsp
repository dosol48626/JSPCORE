<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="today" value="<%=new Date()%>"/>
<h4>날짜 포맷</h4>
full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br/>
short : <fmt:formatDate value="${today}" type="date" dateStyle="short"/><br/>
long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/><br/>
default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/><br/>

<h4>시간 포맷</h4>
full : <fmt:formatDate value="${today}" type="time" dateStyle="full"/><br/>
short : <fmt:formatDate value="${today}" type="time" dateStyle="short"/><br/>
long : <fmt:formatDate value="${today}" type="time" dateStyle="long"/><br/>
default : <fmt:formatDate value="${today}" type="time" dateStyle="default"/><br/>

<h4>both 포맷</h4>
full : <fmt:formatDate value="${today}" type="both" dateStyle="full"/><br/>
short : <fmt:formatDate value="${today}" type="both" dateStyle="short"/><br/>
long : <fmt:formatDate value="${today}" type="both" dateStyle="long"/><br/>
default : <fmt:formatDate value="${today}" type="both" dateStyle="default"/><br/>

<h4>패턴 사용</h4>
<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
</body>
</html>
