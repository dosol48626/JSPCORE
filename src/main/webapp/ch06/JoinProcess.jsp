<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-12
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");
  String name = request.getParameter("name");
  JDBConnect jdbc = new JDBConnect("MySQL");
  String sql = "insert into member(id,pass, name) values(?,?,?)";
  String sql1="update member set pass=? where id=?";
  String sql3="delete from member where id=?";
  try {
    PreparedStatement ps = jdbc.con.prepareStatement(sql);
    ps.setString(1, id);
    ps.setString(2, pass);
    ps.setString(3, name);
    int inResult = ps.executeUpdate();
    if (inResult == 1) {
      response.sendRedirect("LoginForm.jsp");
    } else {
      request.setAttribute("error", "입력오류");
      request.getRequestDispatcher("JoinForm.jsp").forward(request, response);
    }
  }catch (Exception e){
    e.printStackTrace();
  }
  jdbc.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
