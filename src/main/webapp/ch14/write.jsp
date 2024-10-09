<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-27
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            if (form.name.value == "") {
                alert("작성자를 입력하세요.");
                form.name.focus();
                return false;
            }
            if (form.title.value == "") {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            }
            if (form.content.value == "") {
                alert("내용을 입력하세요.");
                form.content.focus();
                return false;
            }
            if (form.pass.value == "") {
                alert("비밀번호를 입력하세요.");
                form.pass.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<h2>파일 첨부형 게시판 -글쓰기</h2>
<c:if test="${not empty errorMsg}">
    ${errorMsg}
</c:if>
<form method="post" enctype="multipart/form-data" action="/mvcboard/write.do"
      onsubmit="validateForm(this)">
    <table border="1" width="80%">
        <tr>
            <th>작성자</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" style="width: 80%;height: 100%;"></textarea></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td><input type="file" name="ofile"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">작성완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='/mvcboard/list.do'">목록보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
