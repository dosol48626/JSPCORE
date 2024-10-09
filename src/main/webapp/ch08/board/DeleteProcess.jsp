<%@ page import="model1.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  int num=Integer.parseInt(request.getParameter("num"));
  BoardDAO dao = new BoardDAO("MySQL");
  int result=dao.deleteBoard(num);
  if(result==1){
    response.sendRedirect("List.jsp");
  }else{
    response.sendRedirect("View.jsp?num="+num);
  }

%>

