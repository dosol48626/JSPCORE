package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

import java.io.IOException;

@WebServlet("*.m")
public class MemberServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        System.out.println("uri:"+uri);
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);
        System.out.println("commandStr:"+commandStr);
        if (commandStr.equals("/joinForm.m")) {
            joinFormFunc(req, resp);
        }else if (commandStr.equals("/joinProcess.m")) {
            joinProcess(req, resp);
        }else if (commandStr.equals("/loginForm.m")) {
            loginFormFunc(req, resp);
        }else if (commandStr.equals("/loginProcess.m")) {
            loginProcess(req, resp);
        }
    }

    void joinFormFunc(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {
        System.out.println("joinFormFunc");
        req.getRequestDispatcher("/member/JoinForm.jsp").forward(req,resp);
    }
    void joinProcess(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        String name = req.getParameter("name");
        MemberDTO dto = new MemberDTO();
        dto.setId(id);
        dto.setPass(pass);
        dto.setName(name);
        MemberDAO dao = new MemberDAO("mysql");
        int result=dao.insertMember(dto);
        if(result==1){
            resp.sendRedirect("/member/loginForm.m");
        }else {
            req.setAttribute("errorMsg","회원가입 실패");
            req.getRequestDispatcher("/member/JoinForm.jsp").forward(req,resp);
        }
    }
    void loginFormFunc(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        req.getRequestDispatcher("/member/LoginFrom.jsp").forward(req,resp);
    }
    void loginProcess(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        MemberDAO dao = new MemberDAO("mysql");
        MemberDTO dto=dao.getMember(id,pass);
        System.out.println("dto:"+dto);
        if(dto!=null){
            req.getSession().setAttribute("member",dto);
        }else{
            req.setAttribute("errorMsg","로그인 실패");
        }
        req.getRequestDispatcher("/member/LoginFrom.jsp").forward(req,resp);
    }

}
