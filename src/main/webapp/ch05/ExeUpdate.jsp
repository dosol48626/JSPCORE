<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  JDBConnect jdbc=new JDBConnect("MySQL");
  String id="w";
  String pass="1234";
  String name="w";

  String sql1="insert into member(id, pass, name) values('test1', '1111','test1')";
  String sql2="insert into member(id, pass, name) values('"+id+"','"+pass+"','"+name+"')";
  String sql3="insert into member(id,pass, name) values(?,?,?)";
  //Statement stmt=jdbc.con.createStatement();
  //int inResult=stmt.executeUpdate(sql2);
  PreparedStatement pstmt=jdbc.con.prepareStatement(sql3);
  pstmt.setString(1,id);
  pstmt.setString(2, pass);
  pstmt.setString(3, name);
  int inResult=pstmt.executeUpdate();
  jdbc.close();
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
데이터 입력 갯수 : <%=inResult%><br/>
</body>
</html>
