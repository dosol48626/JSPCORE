package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

import java.io.IOException;

@WebServlet("/member/join.do")
public class JoinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/member/JoinForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        MemberDTO memberDTO=new MemberDTO();
        memberDTO.setName(name);
        memberDTO.setId(id);
        memberDTO.setPass(pass);
        MemberDAO dao = new MemberDAO("mysql");
        int inResult=dao.insertMember(memberDTO);
        dao.close();

        if(inResult==1){
            resp.sendRedirect("/member/login.do");
        }else {
            req.setAttribute("errorMsg","회원가입 실패");
            req.getRequestDispatcher("/member/JoinForm.jsp").forward(req, resp);

        }
    }
}
