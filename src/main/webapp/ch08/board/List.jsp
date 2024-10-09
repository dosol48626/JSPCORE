<%@ page import="model1.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model1.BoardDTO" %><%--
  filename : List.jsp
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-13
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  BoardDAO dao = new BoardDAO("MySQL");
  //BoardDAO dao = new BoardDAO();
  int totalCount=dao.selectCount();
  List<BoardDTO> boardLists=dao.selectAll();
  dao.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>게시물 갯수 : <%=totalCount%></h3>
<button type="button" onclick="location.href='Write.jsp'">글작성</button>
<table>
<%--<%
  if(boardLists.isEmpty()){
%>--%>
<c:set var="boardList" value="<%=boardLists%>"/>
<c:choose>
    <c:when test="${empty boardList }">
    <tr>
      <td colspan="5" align="center">
        등록된 게시물이 없습니다.
      </td>
    </tr>
    </c:when>
    <c:otherwise>
<%--<%
  }else{
%>--%>
 <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성자</th>
   <th>조회수</th>
   <th>작성일</th>
 </tr>
<%--<%
    for(BoardDTO board : boardLists){
%>--%>
 <c:forEach items="${boardList}" var="board">
  <tr>
      <td>${board.num}</td>
      <td><a href="View.jsp?num=${board.num}">${board.title}</a></td>
      <td>${board.id}</td>
      <td>${board.visitcount}</td>
      <td><fmt:formatDate value="${board.postdate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
  </tr>
 </c:forEach>
 </c:otherwise>
</c:choose>
<%--<%
    }
  }
%>--%>
</table>

</body>
</html>
