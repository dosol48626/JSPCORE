<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 2:28
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
<h4>로케일 설정</h4>
<c:set var="today" value="<%=new Date() %>"/>
한글로 설정 :<fmt:setLocale value="ko_kr"/>
<fmt:formatNumber value="10000" type="currency"/>
<fmt:formatDate value="${today}" /><br/>

일어로 설정 :<fmt:setLocale value="ja_JP"/>
<fmt:formatNumber value="10000" type="currency"/>
<fmt:formatDate value="${today}" /><br/>

영어로 설정 :<fmt:setLocale value="en_US"/>
<fmt:formatNumber value="10000" type="currency"/>
<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br/>
</body>
</html>






