<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-30
  Time: 오전 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <script type="text/javascript">
    function validateForm(form) {
      if (form.pass.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pass.focus();
        return false;
      }
    }
  </script>
</head>
<body>
<h2>파일첨부현 게시판-비밀번호 검증(Pass)</h2>
<form name="writeFrm" method="post" action="/mvcboard/pass.do"
      onsubmit="return validateForm(this);">
  <input type="hidden" name="idx" value="${param.idx}"> <%--view.jsp param--%>
  <input type="hidden" name="mode" value="${mode}"> <%--passController의 request 객체 속성--%>
  <table border="1" width="80%">
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pass" style="width: 100px;"></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <button type="submit">검증하기</button>
        <button type="reset">RESET</button>
        <button type="button" onclick="location.href='/mvcboard/list.do'">
          목록보기
        </button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
