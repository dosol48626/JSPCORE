package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

import java.io.IOException;

@WebServlet("/member/login.do")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/member/LoginFrom.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        MemberDAO dao = new MemberDAO("mysql");

        MemberDTO member = dao.getMember(id,pass);
        System.out.println(member);
        if(member != null) {
            req.getSession().setAttribute("member", member);
        }else{
            req.setAttribute("errorMsg","로그인 실패");
        }
        req.getRequestDispatcher("/member/LoginFrom.jsp").forward(req, resp);
    }
}
