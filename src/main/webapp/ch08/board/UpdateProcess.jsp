<%@ page import="model1.BoardDTO" %>
<%@ page import="model1.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
   int num=Integer.parseInt(request.getParameter("num"));
   String title=request.getParameter("title");
   String content=request.getParameter("content");
   //String id=request.getParameter("id");
    BoardDTO board=new BoardDTO();
    //board.setId(id);
    board.setNum(num);
    board.setTitle(title);
    board.setContent(content);

    BoardDAO dao=new BoardDAO("MySQL");
    int result=dao.updateBoard(board);
    dao.close();

    if(result==1){
        response.sendRedirect("View.jsp?num="+num);
    }else{
        response.sendRedirect("Edit.jsp?num="+num);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
