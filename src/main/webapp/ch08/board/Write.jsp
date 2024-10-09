<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  if(session.getAttribute("UserId")==null){
    response.sendRedirect("../member/LoginFrom.jsp");
  }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>글작성 페이지</h2>
<form action="WriteProcess.jsp" method="post">
  <table>
    <tr>
      <td>제목</td>
      <td><input type="text" name="title"></td>
    </tr>
    <tr>
      <td>내용</td>
      <td><textarea name="content" cols="30" rows="5"></textarea></td>
    </tr>
    <%--<tr>
      <td>작성자</td>
      <td><input type="text" name="id"></td>
    </tr>--%>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="글작성">
        <input type="reset" value="취소">
        <input type="button" value="목록보기" onclick="location.href='List.jsp'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
