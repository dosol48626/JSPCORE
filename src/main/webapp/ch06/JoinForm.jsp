<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-12
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>JoinForm</title>
</head>
<body>
<%=request.getAttribute("error")%>
<form action="JoinProcess.jsp" method="post">
    <table>
        <tr>
            <td>아이디</td><td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>패스워드</td><td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>이름</td><td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="join">
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
