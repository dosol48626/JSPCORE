package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

import java.io.IOException;

@WebServlet("/MemberAuth.mvc")
public class MemberAuth extends HttpServlet {
    private static final long serialVersionUID = 1L;
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        dao=new MemberDAO("MySQL");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        String pass=req.getParameter("pass");
        MemberDTO member=new MemberDTO();
        member.setId(id);
        member.setPass(pass);
        MemberDTO memberDTO=dao.getMember2(member);

        String memberName=memberDTO.getName();
        if(memberName!=null){
            if(id.equals("abcd")){
                req.setAttribute("authMessage",id +"님은 회고 관리자입니다.");
            }else {
                req.setAttribute("authMessage", memberName + " 회원님 방가방가^^^~~");
            }
        }else {
            req.setAttribute("authMessage","귀하는 비회원입니다.");
        }
        req.getRequestDispatcher("/ch12/MemberAuth.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        dao.close();
    }
}
