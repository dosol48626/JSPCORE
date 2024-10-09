<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>JoinForm</title>
</head>
<body>
${errorMsg}
<%--<%=request.getAttribute("error")%>--%>
<form action="/member/joinProcess.m" method="post">
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
