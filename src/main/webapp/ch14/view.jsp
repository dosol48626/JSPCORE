<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-27
  Time: 오후 3:37
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
<h2>파일 첨부형 게시판-상세보기</h2>
<table border="1" width="80%">
    <colgroup>
        <col width="15%"/><col width="35%"/>
        <col width="15%"/><col width="*"/>
    </colgroup>
    <tr>
        <th>번호</th><td>${dto.idx}</td>
    </tr>
    <tr>
        <th>제목</th><td>${dto.title}</td>
    </tr>
    <tr>
    <th>내용</th>
        <td>
            ${dto.content}
            <c:if test="${not empty dto.ofile and isImage eq true}">
                <br><img src="/Uploads/${dto.sfile}" style="max-width: 90%;">
            </c:if>
        </td>
    </tr>
    <tr>
        <th>첨부파일</th>
        <td>
            <c:if test="${not empty dto.ofile}">
                ${dto.ofile}
                <a href="/mvcboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">다운로드</a>
            </c:if>
        </td>
    </tr>
    <tr>
        <th>작성자</th><td>${dto.name}</td>
    </tr>
    <tr>
        <th>첨부파일</th><td>${dto.ofile}</td>
    </tr>
    <tr>
        <th>다운로드 수</th><td>${dto.downcount}</td>
    </tr>
    <tr>
        <th>조회수</th><td>${dto.visitcount}</td>
    </tr>
    <tr>
        <th>작성일</th><td>${dto.postdate}</td>
    </tr>
    <tr>
        <td colspan="2">
            <button onclick="location.href='/mvcboard/pass.do?idx=${dto.idx}&mode=edit'">수정</button>
            <button onclick="location.href='/mvcboard/pass.do?idx=${dto.idx}&mode=delete'">삭제</button>
            <button onclick="location.href='/mvcboard/list.do'">목록보기</button>
        </td>
    </tr>

</table>
</body>
</html>
