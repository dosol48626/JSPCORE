package model2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.FileUtil;

import java.io.IOException;
@WebServlet("/mvcboard/write.do")
@MultipartConfig(
        maxFileSize = 1024*1024*5,
        maxRequestSize = 1024*1024*10
)
public class WriterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/ch14/write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String saveDirectory = req.getServletContext().getRealPath("/Uploads");

        // 파일 업로드
        String originalFilename = "";
        try{
            originalFilename= FileUtil.uploadFile(req, saveDirectory);
        }catch(Exception e){
            req.setAttribute("errorMsg","파일 업로드 실패");
            req.getRequestDispatcher("/ch14/write.jsp").forward(req, resp);
        }
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setName(req.getParameter("name"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setPass(req.getParameter("pass"));
        if(!originalFilename.equals("")){
            String savedFileName=FileUtil.renameFile(saveDirectory, originalFilename);
            dto.setOfile(originalFilename);
            dto.setSfile(savedFileName);
        }
        MVCBoardDAO dao = new MVCBoardDAO("mysql");
        int result=dao.insertWrite(dto);
        dao.close();
        if(result==1){
            resp.sendRedirect("/mvcboard/list.do");
        }else {
            req.setAttribute("errorMsg","글저장 실패");
            req.getRequestDispatcher("/ch14/write.jsp").forward(req, resp);
        }
    }
}
