<%@ page import="model1.BoardDAO" %>
<%@ page import="model1.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String title=request.getParameter("title");
    String content=request.getParameter("content");
    String id=(String)session.getAttribute("UserId");
    BoardDTO dto=new BoardDTO();
    dto.setId(id);
    dto.setTitle(title);
    dto.setContent(content);
    //BoardDAO dao=new BoardDAO();
    BoardDAO dao=new BoardDAO("mysql");
    int inResult=dao.insertWrite(dto);
    dao.close();

    if(inResult==1){
        response.sendRedirect("List.jsp");
    }else{
//        JSFunction.alertBack("글쓰기 실패");
        request.setAttribute("errMsg","데이터 입력실패");
        request.getRequestDispatcher("Write.jsp").forward(request,response);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
