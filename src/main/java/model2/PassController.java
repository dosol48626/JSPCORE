package model2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("mode",req.getParameter("mode"));
        //req.setAttribute("idx", req.getParameter("idx"));
        req.getRequestDispatcher("/ch14/pass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int idx=Integer.parseInt(req.getParameter("idx"));
        String pass=req.getParameter("pass");
        String mode=req.getParameter("mode");
        MVCBoardDAO dao=new MVCBoardDAO("mysql");
        boolean confirmed=dao.confirmPassword(pass, idx);
        dao.close();
        if(confirmed){
            if(mode.equals("edit")){
                HttpSession session=req.getSession();
                session.setAttribute("pass",pass);
                resp.sendRedirect("/mvcboard/edit.do?idx="+idx);
            }else if(mode.equals("delete")){
                dao=new MVCBoardDAO("mysql");
                //MVCBoardDTO dto=dao.selectOne(idx);
                int result=dao.deletePost(idx);
                if(result==1){
                    resp.sendRedirect("/mvcboard/list.do");
                }else{
                    resp.sendRedirect("/mvcboard/view.do?idx="+idx);
                }
                dao.close();


            }

        }

    }
}
