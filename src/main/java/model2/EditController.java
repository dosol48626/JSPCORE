package model2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.FileUtil;

import java.io.IOException;
@WebServlet("/mvcboard/edit.do")
@MultipartConfig(
        maxFileSize = 1024*1024*5,
        maxRequestSize = 1024*1024*10
)
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int idx = Integer.parseInt(req.getParameter("idx"));
        MVCBoardDAO dao = new MVCBoardDAO("mysql");
        MVCBoardDTO dto = dao.selectOne(idx);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/ch14/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String saveDirectory=req.getServletContext().getRealPath("/Uploads");
        String originalFileName="";

        try{
            originalFileName = FileUtil.uploadFile(req, saveDirectory);
        }catch(Exception e){
            e.printStackTrace();
        }
        int idx = Integer.parseInt(req.getParameter("idx"));
        String prevOfile=req.getParameter("prevOfile");
        String prevSfile=req.getParameter("prevSfile");
        String name=req.getParameter("name");
        String title=req.getParameter("title");
        String content=req.getParameter("content");
        HttpSession session=req.getSession();
        String pass=(String)session.getAttribute("pass");
        MVCBoardDTO dto=new MVCBoardDTO();
        dto.setIdx(idx);
        dto.setName(name);
        dto.setPass(pass);
        dto.setTitle(title);
        dto.setContent(content);
        if(originalFileName!=""){
            String saveFileName=FileUtil.renameFile(saveDirectory, originalFileName);
            dto.setOfile(originalFileName);
            dto.setSfile(saveFileName);
        }else{
            dto.setOfile(prevOfile);
            dto.setSfile(prevSfile);
        }
        MVCBoardDAO dao = new MVCBoardDAO("mysql");
        int result=dao.updatePost(dto);
        dao.close();
        if(result==1){
            session.removeAttribute("pass");
            resp.sendRedirect("/mvcboard/view.do?idx="+idx);
        }else{
            req.setAttribute("errorMsg", "데이터 수정 실패");
            req.getRequestDispatcher("/ch14/edit.jsp").forward(req, resp);
        }


    }
}
