<%@ page import="model1.BoardDAO" %>
<%@ page import="model1.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  int num=Integer.parseInt(request.getParameter("num"));
  BoardDAO dao = new BoardDAO("MySQL");
  dao.updateVisitCount(num);
  BoardDTO dto=dao.selectByNum(num);
  dao.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>게시물 상세보기(View)</h2>
<form name="writeFrm">
  <input type="hidden" name="num" value="<%=num%>">
  <table>
    <tr>
      <td>번호</td>
      <td><%=dto.getNum()%></td>
    </tr>
    <tr>
      <td>작성자</td>
      <td><%=dto.getId()%></td>
    </tr>
    <tr>
      <td>작성일</td>
      <td><%=dto.getPostdate()%></td>
    </tr>
    <tr>
      <td>조회수</td>
      <td><%=dto.getVisitcount()%></td>
    </tr>
    <tr>
      <td>제목</td>
      <td><%=dto.getTitle()%></td>
    </tr>
    <tr>
      <td>내용</td>
      <td><%=dto.getContent()%></td>
    </tr>
    <tr>
      <td colspan="2">
        <%--<%
          if(session.getAttribute("UserId").toString().equals(dto.getId())){
        %>--%>
        <c:set var="dto" value="<%=dto%>"/>
        <c:if test="${UserId eq dto.id}">
          <button type="button" onclick="location.href='Edit.jsp?num=<%=num%>'">수정하기</button>
          <button type="button" onclick="location.href='DeleteProcess.jsp?num=<%=num%>'">삭제하기</button>
        </c:if>
          <%--<%}%>--%>
        <button type="button" onclick="location.href='List.jsp'">목록보기</button>
      </td>
    </tr>
  </table>
</form>

</body>
</html>
