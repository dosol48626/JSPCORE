<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-27
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>a{text-display: none;}</style>
</head>
<body>
<h2>파일 첨부형 게시판 : 목록보기</h2>
<h3>totalCount: ${map.get("totalCount")}</h3>
<form method="get">
    <table border="1" width="90%">
        <tr>
            <td align="center">
                <select name="searchField">
                    <option value="title">title</option>
                    <option value="content">content</option>
                </select>
                <input type="text" name="searchWord">
                <input type="submit" value="검색하기">
            </td>
        </tr>
    </table>
</form>

<table border="1" width="90%">
    <tr>
        <th width="10%">번호</th>
        <th width="*">제목</th>
        <th width="15%">작성자</th>
        <th width="10%">조회수</th>
        <th width="15%">작성일</th>
    </tr>
    <c:choose>
        <c:when test="${empty boardList}">
            <tr>
                <td colspan="5">등록된 게시글이 없습니다.</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach items="${boardList}" var="row">
                <tr>
                    <td>${row.idx}</td>
                    <td><a href="/mvcboard/view.do?idx=${row.idx}">${row.title}</a></td>
                    <td>${row.name}</td>
                    <td>${row.visitcount}</td>
                    <td>${row.postdate}</td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>
<table border="1" width="90%">
    <tr align="center">
        <td>
            ${map.pagingImg}
        </td>
        <td width="100">
            <button type="button" onclick="location.href='/mvcboard/write.do'">글쓰기</button>
        </td>
    </tr>
</table>
</body>
</html>
