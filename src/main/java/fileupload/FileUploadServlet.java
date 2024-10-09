package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.FileUtil;

import java.io.IOException;
@WebServlet("/fileupload/Upload.do")
@MultipartConfig(
        maxFileSize = 1024*1024*5,
        maxRequestSize = 1024*1024*10
)
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/ch13/FileUploadMain.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String saveDirectory="C:/dosol/JSP/core/src/main/webapp/Uploads";
        //String saveDirectory="C:/dosol/jsp_pro/JDBCPro/src/main/webapp/Uploads";
        //String saveDirectory = getServletContext().getRealPath("/Uploads");
        try {
            System.out.println("saveDir:" + saveDirectory);
            // 파일업로드
            String originalFileName = FileUtil.uploadFile(req, saveDirectory);
            // 업로드된 파일 이름 변경
            String saveFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            int result=insertMyFile(req, originalFileName, saveFileName);
            if(result>0){
                resp.sendRedirect("/fileupload/FileList.do");
            }

        }catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "파일업로드 오류");
            req.getRequestDispatcher("/ch13/FileUploadMain.jsp").forward(req, resp);
        }
    }

    int insertMyFile(HttpServletRequest req, String originalFileName, String saveFileName) {
        String title = req.getParameter("title");
        String[] cateArr = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
        if (cateArr == null) {
            cateBuf.append("선택항목이 없음");
        } else {
            for (String s : cateArr) {
                cateBuf.append(s);
            }
        }
        System.out.println("파일외 폼 값:" + title + cateBuf.toString());

        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(originalFileName);
        dto.setSfile(saveFileName);

        MyFileDAO dao = new MyFileDAO("MySQL");
        int result = dao.insertFile(dto);
        dao.close();
        return result;
    }
}

