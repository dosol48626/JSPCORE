<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-26
  Time: 오전 11:35
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
<h2>FileList page</h2>
<a href="/fileupload/Upload.do">file upload form</a>
<table border="1">
    <tr>
        <td>No</td>
        <td>제목</td>
        <td>카테고리</td>
        <td>원본파일명</td>
        <td>저장된파일명</td>
        <td>작성일</td>
        <td>-</td>
    </tr>
    <c:forEach items="${dtoList1}" var="dto">
        <tr>
            <td>${dto.idx}</td>
            <td>${dto.title}</td>
            <td>${dto.cate}</td>
            <td>${dto.ofile}</td>
            <td>${dto.sfile}</td>
            <td><fmt:formatDate value="${dto.postdate}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
            <td><a href="/fileupload/Download.do?sName=${dto.sfile}&oName=${dto.ofile}">다운로드</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
