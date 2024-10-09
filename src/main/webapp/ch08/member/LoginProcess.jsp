<%@ page import="common.JDBConnect" %>
<%@ page import="membership.MemberDAO" %>
<%@ page import="membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  String userId=request.getParameter("user_id");
  String userPw=request.getParameter("user_pw");

  MemberDAO dao = new MemberDAO("MySQL");
  MemberDTO dto = dao.getMember(userId, userPw);
  dao.close();

  if(dto.getId() !=null){
    session.setAttribute("UserId",dto.getId());
    session.setAttribute("UserName",dto.getName());
    //session.setAttribute("member",dto);
    response.sendRedirect("../board/Write.jsp");
  }else{
    request.setAttribute("LoginErrMag","로그인 실패");
    request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
  }
%>
