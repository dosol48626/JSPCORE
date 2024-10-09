<%@ page import="model1.BoardDAO" %>
<%@ page import="model1.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int num=Integer.parseInt(request.getParameter("num"));
  BoardDAO dao = new BoardDAO("MySQL");
  BoardDTO dto = dao.selectByNum(num);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>글수정 페이지</h2>
<form action="UpdateProcess.jsp" method="post">
  <input type="hidden" name="num" value="<%=num%>">
  <table>
    <tr>
      <td>제목</td>
      <td><input type="text" name="title" value="<%=dto.getTitle()%>"></td>
    </tr>
    <tr>
      <td>내용</td>
      <td><textarea name="content" cols="30" rows="5">
        <%=dto.getContent()%>
      </textarea></td>
    </tr>
    <tr>
      <td>작성자</td>
      <td><input type="text" name="id" value="<%=dto.getId()%>" readonly></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="글수정">
        <input type="reset" value="취소">
        <input type="button" value="목록보기" onclick="location.href='List.jsp'">
      </td>
    </tr>
  </table>

</form>

</body>
</html>
