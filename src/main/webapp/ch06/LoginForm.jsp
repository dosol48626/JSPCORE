<%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-05
  Time: 오전 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        if(session.getAttribute("userId") ==null){
    %>
    <form action="LoginProcess.jsp" method="post">
        아이디 : <input type="text" name="user_id"><br/>
        패스워드 : <input type="password" name="user_pw"><br/>
        <input type="submit" value="로그인하기">
        <input type="button" value="회원가입" onclick="location.href='JoinForm.jsp'">
    </form>
    <%
    }else{
    %>
    <%=session.getAttribute("userId") %> 회원님, 로그인하셨습니다.<br/>
    <a href="Logout.jsp">로그아웃</a>
    <%
        }
    %>
</body>
</html>
