<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.JDBCType" %>
<%@ page import="common.JDBConnectPool" %><%--
  Created by IntelliJ IDEA.
  User: dosol
  Date: 2024-10-03
  Time: 오후 5:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
    <h2>JDBC TEST</h2>
    <%
      JDBConnect jdbc1 = new JDBConnect();
      jdbc1.close();
    %>

    <%
      String driver = application.getInitParameter("OracleDriver");
      String url = application.getInitParameter("OracleURL");
      String id = application.getInitParameter("OracleId");
      String pwd = application.getInitParameter("OraclePwd");

      JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
      jdbc2.close();
    %>

    <%
      JDBConnect jdbc3 = new JDBConnect(application);
      jdbc3.close();
    %>
    <h2>Connection Pool</h2>
    <%
      JDBConnectPool pool = new JDBConnectPool();
      pool.close();
    %>
  </body>
</html>
