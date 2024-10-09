package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("*.one")
public class FrontServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf('/');
        String commandStr=uri.substring(lastSlash);
        if(commandStr.equals("/regist.one")){
            registFunc(req);
        }else if(commandStr.equals("/login.one")){
            loginFunc(req);
        }else if(commandStr.equals("/freeboard.one")){
            freeboardFunc(req);
        }

        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.getRequestDispatcher("/ch12/FrontController.jsp").forward(req, resp);
    }
    void registFunc(HttpServletRequest req){
        req.setAttribute("resultValue", "<h2>회원가입</h2>");
    }
    void loginFunc(HttpServletRequest req){
        req.setAttribute("resultValue", "<h2>로그인</h2>");
    }
    void freeboardFunc(HttpServletRequest req){
        req.setAttribute("resultValue", "<h2>자유게시판</h2>");
    }
}
